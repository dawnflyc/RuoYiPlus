package com.ruoyi.project.admin.service;

import com.ruoyi.project.common.domain.Test;

public interface ITestService extends IService<Test> {
    /**
     * 测试能不能扩展service
     *
     * @param id
     * @return
     */
    String getName(Integer id);
}
