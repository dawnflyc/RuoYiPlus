package com.ruoyi.project.admin.controller

import com.ruoyi.framework.aspectj.lang.annotation.AutoAuth
import com.ruoyi.framework.aspectj.lang.annotation.AutoLog
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController

@RestController
@RequestMapping("/admin/test")
@AutoAuth
@AutoLog
class TestController extends BaseDynamicController {

    @Override
    String getFunName() {
        return "测试"
    }

    @Override
    protected String getTableName() {
        return "my_test"
    }
}
