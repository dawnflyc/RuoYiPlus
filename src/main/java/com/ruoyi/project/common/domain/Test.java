package com.ruoyi.project.common.domain;

import com.baomidou.mybatisplus.annotation.TableName;
import com.ruoyi.framework.aspectj.lang.annotation.Excel;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@TableName("my_test")
public class Test {

    /**
     * 用户编号
     */
    private Integer id;

    @Excel(name = "名称")
    private String name;

}
