package com.guguin.mypage.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.guguin.mypage.mapper.MypageMapper;
import com.guguin.mypage.vo.MypageVo;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/Mypage")
public class MypageController {

    @Autowired
    private MypageMapper mypageMapper;

    @RequestMapping("/Board")
    public ModelAndView board(HttpServletRequest request) {

        ModelAndView mv = new ModelAndView();
        HttpSession session = request.getSession(false);

        List<MypageVo> myList = mypageMapper.getMyList();
        mv.addObject("myList", myList);
        mv.setViewName("mypage/board");
        return mv;
    }

}
