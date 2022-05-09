package com.ruoyi.project.admin.service.impl;

import com.ruoyi.project.admin.service.ITestService;
import com.ruoyi.project.common.domain.Test;
import org.springframework.stereotype.Service;

@Service
public class TestServiceImpl extends ServiceImpl<Test> implements ITestService {
    @Override
    public String getName(Integer id) {
        return mapper.selectById(id).getName();
    }
}
