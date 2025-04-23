package com.example.security.main;

import com.example.security.user.service.UserService;
import com.example.security.user.vo.UserVO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
@RequiredArgsConstructor
public class MainController {

    private final UserService userService;

    @GetMapping("/")
    public String main(Model model, HttpSession session, HttpServletRequest request){



        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

        if(authentication != null && authentication.isAuthenticated()){
            Object principal = authentication.getPrincipal();

            if(principal instanceof User){
                User user = (User)principal;
                String username = user.getUsername();
                UserVO tmp = userService.getUserByUsername(username);

                int userid = tmp.getMemberNo();

                model.addAttribute("username",username);
                session.setAttribute("username",username);
                session.setAttribute("user",userid);
            }
        }

        return "main";
    }

}
