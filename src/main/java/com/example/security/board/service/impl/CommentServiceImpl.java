package com.example.security.board.service.impl;

import com.example.security.board.dao.CommentDao;
import com.example.security.board.dto.CommentDto;
import com.example.security.board.dto.CommentForm;
import com.example.security.board.dto.SearchDto;
import com.example.security.board.service.CommentService;
import com.example.security.board.vo.CommentVO;
import com.example.security.utils.ListDto;
import com.example.security.utils.Pagination;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.security.Principal;
import java.util.List;

@Service
@RequiredArgsConstructor
public class CommentServiceImpl implements CommentService {

    private final CommentDao commentDao;

    @Override
    public ListDto<CommentVO> getCommentList(CommentDto commentDto) {
        int totalRows = commentDao.getTotalRows(commentDto);
        int page = commentDto.getPage();
        int rows = commentDto.getRows();

        Pagination pagination = new Pagination(page, totalRows, rows);

        commentDto.setBegin(pagination.getBegin());
        commentDto.setEnd(pagination.getEnd());

        List<CommentVO> commentList = commentDao.getCommentList(commentDto);
        ListDto<CommentVO> dto = new ListDto<>(commentList,pagination);

        return dto;

    }

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
    public void updateComment(CommentForm commentForm) {

        CommentVO commentVO = CommentVO.builder()
                .commentText(commentForm.getNewText())
                .userNo(commentForm.getUserNo())
                .postNo(commentForm.getPostNo())
                .commentNo(commentForm.getCommentNo())
                .build();

        commentDao.updateComment(commentVO);

    }

    @Override
    public void deleteComment(CommentForm commentForm) {

        CommentVO commentVO = CommentVO.builder()
                .commentNo(commentForm.getCommentNo())
                .postNo(commentForm.getPostNo())
                .userNo(commentForm.getUserNo())
                .build();

        commentDao.deleteComment(commentVO);
    }
}
