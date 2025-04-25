package com.example.security.board.service;

import com.example.security.board.dto.BoardForm;
import com.example.security.board.dto.CommentDto;
import com.example.security.board.dto.CommentForm;
import com.example.security.board.dto.SearchDto;
import com.example.security.board.vo.CommentVO;
import com.example.security.utils.ListDto;

import java.security.Principal;
import java.util.List;

public interface CommentService {
    ListDto<CommentVO> getCommentList(CommentDto commentDto);
    List<CommentVO> getComments(int id);
    void addComment(CommentForm commentForm);
    void updateComment(CommentForm commentForm);
    void deleteComment(CommentForm commentForm);
}
