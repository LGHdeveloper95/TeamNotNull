package com.guguin.mypage.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.guguin.guin.mapper.GuinMapper;
import com.guguin.mypage.mapper.MyPageMapper;
import com.guguin.mypage.vo.MyPageVo;
import com.guguin.resume.vo.ResumeVo;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/MyPage")
public class MyPageController {

	@Autowired
	private MyPageMapper myPageMapper;
	
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
	public ModelAndView board(HttpServletRequest request) {
	    HttpSession session = request.getSession();
	    String userid = (String) session.getAttribute("userid");
	    
	    if (userid == null) {
	        return new ModelAndView("redirect:/Login");
	    }

	    ModelAndView mv = new ModelAndView();
	    //트라이 캐치를 사용하여 에러잡기
	    try {
	        List<MyPageVo> myList = myPageMapper.getMyList(userid);
	        MyPageVo user = myPageMapper.getUser(userid);
	        mv.addObject("myList", myList);
	        mv.addObject("user", user);
	        mv.setViewName("/mypage/board");
	    } catch (Exception e) {
	        e.printStackTrace(); // 또는 로깅 프레임워크를 사용하여 로그 기록
	        mv.setViewName("error"); // 에러 페이지로 리다이렉트
	    }
	    
	    return mv;
	}
    
    @RequestMapping("/View")
    public ModelAndView view(@RequestParam(name = "sendnum") String sendnum, HttpServletRequest request) {
    	//user정보
    	HttpSession session = request.getSession();
    	String userid = (String) session.getAttribute("userid");
    	MyPageVo user = myPageMapper.getUser(userid);
    	
    	ModelAndView mv = new ModelAndView();
    	mv.addObject("user", user);
    	
    	//이력서정보
    	MyPageVo mypage = myPageMapper.getResume(sendnum);
    	
    	//자격증리스트 추가("/")으로 자르기
    	String license = myPageMapper.getLicense(sendnum);
    	if(license != null) {
    	  String[] licenseList = license.split("/");
    	  //System.out.println(licenseList[1]);
      	  mv.addObject("licenseList", licenseList);
    	}
    	//기술분야
    	List<ResumeVo> skillList = myPageMapper.getSkillList(sendnum);
    	
    	
    	mv.addObject("mypage", mypage);
    	mv.addObject("skillList", skillList);
    	mv.setViewName("/mypage/view");
    	
    	return mv;
    } 
    
}
