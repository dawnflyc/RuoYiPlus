package com.ruoyi.project.common.auth;

import com.alibaba.fastjson.JSONException;
import com.ruoyi.common.exception.ServiceException;
import com.ruoyi.project.common.domain.AuthData;
import com.ruoyi.project.common.service.ApiTokenService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.lang.reflect.Method;

@Component
@Slf4j
public class AuthInterceptor implements HandlerInterceptor {

    @Autowired
    ApiTokenService apiTokenService;

    //    @Autowired
//    IUserService userService;
    private int retry = 0;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        if (!(handler instanceof HandlerMethod)) {
            return true;
        }
        HandlerMethod handlerMethod = (HandlerMethod) handler;
        Method method = handlerMethod.getMethod();
        Class<?> controller = handlerMethod.getBeanType();
        if (!controller.isAnnotationPresent(RequireAuth.class) && !method.isAnnotationPresent(RequireAuth.class)) {
            return true;
        }
        AuthData authData = getAuthData(request);

        if (authData == null) {
            throw new ServiceException("koken不存在", 101);   //因为fastjson 经常autoType is not support.
        }
        if (!authData.verify()) {
            throw new ServiceException("token已过期", 101);
        }
        //User user = userService.selectById(authData.getId()); // 查询user
//        if (user == null) {
//            throw new ServiceException("token失效", 101);
//        }
        apiTokenService.refreshToken(authData);
//        request.setAttribute("user", user);
//        request.setAttribute("id", user.getId());    //user信息放入request
        return true;
    }

    /**
     * 获取token数据
     *
     * @param request
     * @return
     */
    private AuthData getAuthData(HttpServletRequest request) {
        AuthData authData;
        try {
            authData = apiTokenService.getAuthData(request);

        } catch (JSONException e) {
            if (retry < 4) {
                retry++;
                log.info("认证重试");
                return getAuthData(request);
            } else {
                throw new ServiceException("正在加载中...");
            }
        }
        return authData;
    }
}
