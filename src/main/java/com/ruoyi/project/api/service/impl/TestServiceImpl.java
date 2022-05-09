package com.ruoyi.project.api.service.impl;

import com.ruoyi.project.api.mapper.TestMapper;
import com.ruoyi.project.api.service.ITestService;
import com.ruoyi.project.common.domain.Test;
import com.ruoyi.project.common.mapperisolate.ApiMi;

public class TestServiceImpl extends ServiceImpl<Test> implements ITestService {

    TestMapper testMapper;

    @Override
    protected void getMapper(ApiMi<Test> mi) {
        super.getMapper(mi);
        testMapper = (TestMapper) mi;
    }

    @Override
    public String getName(Integer id) {
        return testMapper.selectById(id).getName();
    }
}
