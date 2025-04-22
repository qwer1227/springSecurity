package com.example.security.main;

import jakarta.servlet.http.HttpSession;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {

    @GetMapping("/")
    public String main(Model model, HttpSession session){

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

        if(authentication != null && authentication.isAuthenticated()){
            Object principal = authentication.getPrincipal();

            if(principal instanceof User){
                User user = (User)principal;
                String username = user.getUsername();

                model.addAttribute("username",username);
                session.setAttribute("username",username);
            }
        }

        return "main";
    }

}
