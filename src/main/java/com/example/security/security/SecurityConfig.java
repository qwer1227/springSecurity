package com.example.security.security;

import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;


@Configuration
@EnableWebSecurity
@RequiredArgsConstructor
public class SecurityConfig  {

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        http
                .csrf(csrf -> csrf.disable())
                .authorizeHttpRequests(auth -> auth
                        .requestMatchers("/", "/user/login", "/user/register", "/css/**", "/js/**", "/images/**").permitAll()
                        .anyRequest().permitAll())
                .formLogin(formLogin -> formLogin
                    .loginPage("/user/login") //로그인페이지 경로설정
                    .usernameParameter("username") // 인증할때 사용할 사용자의 아이디
                    .passwordParameter("password") // 비밀번호
                    .loginProcessingUrl("/loginCheck") // ★ 로그인 처리 요청 경로 설정
                    .defaultSuccessUrl("/user/main")) // 성공시 리다이렉션 경로설정
                .logout(logout -> logout
                        .logoutUrl("/user/logout")
                        .logoutSuccessUrl("/user/main")
                        .invalidateHttpSession(true)
                        .clearAuthentication(true));


        return http.build();
    }

    
    //Config파일에서도 패스워드 Encoder를 Bean으로 등록해줘야함
    //Error, trace=java.lang.IllegalArgumentException: You have entered a password with no PasswordEncoder. If that is your intent, it should be prefixed with `{noop}`. 해당 에러가 나옴
    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }


}
