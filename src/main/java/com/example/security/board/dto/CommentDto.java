package com.example.security.board.dto;

import lombok.Data;

@Data
public class CommentDto {

    private int page = 1;
    private int rows = 10;
    private int postNo;
    private int begin;
    private int end;
}
