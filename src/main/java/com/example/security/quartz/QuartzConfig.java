package com.example.security.quartz;

import org.quartz.*;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class QuartzConfig {

//    // JobDetail 정의
//    @Bean
//    public JobDetail jobDetail() {
//        return JobBuilder.newJob(SampleJob.class)
//                .withIdentity("sampleJob")
//                .storeDurably()
//                .build();
//    }
//
//    // Trigger 정의 (10초마다 실행)
//    @Bean
//    public Trigger myCronTrigger() {
//        return TriggerBuilder.newTrigger()
//                .forJob(jobDetail())
//                .withIdentity("myCronTrigger")
//                .withSchedule(
//                        CronScheduleBuilder.cronSchedule("0 47 15 * * ?")
//                )
//                .build();
//    }
}
