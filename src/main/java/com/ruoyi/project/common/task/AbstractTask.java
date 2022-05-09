package com.ruoyi.project.common.task;

import lombok.Data;

/**
 * 抽象任务
 */
@Data
public abstract class AbstractTask {

    /**
     * 多少秒之后触发
     */
    private long time;

    public AbstractTask(long time) {
        this.time = time;
    }

    /**
     * 时光流逝一秒
     */
    public void pass() {//这个啥时候执行的
        this.time--;
    }

    /**
     * 抽象方法，执行
     */
    public abstract void start(); //通用的参数吧

}
