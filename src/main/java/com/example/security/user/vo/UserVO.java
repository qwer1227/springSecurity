package com.example.security.user.vo;

import lombok.Builder;
import lombok.Getter;

@Builder
@Getter
public class UserVO {
    private String member_nm;          // 회원 이름
    private String member_nick;        // 회원 닉네임
    private String member_pw;          // 비밀번호
    private String confirmPassword; //중복확인
    private String member_birth;       // 생년월일
    private String member_tel;         // 전화번호
    private String member_email;       // 이메일
    private String member_zip;         // 우편번호
    private String member_addr1;       // 주소1
    private String member_addr2;       // 주소2
    private String member_auth;        // 회원 권한
    private String mentor_expertise;   // 멘토 전문 분야
    private String mentor_experience;  // 멘토 경험
    private String mentor_current_job;  // 멘토 현재 직업

}
