package com.example.security.board.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BoardForm {
    private int memberNo;
    private int postNo;
    private String memberNm;
    private String title;
    private String content;
}
