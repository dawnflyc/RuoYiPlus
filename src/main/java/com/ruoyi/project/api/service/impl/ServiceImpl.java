package com.ruoyi.project.api.service.impl;

import com.ruoyi.project.common.mapperisolate.ApiMi;
import org.springframework.beans.factory.annotation.Autowired;

public class ServiceImpl<T> {

    protected ApiMi<T> mapper;

    /**
     * 由spring自动注入
     */
    @Autowired
    private void setMi(ApiMi<T> mi) {
        this.getMapper(mi);
    }

    /**
     * 扩展
     */
    protected void getMapper(ApiMi<T> mi) {
        this.mapper = mi;
    }
}
