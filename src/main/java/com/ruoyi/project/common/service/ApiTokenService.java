package com.ruoyi.project.common.service;

import com.ruoyi.common.exception.ServiceException;
import com.ruoyi.common.utils.IdUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.framework.redis.RedisCache;
import com.ruoyi.project.common.domain.AuthData;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import io.jsonwebtoken.SignatureException;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

@Component
@Slf4j
public class ApiTokenService {
    protected static final long MILLIS_SECOND = 1000;
    protected static final long MILLIS_MINUTE = 60 * MILLIS_SECOND;
    private static final Long MILLIS_MINUTE_TEN = 60 * 60 * 1000L;

    private static final String LOGIN_USER_KEY = "login_api_key";
    private static final String TOKEN_PREFIX = "Bearer ";
    private static final String LOGIN_TOKEN_KEY = "api_login_tokens:";

    // 令牌自定义标识
    @Value("${token.api.header}")
    private String header;
    // 令牌秘钥
    @Value("${token.api.secret}")
    private String secret;
    // 令牌有效期,以分钟记
    @Value("${token.api.expireTime}")
    private Long expireTime;


    @Autowired
    private RedisCache redisCache;

    /**
     * 获取用户身份信息
     *
     * @return 用户信息
     */
    public AuthData getAuthData(HttpServletRequest request) {
        // 获取请求携带的令牌
        String token = getToken(request);
        if (StringUtils.isNotEmpty(token)) {
            Claims claims = parseToken(token);
            // 解析对应的权限以及用户信息
            String uuid = (String) claims.get(LOGIN_USER_KEY);
            String userKey = getTokenKey(uuid);
            AuthData authData = redisCache.getCacheObject(userKey);
            authData.setExpireTime(expireTime * MILLIS_MINUTE);
            return authData;
        }
        return null;
    }

    public void refreshToken(AuthData authData) {
        long currentTime = System.currentTimeMillis();
        log.info("刷新token:" + currentTime);
        if (authData.getTime() + expireTime * MILLIS_MINUTE - currentTime <= MILLIS_MINUTE_TEN) {
            redisCache.setCacheObject(getTokenKey(authData.getUuid()), new AuthData(authData.getUuid(), authData.getId()));
        }
    }

    /**
     * 删除用户身份信息
     */
    public void delUser(String tokenkey) {
        if (StringUtils.isNotEmpty(tokenkey)) {
            String userKey = getTokenKey(tokenkey);
            redisCache.deleteObject(userKey);
        }
    }

    /**
     * 创建令牌
     *
     * @param id 用户id
     * @return 令牌
     */
    public String createToken(Integer id) {
        Map<String, Object> claims = new HashMap<>();
        String uuid = IdUtils.fastUUID();
        claims.put(LOGIN_USER_KEY, uuid);
        redisCache.setCacheObject(getTokenKey(uuid), new AuthData(uuid, id));
        return createToken(claims);
    }


    /**
     * 从数据声明生成令牌
     *
     * @param claims 数据声明
     * @return 令牌
     */
    private String createToken(Map<String, Object> claims) {
        return Jwts.builder()
                .setClaims(claims)
                .signWith(SignatureAlgorithm.HS512, secret).compact();
    }

    /**
     * 从令牌中获取数据声明
     *
     * @param token 令牌
     * @return 数据声明
     */
    private Claims parseToken(String token) {
        try {
            return Jwts.parser()
                    .setSigningKey(secret)
                    .parseClaimsJws(token)
                    .getBody();
        } catch (SignatureException e) {
            throw new ServiceException("token无效", 101);
        }

    }

    /**
     * 获取请求token
     *
     * @param request 请求
     * @return token token字符串
     */
    private String getToken(HttpServletRequest request) {
        String token = request.getHeader(header);
        if (StringUtils.isNotEmpty(token) && token.startsWith(TOKEN_PREFIX)) {
            token = token.replace(TOKEN_PREFIX, "");
        }
        return token;
    }

    private String getTokenKey(String uuid) {
        return LOGIN_TOKEN_KEY + uuid;
    }
}
