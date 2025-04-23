package com.example.security.board.controller;

import com.example.security.board.dto.BoardForm;
import com.example.security.board.dto.SearchDto;
import com.example.security.board.service.BoardService;
import com.example.security.board.vo.BoardVO;
import com.example.security.security.CustomUserDetailsService;
import com.example.security.user.vo.UserVO;
import com.example.security.utils.ListDto;
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
    public String board(Model model, SearchDto searchDto) {

        ListDto<BoardVO> list = boardService.getBoardList(searchDto);

        model.addAttribute("boardList", list.getData());
        model.addAttribute("pagination", list.getPaging());


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

    @PostMapping("/write")
    public String writeSubmit(@ModelAttribute BoardForm vo, Principal principal){

        int postNo = boardService.insertPost(vo,principal);

        return "redirect:/board/detail?postNo=" + postNo;
    }

    @GetMapping("/update")
    public String update(Model model, @RequestParam(name = "postNo") int id){

        BoardVO detail = boardService.getBoardById(id);

        model.addAttribute("board", detail);

        return "board/update";
    }

    @PostMapping("/update")
    public String updateSubmit(@ModelAttribute BoardForm vo, Principal principal){

        int postNo = boardService.updatePost(vo,principal);

        return "redirect:/board/detail?postNo=" + postNo;
    }

    @PostMapping("/delete")
    public String delete(@RequestParam(name = "postNo") int postNo){

        boardService.deletePost(postNo);

        return "redirect:/board/list";
    }



}
