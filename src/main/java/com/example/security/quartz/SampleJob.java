package com.example.security.quartz;

import com.example.security.user.service.UserService;
import com.example.security.user.vo.UserVO;
import com.example.security.utils.MailService;
import lombok.AllArgsConstructor;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

@AllArgsConstructor
public class SampleJob implements Job {

    private final UserService userService;
    private final MailService mailService;

    @Override
    public void execute(JobExecutionContext jobExecutionContext) throws JobExecutionException {


        UserVO user = userService.getUserByUsername("관리자");

        String email = user.getMemberEmail();

        mailService.sendSimpleMail(email);

        System.out.println("메일 발송 성공");
        
    }
}
