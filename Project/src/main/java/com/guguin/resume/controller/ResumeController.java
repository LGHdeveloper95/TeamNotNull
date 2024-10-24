package com.guguin.resume.controller;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.guguin.resume.mapper.ResumeMapper;
import com.guguin.resume.vo.ResumeVo;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;


@Controller
@RequestMapping("/Resume")
public class ResumeController {
	
	@Autowired
	private ResumeMapper resumeMapper;
	
    @RequestMapping("/Board")
    public ModelAndView board(HttpServletRequest request) {
    	HttpSession session = request.getSession();
    	String userid = (String) session.getAttribute("userid");
    	List<ResumeVo> resumeList = resumeMapper.getResumeList(userid);
    	ResumeVo user = resumeMapper.getUser(userid);
    	
    	ModelAndView mv = new ModelAndView();
    	mv.addObject("resumeList", resumeList);
    	mv.addObject("user", user);
    	mv.setViewName("/resume/board");
    	
    	return mv;
    }
    
    @RequestMapping("/View")
    public ModelAndView view(@RequestParam(name = "resnum") String resnum, HttpServletRequest request) {
    	//user정보
    	HttpSession session = request.getSession();
    	String userid = (String) session.getAttribute("userid");
    	ResumeVo user = resumeMapper.getUser(userid);
    	
    	ModelAndView mv = new ModelAndView();
    	mv.addObject("user", user);
    	
    	//이력서정보
    	ResumeVo resume = resumeMapper.getResume(resnum);
    	//학력정보 추가
    	resume.setEdu_name(resumeMapper.getEdu(resume.getEdu_code()));
    	//경력정보 추가
    	resume.setCareer_name(resumeMapper.getCareer(resume.getCareer_code()));
    	//자격증리스트 추가("/")으로 자르기
    	String license = resumeMapper.getLicense(resnum);
    	if(license != null) {
    	  String[] licenseList = license.split("/");
    	  //System.out.println(licenseList[1]);
      	  mv.addObject("licenseList", licenseList);
    	}
    	//기술분야
    	List<ResumeVo> skillList = resumeMapper.getSkillList(resnum);
    	
    	mv.addObject("resume", resume);
    	mv.addObject("skillList", skillList);
    	mv.setViewName("/resume/view");
    	
    	return mv;
    }
    
}
