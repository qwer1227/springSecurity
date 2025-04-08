package com.example.security.utils;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.ModelAndView;

public class Advice {

    @ResponseStatus(HttpStatus.BAD_REQUEST)
    @ExceptionHandler(Exception.class) // 모든 Exception을 처리하는 핸들러 어노테이션
    public ModelAndView exception(Exception e){

        ModelAndView mav = new ModelAndView("error");
        mav.addObject("error", e.getMessage()); //error라는 이름으로 Model을 내려줌

        return mav;

    }
}
