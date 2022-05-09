//package com.ruoyi.project.common.service;
//
//import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
//import com.ruoyi.project.common.domain.User;
//import com.ruoyi.project.common.mapper.UserMapper;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Component;
//
//import java.util.Random;
//
///**
// * 用户UUID统一生成服务
// */
//@Component
//public class RandomUserUUIDService {
//
//    private static final byte[] lock = new byte[0];
//
//    @Autowired
//    UserMapper mapper;
//
//    private String baseRandom() {
//        StringBuilder stringBuilder = new StringBuilder();
//        synchronized (lock) {
//            Random random = new Random();
//            for (int i = 0; i < 8; i++) {
//                if (random.nextBoolean()) {
//                    stringBuilder.append(random.nextInt(10));
//                } else {
//                    stringBuilder.append((char) (random.nextInt(26) + 65));
//                }
//            }
//        }
//        return stringBuilder.toString();
//    }
//
//    public String randomUUID() {
//        try {
//            Thread.sleep(1);
//        } catch (InterruptedException e) {
//            e.printStackTrace();
//        }
//        String random = baseRandom();
//        long count = mapper.selectCount(new QueryWrapper<>(new User()).eq("UUID", random));
//        return count > 0 ? randomUUID() : random;
//    }
//}
