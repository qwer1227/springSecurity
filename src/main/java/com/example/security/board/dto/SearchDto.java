package com.example.security.board.dto;

import lombok.Data;

@Data
public class SearchDto {

    private int page = 1; // 기본값
    private int rows = 10; // 기본값
    private String sort = "date"; // 기본값
    private String opt; // 셀렉트의 값
    private String keyword; // 인풋박스의 값
    private String category;
    private int begin;
    private int end;

}
