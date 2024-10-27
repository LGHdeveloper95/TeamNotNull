package com.guguin.resume.controller;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.guguin.resume.mapper.ResumeMapper;
import com.guguin.resume.vo.GugunVo;
import com.guguin.resume.vo.ResumeVo;
import com.guguin.resume.vo.SidoVo;
import com.guguin.resume.vo.sectionVo;
import com.guguin.resume.vo.skillVo;

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
    	//System.out.println(userid);
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
      	  //System.out.println(license);
    	}
    	//기술분야
    	List<ResumeVo> skillList = resumeMapper.getSkill(resnum);
    	
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
        List<GugunVo> gugunList = resumeMapper.getGugunList();
        List<SidoVo> sidoList = resumeMapper.getSidoList();
    	
    	ModelAndView mv = new ModelAndView();
    	mv.addObject("eduList", eduList);
    	mv.addObject("careerList", careerList);
    	mv.addObject("skillCateList", skillCateList);
    	mv.addObject("skillList", skillList);
    	mv.addObject("gugunList", gugunList);
        mv.addObject("sidoList", sidoList);
    	mv.addObject("user", user);
    	mv.setViewName("/resume/insertForm");
    	
    	return mv;
    }

    
    @RequestMapping("/Insert")
    public ModelAndView insert(@RequestParam("imgfile") MultipartFile imgfile, ResumeVo vo, HttpServletRequest request) {
    	HttpSession session = request.getSession();
    	String userid = (String) session.getAttribute("userid");
    	
    	/* ResumeVo(resnum=null, userid=null, username=김영희, restitle=타이틀, reg_date=null,
    	 * gender=여, picture=null, edu_code=2, edu_content=학력세부, license=자격1/자격2,
    	 * career_code=1, career_content=경력세부, sido_code=0, gugun_code=403, background=배경,
    	 * personality=성격, motivation=동기, birth=null, uphone=010-1234-5678,
    	 * uaddr=서울특별시 강남구, email=null, scate_code=0, scate=null, skill_code=0,
    	 * skill=302/307/309/, edu_name=null, career_name=null)
    	 * , SKILL -> skill code로 skill_list 테이블에서 검색
    	*/
    	vo.setUserid(userid);
    	resumeMapper.insertResume(vo);
    	
    	String resnum = resumeMapper.getResnum();
    	vo.setResnum(resnum);
    	//System.out.println(resnum);
    	//skill insert
    	System.out.println("skill:"+vo.getSkill());
    	if(vo.getSkill() != null && !vo.getSkill().isEmpty()) {
    		System.out.println("출력");
    		String[] skillList =  vo.getSkill().split("/");
    	    for(int i= 0; i < skillList.length; i++) {
    		    //System.out.println(skillList[i]);
    		    ResumeVo skillVo = new ResumeVo();
    		    if(!skillList[i].trim().isEmpty()) {
    			    skillVo.setSkill(skillList[i]);
    			    skillVo.setResnum(resnum);
    			    System.out.println(skillVo);
    			    resumeMapper.insertSkill(skillVo);
    		     }
    	    }
    	}
    	
    	//imgfile : org.springframework.web.multipart.support.StandardMultipartHttpServletRequest$StandardMultipartFile@146ad73e
    	//System.out.println(imgfile.getOriginalFilename());
    	String fileName = userid + "_" + imgfile.getOriginalFilename(); //getOriginalFilename : 파일이름 불러오기
    	System.out.println(fileName);
    	String folderPath = "src/main/resources/static/profile";
    	String folder = new File(folderPath).getAbsolutePath(); //현재 작업디렉토리의 src/main/resources/static/profile
    	File filePath = new File(folder,fileName); //file 경로랑 filename으로 File 객체 생성
    	
    	ModelAndView mv = new ModelAndView();
    	
    	try {
            // 파일 저장 File 객체 사용해야함
            imgfile.transferTo(filePath);
            // DB에 이미지 정보 업데이트
            ResumeVo imgVo = new ResumeVo();
            imgVo.setPicture(folderPath+"/"+fileName);
            //System.out.println(folderPath+"/"+fileName);
            imgVo.setResnum(resnum);
            resumeMapper.updateImg(imgVo);
            mv.setViewName("redirect:/Resume/Board");
            
        } catch (Exception e) {
            e.printStackTrace();
            mv.setViewName("error");
        }
    	return mv;
    }
    
    @RequestMapping("/Delete")
    public ModelAndView delete(@RequestParam(name = "resnum") String resnum) {
    	
    	resumeMapper.deleteResume(resnum);
    	
    	ModelAndView mv = new ModelAndView();
    	mv.setViewName("redirect:/Resume/Board");
    	
    	return mv;
    }
    
    @RequestMapping("/UpdateForm")
    public ModelAndView updateForm(@RequestParam(name = "resnum") String resnum, HttpServletRequest request) {
    	//user정보
    	HttpSession session = request.getSession();
    	String userid = (String) session.getAttribute("userid");
    	//System.out.println(userid);
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
      	  //System.out.println(license);
    	}
    	//기술분야
    	List<ResumeVo> getSkillList = resumeMapper.getSkill(resnum);
    	
    	mv.addObject("resume", resume);
    	mv.addObject("getSkillList", getSkillList);
    	mv.setViewName("/resume/updateForm");
    	//System.out.println(getSkillList);
    	
    	List<sectionVo> eduList = resumeMapper.getEduList();
        List<sectionVo> careerList = resumeMapper.getCareerList();
        List<sectionVo> skillCateList = resumeMapper.getSkillCateList();
        List<skillVo> skillList = resumeMapper.getSkillList();
        List<GugunVo> gugunList = resumeMapper.getGugunList();
        List<SidoVo> sidoList = resumeMapper.getSidoList();
    	
    	mv.addObject("eduList", eduList);
    	mv.addObject("careerList", careerList);
    	mv.addObject("skillCateList", skillCateList);
    	mv.addObject("skillList", skillList);
    	mv.addObject("gugunList", gugunList);
        mv.addObject("sidoList", sidoList);
    	
    	return mv;
    }
    
    @RequestMapping("/Update")
    public ModelAndView update(@RequestParam("imgfile") MultipartFile imgfile, ResumeVo vo, HttpServletRequest request) {
    	ModelAndView mv = new ModelAndView();
    	HttpSession session = request.getSession();
    	vo.setUserid((String) session.getAttribute("userid"));
    	/* resnum / userid / username / restitle / gender / picture / edu_code / edu_content
    	 * license / career_code / career_content / gugun_code
    	 * background / personality / motivation / skill*/
    	resumeMapper.updateResume(vo);
    	if(imgfile.getOriginalFilename() != "") {
    		
    		String fileName = vo.getUserid() + "_" + imgfile.getOriginalFilename(); //getOriginalFilename : 파일이름 불러오기
        	String folderPath = "src/main/resources/static/profile";
        	String folder = new File(folderPath).getAbsolutePath(); //현재 작업디렉토리의 src/main/resources/static/profile
        	File filePath = new File(folder,fileName); //file 경로랑 filename으로 File 객체 생성
        	
        	
        	try {
                // 파일 저장 File 객체 사용해야함
                imgfile.transferTo(filePath);
                // DB에 이미지 정보 업데이트
                ResumeVo imgVo = new ResumeVo();
                imgVo.setPicture(folderPath+"/"+fileName);
                //System.out.println(folderPath+"/"+fileName);
                imgVo.setResnum(vo.getResnum());
                resumeMapper.updateImg(imgVo);
            } catch (Exception e) {
                e.printStackTrace();
                mv.setViewName("error");
            }
    	}
    	
    	//skill insert
    	String[] skillList =  vo.getSkill().split("/");
    	resumeMapper.deleteSkill(vo.getResnum());
    	for(int i= 0; i < skillList.length; i++) {
    		//System.out.println(skillList[i]);
    		ResumeVo skillVo = new ResumeVo();
    		if(skillList[i] != "") {
    			skillVo.setSkill(skillList[i]);
    			skillVo.setResnum(vo.getResnum());
    			//System.out.println(skillVo);
    			resumeMapper.insertSkill(skillVo);
    		}
    	}
    	
    	
    	mv.setViewName("redirect:/Resume/Board");
    	return mv;
    }
    
}
