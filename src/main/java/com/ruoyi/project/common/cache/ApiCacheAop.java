package com.ruoyi.project.common.cache;

import com.ruoyi.framework.redis.RedisCache;
import com.ruoyi.project.common.Constants;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * 接口缓存类
 */
@Aspect
@Component
@Slf4j
public class ApiCacheAop {

    @Autowired
    RedisCache redisCache;

    @Around("execution(com.ruoyi.framework.web.domain.AjaxResult com.ruoyi.project.api.controller.*.*(..)) && @target(apiCacheKey) && @annotation(apiCacheable)")
    public Object cache(ProceedingJoinPoint joinPoint, ApiCacheKey apiCacheKey, ApiCacheable apiCacheable) {
        String name = joinPoint.getSignature().getDeclaringType().getSimpleName() + "." + joinPoint.getSignature().getName();
        String key = Constants.apiCacheKey + apiCacheKey.value() + ":" + apiCacheable.key();
        Object ret = redisCache.getCacheObject(key);
        if (ret == null) {
            try {
                ret = joinPoint.proceed();
            } catch (Throwable e) {
                e.printStackTrace();
            }
            redisCache.setCacheObject(key, ret);
            redisCache.expire(key, apiCacheable.expire(), apiCacheable.unit());
            log.info("接口{}存储了缓存数据", name);
        } else {
            log.info("接口{}使用了缓存数据", name);
        }
        return ret;
    }
}
