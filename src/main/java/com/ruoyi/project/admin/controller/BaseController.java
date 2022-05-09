package com.ruoyi.project.admin.controller;

import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.framework.web.page.TableDataInfo;
import com.ruoyi.project.admin.service.IService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 基础控制器
 * @param <T>
 */
public abstract class BaseController<T> extends com.ruoyi.framework.web.controller.BaseController {

    protected IService<T> service;

    /**
     * 由spring自动注入
     */
    @Autowired
    private void setService(IService<T> service) {
        this.getService(service);
    }

    /**
     * 扩展
     */
    protected void getService(IService<T> service) {
        this.service = service;
    }

    /**
     * 功能名
     *
     * @return
     */
    public abstract String getFunName();

    @GetMapping("/list")
    public TableDataInfo list(T t) {
        startPage();
        List<T> list = service.selectList(t);
        return getDataTable(list);
    }

    @PostMapping("/export")
    public void export(HttpServletResponse response, T t) {
        List<T> list = service.selectList(t);
        ExcelUtil<T> util = new ExcelUtil<T>((Class<T>) t.getClass());
        util.exportExcel(response, list, this.getFunName());
    }

    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Integer id) {
        return AjaxResult.success(service.selectById(id));
    }

    @PostMapping
    public AjaxResult add(@RequestBody T t) {
        return toAjax(service.insert(t));
    }

    @PutMapping
    public AjaxResult edit(@RequestBody T t) {
        return toAjax(service.update(t));
    }

    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Integer[] ids) {
        return toAjax(service.deleteByIds(ids));
    }
}
