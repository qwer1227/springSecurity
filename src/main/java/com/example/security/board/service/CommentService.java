package com.example.security.board.service;

import com.example.security.board.dto.BoardForm;
import com.example.security.board.dto.CommentForm;
import com.example.security.board.vo.CommentVO;

import java.security.Principal;
import java.util.List;

public interface CommentService {
    List<CommentVO> getComments(int id);
    void addComment(CommentForm commentForm);
    int updateComment(CommentForm commentForm, Principal principal);
    void deleteComment(int id);
}
