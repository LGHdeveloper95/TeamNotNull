package com.guguin.guin.controller;

import com.guguin.guin.mapper.GuinMapper;
import com.guguin.guin.vo.GuinVo;
import com.guguin.resume.mapper.ResumeMapper;
import com.guguin.resume.vo.ResumeVo;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/Guin")
public class GuinController {

    @Autowired
    private GuinMapper guinMapper;


    @Autowired
    private ResumeMapper resumeMapper;
    
    
    
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

    
    @RequestMapping("/Apply")
    public ModelAndView apply(HttpServletRequest request) {
    	HttpSession session = request.getSession();
    	String userid = (String) session.getAttribute("userid");
    	List<ResumeVo> resumeList = resumeMapper.getResumeList(userid);
    	ResumeVo user = resumeMapper.getUser(userid);
    	
    	ModelAndView mv = new ModelAndView();
    	mv.addObject("resumeList", resumeList);
    	mv.addObject("user", user);
    	mv.setViewName("guin/apply");
    	
    	return mv;
    }
    
    @PostMapping("/submitResume")
    public ModelAndView submitResume(GuinVo guinVo) {
        // 이력서 정보를 DB에 저장
        guinMapper.insertAppliedResume(guinVo);

        // 성공적인 제출 후 리다이렉트
        ModelAndView mv = new ModelAndView("redirect:/successPage"); // 성공 페이지로 리다이렉트
        return mv;
    }
    
}
