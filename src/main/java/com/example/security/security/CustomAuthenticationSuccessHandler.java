package com.example.security.security;

import com.example.security.hist.service.HistService;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.AllArgsConstructor;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import java.io.IOException;

@Component
@AllArgsConstructor
public class CustomAuthenticationSuccessHandler implements AuthenticationSuccessHandler {

    private final HistService histService;

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException {
        //사용자의 아이디를 토큰에서 가져와
        String username = authentication.getName();

        //service를 활용해 내역테이블에 로그인 이력 남기기
        histService.insertHist(username);

        //로그인 성공시 main화면으로 이동
        response.sendRedirect("/user/main");

    }
}
