package com.board.login;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/Login")
public class LoginController {

    @RequestMapping("/")
    public ModelAndView login(){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("login/login");
        return mv;
    }
}
