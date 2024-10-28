package com.guguin.resume.controller;

import java.util.List;

import com.guguin.resume.vo.sectionVo;
import com.guguin.resume.vo.skillVo;
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
	@RequestMapping("/InsertForm")
    public ModelAndView inseretForm(HttpServletRequest request) {
    	HttpSession session = request.getSession();
    	String userid = (String) session.getAttribute("userid");
    	//username=김영희,birth=1990-01-01 00:00:00, uphone=010-1234-5678, uaddr=서울특별시 강남구, email=kim.yeonghee@example.com
    	ResumeVo user = resumeMapper.getUser(userid);
    	
        List<sectionVo> eduList = resumeMapper.getEduList();
        List<sectionVo> careerList = resumeMapper.getCareerList();
        List<sectionVo> skillCateList = resumeMapper.getSkillCateList();
        List<skillVo> skillList = resumeMapper.getSkillList();
    	
    	ModelAndView mv = new ModelAndView();
    	mv.addObject("eduList", eduList);
    	mv.addObject("careerList", careerList);
    	mv.addObject("skillCateList", skillCateList);
    	mv.addObject("skillList", skillList);
    	mv.addObject("user", user);
    	mv.setViewName("/resume/insertForm");
    	
    	return mv;
    }

    
    @RequestMapping("/Insert")
    public ModelAndView insert(ResumeVo vo, HttpServletRequest request) {
    	HttpSession session = request.getSession();
    	String userid = (String) session.getAttribute("userid");
    	
    	/*RESNUM, RESTITLE, PICTURE, EDU_CODE
    	 * , EDU_CONTENT, LICENSE, CAREER_CODE, CAREER_CONTENT, SKILL
    	 * , SIDO_CODE, GUGUN_CODE, BACKGROUND, MOTIVATION, PERSONALITY*/
    	ResumeVo insertVo = resumeMapper.insertResume(vo);
    	insertVo.setUsername(resumeMapper.getUser(userid).getUsername());
    	insertVo.setUserid(userid);
    	
    	ModelAndView mv = new ModelAndView();
    	mv.addObject("insert", insertVo);
    	mv.setViewName("redierct:/Resume/Board");
    	
    	return mv;
    	
    }
    
    @RequestMapping("/Delete")
    public ModelAndView delete(@RequestParam(name = "resnum") String resnum) {
    	
    	resumeMapper.deleteResume(resnum);
    	
    	ModelAndView mv = new ModelAndView();
    	mv.setViewName("redierct:/Resume/Board");
    	
    	return mv;
    }

}
