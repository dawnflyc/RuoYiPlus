package com.ruoyi.project.common.mapperisolate;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;

/**
 * mapper隔离，每个模块一个
 *
 * @param <T>
 */
public interface CommonMi<T> extends BaseMapper<T> {
}
