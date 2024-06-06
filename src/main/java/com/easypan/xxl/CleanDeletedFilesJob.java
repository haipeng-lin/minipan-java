package com.easypan.xxl;

import com.easypan.annotation.GlobalInterceptor;
import com.xxl.job.core.biz.model.ReturnT;
import com.xxl.job.core.context.XxlJobHelper;
import com.xxl.job.core.handler.annotation.XxlJob;
import org.springframework.stereotype.Component;

import java.util.Date;
import java.util.concurrent.TimeUnit;

/**
 * @Author Linhaipeng
 * @Mailbox haipeng_lin@163.com
 * @Date 2024/5/7 11:15
 * @Version 1.`0`
 */

//@Component
//public class CleanDeletedFilesJob {
//
//    @XxlJob("CleanDeletedFilesJob")
//    public ReturnT<String> CleanDeletedFilesJob() throws InterruptedException {
//
//        XxlJobHelper.log("定时任务开始");
//        System.out.println(new Date().toString() + "定时任务开始");
//
//        String param = XxlJobHelper.getJobParam();
//        System.out.println(param);
//
//        for (int i = 0; i < 5; i++) {
//            System.out.println(new Date().toString()+"XXL-JOB, Hello World");
//            XxlJobHelper.log("beat at:" + i);
//            TimeUnit.SECONDS.sleep(2);
//        }
//
//        System.out.println("测试完成！！！！！！！！！！！！！！！！！！！！！！！！！！！！");
//        XxlJobHelper.log(new Date().toString() + "定时任务结束");
//        return ReturnT.SUCCESS;
//    }
//}
