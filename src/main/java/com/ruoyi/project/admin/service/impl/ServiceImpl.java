package com.ruoyi.project.admin.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.ruoyi.project.admin.service.IService;
import com.ruoyi.project.common.mapperisolate.AdminMi;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Arrays;
import java.util.List;


public class ServiceImpl<T> implements IService<T> {

    AdminMi<T> mapper;


    /**
     * 由spring自动注入
     *
     */
    @Autowired
    private void setAdminMi(AdminMi<T> adminMi) {
        this.getMapper(adminMi);
    }

    /**
     * 扩展,把mapper转换成子类，然后调用子类的方法
     */
    protected void getMapper(AdminMi<T> adminMi) {
        this.mapper = adminMi;
    }

    @Override
    public T selectById(Integer id) {
        return mapper.selectById(id);
    }

    @Override
    public List<T> selectList(T t) {
        return mapper.selectList(new QueryWrapper<>(t));
    }

    @Override
    public int insert(T t) {
        return mapper.insert(t);
    }

    @Override
    public int update(T t) {
        return mapper.updateById(t);
    }

    @Override
    public int deleteByIds(Integer[] ids) {
        return mapper.deleteBatchIds(Arrays.asList(ids));
    }

    @Override
    public int deleteById(Integer id) {
        return mapper.deleteById(id);
    }
}
