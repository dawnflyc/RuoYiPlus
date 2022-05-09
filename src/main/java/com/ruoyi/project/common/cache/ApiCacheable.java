package com.ruoyi.project.common.cache;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;
import java.util.concurrent.TimeUnit;

/**
 * 开启缓存
 */
@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
public @interface ApiCacheable {
    /**
     * key
     *
     * @return
     */
    String key();

    /**
     * 过期时间
     *
     * @return
     */
    int expire();

    /**
     * 过期时间单位
     *
     * @return
     */
    TimeUnit unit() default TimeUnit.SECONDS;

}
