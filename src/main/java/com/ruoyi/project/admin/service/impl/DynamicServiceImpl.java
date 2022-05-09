package com.ruoyi.project.admin.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.ruoyi.common.extend.mp.conditions.SaveWrapper;
import com.ruoyi.common.utils.spring.SpringUtils;
import com.ruoyi.project.admin.mapper.DynamicMapper;

import java.util.List;
import java.util.Map;

/**
 * 动态服务
 */
public class DynamicServiceImpl {

    /**
     * 动态mapper
     */
    private final DynamicMapper dynamicMapper;

    /**
     * 表名
     */
    private final String table;

    public DynamicServiceImpl(String table) {
        this.table = table;
        this.dynamicMapper = SpringUtils.getBean(DynamicMapper.class);
    }

    /**
     * 根据id查询
     *
     * @param id
     * @return
     */
    public Object selectById(Integer id) {
        return dynamicMapper.dynamicSelectById(table, id);
    }

    /**
     * 查询列表
     *
     * @param wrapper
     * @return
     */
    public List<Map<String, String>> selectList(QueryWrapper wrapper) {
        return dynamicMapper.dynamicSelectList(table, wrapper);
    }

    /**
     * 根据Map查询列表
     *
     * @param data
     * @return
     */
    public List<Map<String, String>> selectListByMap(Map<String, String> data) {
        QueryWrapper queryWrapper = new QueryWrapper();
        for (String key : data.keySet()) {
            if (data.get(key) != null && !data.get(key).equals("")) {
                queryWrapper.eq(key, data.get(key));
            }
        }
        return selectList(queryWrapper);
    }

    /**
     * 插入
     *
     * @param wrapper
     * @return
     */
    public int insert(SaveWrapper wrapper) {
        return dynamicMapper.dynamicInsert(table, wrapper);
    }

    /**
     * 根据Map插入
     *
     * @param data
     * @return
     */
    public int insertByMap(Map<String, String> data) {
        SaveWrapper wrapper = new SaveWrapper();
        wrapper.setMap(data);
        return insert(wrapper);
    }

    /**
     * 修改
     *
     * @param wrapper
     * @return
     */
    public int update(UpdateWrapper wrapper) {
        return dynamicMapper.dynamicUpdate(table, wrapper);
    }

    /**
     * 根据Map修改
     *
     * @param data
     * @return
     */
    public int updateByMap(Map<String, String> data) {
        UpdateWrapper updateWrapper = new UpdateWrapper();
        if (data.containsKey("id")) {
            updateWrapper.eq("id", data.get("id"));
        } else {
            throw new RuntimeException("不能没有id字段");
        }
        for (String key : data.keySet()) {
            if (data.get(key) != null && !data.get(key).equals("") && !"id".equals(data.get(key))) {
                updateWrapper.set(key, data.get(key));
            }
        }
        return update(updateWrapper);
    }

    /**
     * 批量删除
     *
     * @param ids
     * @return
     */
    public int deleteByIds(Integer[] ids) {
        return dynamicMapper.dynamicDeleteByIds(table, ids);
    }

    /**
     * 删除
     *
     * @param id
     * @return
     */
    public int deleteById(Integer id) {
        return dynamicMapper.dynamicDeleteById(table, id);
    }
}
