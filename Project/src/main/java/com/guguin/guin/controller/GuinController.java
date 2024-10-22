package com.guguin.guin.controller;

import com.guguin.guin.mapper.GuinMapper;
import com.guguin.guin.vo.GuinVo;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/Guin")
public class GuinController {

    @Autowired
    private GuinMapper guinMapper;

    @RequestMapping("/Board")
    public ModelAndView board(HttpServletRequest request) {

        ModelAndView mv = new ModelAndView();
        HttpSession session = request.getSession(false);

        List<GuinVo> recList = guinMapper.getRecruitList();
        mv.addObject("recList", recList);
        mv.setViewName("guin/board");
        return mv;
    }


    @RequestMapping("/View")
    public ModelAndView view(GuinVo guinVo) {
        ModelAndView mv = new ModelAndView();
        GuinVo rec = guinMapper.getRecruit(guinVo.getRecnum());
        mv.setViewName("guin/view");
        mv.addObject("rec", rec);
        return mv;
    }
}
