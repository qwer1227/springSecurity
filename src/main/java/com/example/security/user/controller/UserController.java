package com.example.security.user.controller;

import com.example.security.user.Enum.UserJoinResult;
import com.example.security.user.dto.InsertForm;
import com.example.security.user.service.UserService;
import com.example.security.user.vo.UserVO;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/user")
@Controller
@RequiredArgsConstructor
public class UserController {

    private final UserService userService;

    @GetMapping("/login")
    public String login(){
        return "login";
    }

    @GetMapping("/register")
    public String register(){
        return "signup";
    }

    @PostMapping("/insertUser")
    public String insertUser(@ModelAttribute InsertForm user, Model model){
        UserJoinResult result = userService.insertUser(user);

        if(result == UserJoinResult.PASSWORD_MISMATCH){
            model.addAttribute("errorMsg", "비밀번호가 일치하지 않습니다");
            return "signup";
        }

        return "redirect:/user/login";
    }



}
