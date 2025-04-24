package com.example.security.board.service.impl;

import com.example.security.board.dao.CommentDao;
import com.example.security.board.dto.CommentForm;
import com.example.security.board.service.CommentService;
import com.example.security.board.vo.CommentVO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.security.Principal;
import java.util.List;

@Service
@RequiredArgsConstructor
public class CommentServiceImpl implements CommentService {

    private final CommentDao commentDao;

    @Override
    public List<CommentVO> getComments(int id) {
        return commentDao.getComments(id);
    }

    @Override
    public void addComment(CommentForm commentForm) {

        CommentVO commentVO = CommentVO.builder()
                .commentText(commentForm.getCommentText())
                .userNo(commentForm.getUserNo())
                .postNo(commentForm.getPostNo())
                .build();

        commentDao.addComment(commentVO);

    }

    @Override
    public int updateComment(CommentForm commentForm, Principal principal) {
        return 0;
    }

    @Override
    public void deleteComment(int id) {

    }
}
