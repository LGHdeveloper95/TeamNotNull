package com.guguin.gusik.controller;

import com.guguin.guin.vo.GuinVo;
import com.guguin.gusik.mapper.GusikMapper;
import com.guguin.gusik.vo.GusikVo;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.apache.coyote.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/Gusik")
public class GusikController {

    @Autowired
    private GusikMapper gusikMapper;

    @RequestMapping("/Board")
    public ModelAndView board(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();


        HttpSession session = request.getSession(false);
        if (session == null) {
            mv.addObject("loginReq", true);
            mv.setViewName("redirect:/Login/");
        } else {
            List<GusikVo> resList = gusikMapper.getResumeList();
            mv.setViewName("gusik/board");
            mv.addObject("resList", resList);
        }
        return mv;
    }

    @RequestMapping("/View")
    public ModelAndView view(GusikVo gusikVo) {
        ModelAndView mv  = new ModelAndView();
        GusikVo res = gusikMapper.getResume(gusikVo.getResnum());
        GusikVo user = gusikMapper.getUser(res.getUserid());
        mv.setViewName("gusik/view");
        mv.addObject("res",res);
        mv.addObject("user",user);
        return mv;
    }
}
