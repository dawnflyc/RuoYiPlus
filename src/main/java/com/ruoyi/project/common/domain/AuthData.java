package com.ruoyi.project.common.domain;

import lombok.Data;
import lombok.extern.slf4j.Slf4j;

import java.io.Serializable;

/**
 * 创建token时，用uuid创建token，然后将此类存入缓存作为标记
 */
@Data
@Slf4j
public class AuthData implements Serializable {

    private static final long serialVersionUID = 1L;
    /**
     * 用户id
     */
    private Integer id;
    /**
     * token uuid
     */
    private String uuid;
    /**
     * 认证时间
     */
    private Long time;
    /**
     * 过期时间，校验时填入，毫秒级
     */
    private Long expireTime;

    public AuthData(String uuid, Integer id) {
        this.uuid = uuid;
        this.id = id;
        this.time = System.currentTimeMillis();
    }

    public boolean verify() {
        if (expireTime == 0) {
            log.error("认证过期时间为0");
        }
        long current = System.currentTimeMillis();
        return time + expireTime > current;
    }
}
