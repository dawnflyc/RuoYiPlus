package com.ruoyi.project.admin.mapper;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.ruoyi.common.extend.mp.conditions.SaveWrapper;
import org.apache.ibatis.annotations.*;

import java.util.List;
import java.util.Map;

public interface DynamicMapper extends BaseMapper<Object> {
    /**
     * 查询
     *
     * @param id 主键
     * @return 测试
     */
    @Select("select * from ${table} where id = #{id}")
    Map<String, String> dynamicSelectById(@Param("table") String table, @Param("id") Integer id);

    /**
     * 查询列表
     *
     * @return 测试集合
     */
    @Select("select * from ${table} ${ew.customSqlSegment}")
    List<Map<String, String>> dynamicSelectList(@Param("table") String table, @Param("ew") QueryWrapper data);

    /**
     * 新增
     *
     * @return 结果
     */
    @Insert("insert into ${table} ${ew.getSql}")
    int dynamicInsert(@Param("table") String table, @Param("ew") SaveWrapper data);

    /**
     * 修改
     *
     * @return 结果
     */
    @Update("update ${table} set ${ew.getSqlSet} where ${ew.getSqlSegment}")
    int dynamicUpdate(@Param("table") String table, @Param("ew") UpdateWrapper data);

    /**
     * 删除
     *
     * @param id 测试主键
     * @return 结果
     */
    @Delete("delete from ${table} where id = #{id}")
    int dynamicDeleteById(@Param("table") String table, @Param("id") Integer id);

    /**
     * 批量删除
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    default int dynamicDeleteByIds(String table, Integer[] ids) {
        int flag = 0;
        for (Integer id : ids) {
            flag += dynamicDeleteById(table, id);
        }
        return flag;
    }

}
