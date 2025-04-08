package com.example.security.utils;

import lombok.RequiredArgsConstructor;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class MailService {

    private final JavaMailSender mailSender;

    public void sendSimpleMail(String email) {
        SimpleMailMessage message = new SimpleMailMessage();
        message.setTo(email);
        message.setSubject("테스트 메일");
        message.setText("메일 테스트 중입니다.");
        message.setFrom("seongmin0349@gmail.com");
        mailSender.send(message);
    }

}
