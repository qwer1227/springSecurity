package com.example.security.board.controller;

import com.example.security.board.dto.CommentDto;
import com.example.security.board.dto.CommentForm;
import com.example.security.board.dto.SearchDto;
import com.example.security.board.service.CommentService;
import com.example.security.board.vo.CommentVO;
import com.example.security.utils.ListDto;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RequestMapping("/comment")
@Controller
@RequiredArgsConstructor
public class CommentController {

    private final CommentService commentService;

    @GetMapping("/list")
    public @ResponseBody ListDto<CommentVO> comment(CommentDto commentDto) {

        return commentService.getCommentList(commentDto);
    }

    @PostMapping("/post")
    public ResponseEntity<?> post(@RequestBody CommentForm commentVO) {
        commentService.addComment(commentVO);

        return ResponseEntity.ok().build();
    }

    @PostMapping("/update")
    public ResponseEntity<?> update(@RequestBody CommentForm commentVO) {
        commentService.updateComment(commentVO);

        return ResponseEntity.ok().build();
    }

    @PostMapping("/delete")
    public ResponseEntity<?> delete(@RequestBody CommentForm commentVO) {
        commentService.deleteComment(commentVO);

        return ResponseEntity.ok().build();
    }

}
