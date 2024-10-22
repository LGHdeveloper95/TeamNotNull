package com.guguin.commypage.controller;

import com.guguin.commypage.mapper.ComMyPageMapper;
import com.guguin.commypage.vo.ComMyPageVo;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/ComMyPage")
public class ComMyPageController{

    @Autowired
    private ComMyPageMapper comMyPageMapper;

    @RequestMapping("/")
    public ModelAndView home(HttpServletRequest request){
        ModelAndView mv = new ModelAndView();
        HttpSession session  = request.getSession(false);
        String comid = (String)session.getAttribute("comid");
        if(comid==null){
            mv.addObject("loginReq",true);
            mv.setViewName("redirect:/Login/");
        }
        else{
            List<ComMyPageVo> resList = comMyPageMapper.getApplied_resumeList(comid);
            mv.addObject("resList", resList);
            mv.setViewName("commypage/commypage");
        }
        return mv;
    }

    @RequestMapping("/View")
    public ModelAndView view(HttpServletRequest request,ComMyPageVo comMyPageVo){
        HttpSession session = request.getSession(false);
        String comid = (String) session.getAttribute("comid");
        ModelAndView mv = new ModelAndView();
        mv.setViewName("commypage/view");

        ComMyPageVo res = comMyPageMapper.getApplied_Resume(comMyPageVo.getResnum());
        ComMyPageVo user = comMyPageMapper.getUser(comMyPageVo.getResnum());
        mv.addObject("res",res);
        mv.addObject("user", user);
        return mv;
    }

}
