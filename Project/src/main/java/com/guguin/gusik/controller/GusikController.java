package com.guguin.gusik.controller;

import com.guguin.guin.vo.GuinVo;
import com.guguin.gusik.mapper.GusikMapper;
import com.guguin.gusik.vo.GusikVo;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
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
    public ModelAndView board(HttpServletRequest request){
        ModelAndView mv = new ModelAndView();


        HttpSession session = request.getSession(false);
        if (session == null) {
            mv.addObject("loginreq", true);
            mv.setViewName("redirect:/Login/");
        } else {
            List<GusikVo> resList = gusikMapper.getResumeList();
            mv.setViewName("gusik/board");
            mv.addObject("resList",resList);
        }
        return mv;
    }
}
