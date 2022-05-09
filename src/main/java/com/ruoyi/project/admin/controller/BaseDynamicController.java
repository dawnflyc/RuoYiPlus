package com.ruoyi.project.admin.controller;

import com.ruoyi.common.exception.ServiceException;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.framework.web.page.TableDataInfo;
import com.ruoyi.project.admin.service.impl.DynamicServiceImpl;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 动态控制器
 */
public abstract class BaseDynamicController extends com.ruoyi.framework.web.controller.BaseController {


    protected DynamicServiceImpl service;

    public BaseDynamicController() {
        this.service = new DynamicServiceImpl(this.getTableName());
    }

    /**
     * 功能名
     *
     * @return 名字
     */
    public abstract String getFunName();

    /**
     * 表名
     */
    protected abstract String getTableName();

    @GetMapping("/list")
    public TableDataInfo list(@RequestParam Map<String, String> data) {
        startPage();
        Map<String, String> param = new HashMap<>(data);
        //删除分页参数
        param.remove("pageNum");
        param.remove("pageSize");
        List<Map<String, String>> list = service.selectListByMap(param);
        return getDataTable(list);
    }

    @PostMapping("/export")
    public void export(HttpServletResponse response, Map<String, String> data) {
        throw new ServiceException("暂不支持导出");
    }

    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Integer id) {
        return AjaxResult.success(service.selectById(id));
    }

    @PostMapping
    public AjaxResult add(@RequestBody Map<String, String> data) {
        return toAjax(service.insertByMap(data));
    }

    @PutMapping
    public AjaxResult edit(@RequestBody Map<String, String> data) {
        return toAjax(service.updateByMap(data));
    }

    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Integer[] ids) {
        return toAjax(service.deleteByIds(ids));
    }


}
