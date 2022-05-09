package com.ruoyi.framework.aspectj;

import com.ruoyi.framework.aspectj.lang.annotation.AutoAuth;
import com.ruoyi.framework.security.handle.AuthenticationEntryPointImpl;
import com.ruoyi.framework.security.service.PermissionService;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Locale;

/**
 * 使用asp admin自定义权限
 * <p>
 * 权限字符默认是方法名，getInfo权限字符为query
 */
@Component
@Slf4j
@Aspect
public class PreAuthorizeAsp {

    @Autowired
    PermissionService permissionService;

    @Autowired
    AuthenticationEntryPointImpl authenticationEntryPoint;

    @Around("execution(* com.ruoyi.project.admin.controller.*.*(..)) && @target(autoAuth)")
    public Object asp(ProceedingJoinPoint joinPoint, AutoAuth autoAuth) throws Throwable {
        String className = joinPoint.getTarget().getClass().getSimpleName();
        String methodName = joinPoint.getSignature().getName();
        String cName = className.replace("Controller", "").toLowerCase(Locale.ROOT);
        String mName = methodName;
        if ("getInfo".equals(methodName)) {
            mName = "query";
        }
        String authName = "admin:" + cName + ":" + mName;
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        HttpServletResponse response = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getResponse();
        if (!permissionService.hasPermi(authName)) {
            throw new AccessDeniedException("Access is denied");
        }
        return joinPoint.proceed();
    }

}
