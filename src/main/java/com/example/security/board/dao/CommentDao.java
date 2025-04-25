package com.example.security.board.dao;

import com.example.security.board.dto.CommentDto;
import com.example.security.board.dto.CommentForm;
import com.example.security.board.vo.CommentVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CommentDao {
    List<CommentVO> getComments(int id); // detail화면 들어갔을때 렌더링할 댓글을 위해서 나중에 빼도 될듯??
    List<CommentVO> getCommentList(CommentDto commentDto); // 비동기처리용 댓글목록
    int getTotalRows(CommentDto commentDto); // 페이징을 위한 rows 구하는
    void addComment(CommentVO commentForm);
    void updateComment(CommentVO commentForm);
    void deleteComment(CommentVO commentVO);
}

