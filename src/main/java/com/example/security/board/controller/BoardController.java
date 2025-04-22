package com.example.security.board.controller;

import com.example.security.board.dto.BoardForm;
import com.example.security.board.service.BoardService;
import com.example.security.board.vo.BoardVO;
import com.example.security.security.CustomUserDetailsService;
import com.example.security.user.vo.UserVO;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;
import java.util.List;

@Controller
@RequestMapping("/board")
@RequiredArgsConstructor
public class BoardController {

    private final BoardService boardService;

    @GetMapping("/list")
    public String board(Model model) {

        List<BoardVO> list = boardService.getBoardList();

        model.addAttribute("boardList", list);

        return "board/list";
    }

    @GetMapping("/detail")
    public String detail(Model model, @RequestParam(name = "postNo") int id) {

        BoardVO detail = boardService.getBoardById(id);

        model.addAttribute("board", detail);

        return "board/detail";
    }

    @GetMapping("/write")
    public String write(){
        return "board/write";
    }

    @PostMapping("/submit")
    public String submit(@ModelAttribute BoardForm vo, Principal principal){

        int postNo = boardService.insertPost(vo,principal);

        return "redirect:/board/detail?postNo=" + postNo;
    }
}
