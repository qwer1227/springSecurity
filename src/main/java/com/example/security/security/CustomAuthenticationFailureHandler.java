package com.example.security.security;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.LockedException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.stereotype.Component;

import java.io.IOException;


@Component
public class CustomAuthenticationFailureHandler implements AuthenticationFailureHandler {

    @Override
    public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response, AuthenticationException exception) throws IOException, ServletException {

        String errorMsg;

        if (exception instanceof BadCredentialsException) {
            errorMsg = "아이디 또는 비밀번호가 올바르지 않습니다";
        } else if (exception instanceof UsernameNotFoundException) {
            errorMsg = "아이디 또는 비밀번호가 올바르지 않습니다";
        } else if (exception instanceof LockedException) {
            errorMsg = "계정이 잠겼습니다";
        } else if (exception instanceof DisabledException) {
            errorMsg = "비활성화된 계정입니다";
        } else {
            errorMsg = "로그인 실패" + exception.getMessage();
        }

        // 세션에 errorMsg 저장
        request.getSession().setAttribute("errorMsg", errorMsg);

        // 로그인 페이지로 리다이렉트
        response.sendRedirect("/user/login");



    }
}
