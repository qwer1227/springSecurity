package com.example.security.board.vo;

import lombok.*;

@Getter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class BoardVO {
    private int postNo;
    private int memberNo;
    private String memberNm;
    private String title;
    private String content;
    private String createdAt;
    private String updatedAt;
}
