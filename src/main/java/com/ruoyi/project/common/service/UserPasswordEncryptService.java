package com.ruoyi.project.common.service;

import com.ruoyi.common.utils.sign.Md5Utils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

/**
 * 用户密码统一加密服务
 */
@Component
public class UserPasswordEncryptService {

    @Value("${ruoyi.apiUserEncryptSalt}")
    private String apiUserEncryptSalt;

    public String encrypt(String password) {
        return Md5Utils.hash(apiUserEncryptSalt + password);
    }
}
