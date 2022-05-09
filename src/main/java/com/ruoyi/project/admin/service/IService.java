package com.ruoyi.project.admin.service;

import java.util.List;

public interface IService<T> {

    T selectById(Integer id);

    List<T> selectList(T t);

    int insert(T t);

    int update(T t);

    int deleteByIds(Integer[] ids);

    int deleteById(Integer id);
}
