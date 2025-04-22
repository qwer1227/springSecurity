package com.example.security.user.vo;

import lombok.Builder;
import lombok.Getter;

@Builder
@Getter
public class UserVO {
    private int memberNo;
    private String memberNm;          // 회원 이름
    private String memberNick;        // 회원 닉네임
    private String memberPw;          // 비밀번호
    private String memberBirth;       // 생년월일
    private String memberTel;         // 전화번호
    private String memberEmail;       // 이메일
    private String memberZip;         // 우편번호
    private String memberAddr1;       // 주소1
    private String memberAddr2;       // 주소2
    private String memberAuth;        // 회원 권한
    private String mentorExpertise;   // 멘토 전문 분야
    private String mentorExperience;  // 멘토 경험
    private String mentorCurrentJob;  // 멘토 현재 직업
    private String role;

}
