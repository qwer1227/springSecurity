package com.example.security.board.dto;

import lombok.Data;

@Data
public class CommentForm {
    private String commentText;
    private int userNo;
    private int postNo;
    private String newText;
    private int commentNo;

}
