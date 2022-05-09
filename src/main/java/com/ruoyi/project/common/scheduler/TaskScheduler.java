package com.ruoyi.project.common.scheduler;

import com.ruoyi.project.common.task.AbstractTask;
import lombok.extern.slf4j.Slf4j;
import org.springframework.scheduling.annotation.Scheduled;

import java.util.ArrayList;
import java.util.List;

//@Component
@Slf4j
public class TaskScheduler {


    /**
     * 任务池
     */
    private static final List<AbstractTask> pool = new ArrayList<>();

    /**
     * 添加任务
     *
     * @param take
     */
    public static void addTake(AbstractTask take) {
        pool.add(take);
    }

    /**
     * 一秒为单位
     */
    @Scheduled(fixedDelay = 1000)
    public void start() {
        for (int i = 0; i < pool.size(); i++) {
            AbstractTask take = pool.get(i);
            if (take.getTime() > 0) {
                take.pass();
                continue;
            }
            take.start();
            pool.remove(i);
            i--;
        }
    }

}
