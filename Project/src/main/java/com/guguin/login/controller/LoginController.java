package com.guguin.login.controller;

import com.guguin.login.mapper.LoginMapper;
import com.guguin.login.vo.LoginVo;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/Login")
public class LoginController {

    @Autowired
    private LoginMapper loginMapper;

    @RequestMapping("/")
    public ModelAndView login(LoginVo loginVo){
        ModelAndView mv = new ModelAndView();
        mv.addObject("loginReq",loginVo.getLoginReq());
        mv.addObject("loginFail",loginVo.getLoginFail());
        mv.setViewName("login/loginPage");
        return mv;
    }

    @RequestMapping("/User")
    public ModelAndView userLogin(HttpServletRequest request, LoginVo loginVo){
        HttpSession session = request.getSession(false);
        ModelAndView mv  = new ModelAndView();
        LoginVo user= loginMapper.getUser(loginVo);
        if(user==null){
            mv.setViewName("login/loginPage");
            mv.addObject("loginFail",true);
        }
        else if(user!=null){
            session.setAttribute("userid",user.getUserid());
            session.setAttribute("username",user.getUsername());
            mv.setViewName("redirect:/");
        }

        return mv;
    }

    @RequestMapping("/Com")
    public ModelAndView comLogin(HttpServletRequest request, LoginVo loginVo){
        HttpSession session = request.getSession(false);
        ModelAndView mv  = new ModelAndView();
        LoginVo user= loginMapper.getCom(loginVo);
        if(user==null){
            mv.setViewName("redirect:/Login/");
            mv.addObject("loginFail",true);
        }
        else if(user!=null){
            session.setAttribute("comid",user.getComid());
            session.setAttribute("boss",user.getBoss());
            mv.setViewName("redirect:/");
        }
        return mv;
    }
    @RequestMapping("/Logout")
    public String logout(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }
        return "redirect:/";
    }
}
