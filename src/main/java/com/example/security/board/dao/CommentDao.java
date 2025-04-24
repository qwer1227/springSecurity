package com.example.security.board.dao;

import com.example.security.board.dto.CommentForm;
import com.example.security.board.vo.CommentVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CommentDao {
    List<CommentVO> getComments(int id);
    void addComment(CommentVO commentForm);
    int updateComment(CommentVO commentForm);
    void deleteComment(int id);
}

