package com.example.security.board.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class CommentVO {
    private int commentNo;         // 댓글 번호
    private int postNo;            // 게시글 번호
    private int userNo;            // 작성자 번호
    private String memberNm;
    private String commentText;    // 댓글 내용
    private String createdDate;      // 작성일
    private String updatedDate;      // 수정일
    private String deleteAt;       // 삭제 여부
    private Integer parentCommentNo; // 부모 댓글 번호 (대댓글을 위한 컬럼)
}
