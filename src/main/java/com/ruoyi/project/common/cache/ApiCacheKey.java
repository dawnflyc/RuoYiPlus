package com.ruoyi.project.common.cache;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * 标记在控制器上，作为这个控制器所有方法的key
 */
@Target(ElementType.TYPE)
@Retention(RetentionPolicy.RUNTIME)
public @interface ApiCacheKey {
    /**
     * 获取key
     */
    String value();
}
