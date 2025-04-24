package com.example.security.board.controller;

import com.example.security.board.dto.CommentForm;
import com.example.security.board.service.CommentService;
import com.example.security.board.vo.CommentVO;
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
    public @ResponseBody List<CommentVO> comment(@RequestParam int postNo) {

        return commentService.getComments(postNo);
    }

    @PostMapping("/post")
    public ResponseEntity<?> post(@RequestBody CommentForm commentVO) {
        commentService.addComment(commentVO);

        return ResponseEntity.ok().build();
    }

}
