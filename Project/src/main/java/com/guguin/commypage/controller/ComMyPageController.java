package com.guguin.commypage.controller;

import com.guguin.commypage.mapper.ComMyPageMapper;
import com.guguin.commypage.vo.ComMyPageVo;
import com.guguin.guin.mapper.GuinMapper;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/ComMyPage")
public class ComMyPageController{

    @Autowired
    private ComMyPageMapper comMyPageMapper;

    @Autowired
    private GuinMapper guinMapper; // ApplyMapper를 주입합니다.

 // 이력서 제출 메소드
    @PostMapping("/submitResume")
    public String submitResume(@RequestParam("selectedResume") String selectedResume, HttpServletRequest request) {
        HttpSession session = request.getSession();
        String userid = (String) session.getAttribute("userid");

        // 선택된 이력서를 처리하는 로직을 여기에 추가합니다.
        // 예: applyMapper.applyToJob(userid, selectedResume);

        // 성공적으로 제출한 후 JSON 형식으로 응답을 반환합니다.
        return "{\"status\":\"success\"}"; // JSON 응답
    }
    
    @RequestMapping("/Board")
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

            mv.setViewName("commypage/board");
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
