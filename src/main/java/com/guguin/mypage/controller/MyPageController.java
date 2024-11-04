package com.guguin.mypage.controller;

import com.guguin.guin.mapper.GuinMapper;
import com.guguin.mypage.mapper.MyPageMapper;
import com.guguin.mypage.vo.MyPageVo;
import com.guguin.mypage.vo.StarVo;
import com.guguin.mypage.vo.UserVo;
import com.guguin.resume.mapper.ResumeMapper;
import com.guguin.resume.vo.ResumeVo;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@RequestMapping("/MyPage")
public class MyPageController {

	@Autowired
	private MyPageMapper myPageMapper;
	
	@Autowired
	private ResumeMapper resumeMapper;
	
	 @Autowired
	    private GuinMapper guinMapper; // ApplyMapper를 주입합니다.

	/// 사용자 마이페이지의 게시판 목록을 불러오는 메소드
	    @RequestMapping("/Board")
	    public ModelAndView board(HttpServletRequest request) {
	        HttpSession session = request.getSession();
	        String userid = (String) session.getAttribute("userid");
	        
	        // 세션에 사용자가 없는 경우 로그인 페이지로 리다이렉트
	        if (userid == null) {
	            return new ModelAndView("redirect:/Login");
	        }

	        ModelAndView mv = new ModelAndView();
	        try {
	            List<MyPageVo> myList = myPageMapper.getMyList(userid); // 이력서 목록
	            List<MyPageVo> scList = myPageMapper.getScList(userid); // 스크랩 목록
	            MyPageVo user = myPageMapper.getUser(userid); // 사용자 정보
	            List<MyPageVo> starList = myPageMapper.getStarList(userid);
	            
	            mv.addObject("starList", starList);
	            mv.addObject("myList", myList);
	            mv.addObject("scList", scList);
	            mv.addObject("user", user);
	            mv.setViewName("/mypage/board");
	        } catch (Exception e) {
	            e.printStackTrace();
	            mv.setViewName("error"); // 에러 발생 시 에러 페이지로 이동
	        }
	        
	        return mv;
	    }
	    
	 // 특정 이력서 상세정보를 보여주는 메소드
	    @RequestMapping("/View")
	    public ModelAndView view(@RequestParam(name = "sendnum") String sendnum, HttpServletRequest request) {
	        HttpSession session = request.getSession();
	        String userid = (String) session.getAttribute("userid");
	        MyPageVo user = myPageMapper.getUser(userid);
	        
	        ModelAndView mv = new ModelAndView();
	        mv.addObject("user", user);
	        
	        MyPageVo mypage = myPageMapper.getResume(sendnum); // 이력서 정보
	        String license = myPageMapper.getLicense(sendnum); // 자격증 리스트
	        //학력정보 추가
	        mypage.setEdu_name(resumeMapper.getEdu(mypage.getEdu_code()));
	        //경력정보 추가
	        mypage.setCareer_name(resumeMapper.getCareer(mypage.getCareer_code()));
	        if (license != null) {
	            String[] licenseList = license.split("/"); // 자격증 정보를 "/"로 구분
	            mv.addObject("licenseList", licenseList);
	        }
	        List<ResumeVo> skillList = myPageMapper.getSkillList(mypage.getResnum()); // 기술 정보
	        mv.addObject("mypage", mypage);
	        System.out.println("user : "+user);
	        System.out.println("mypage : "+mypage);
	        System.out.println("skillList : "+skillList);
	        mv.addObject("skillList", skillList);
	        mv.setViewName("/mypage/view");
	        
	        return mv;
	    } 
	    
	    // 스크랩 삭제 메소드
	    @RequestMapping("/DeleteScrap")
	    public String deleteScrap(@RequestParam("bmid") int bmid, RedirectAttributes redirectAttributes) {
	        try {
	            myPageMapper.deleteSc(bmid); // 스크랩 삭제
	            // 삭제 완료 메시지 추가: 사용자에게 어떤 스크랩이 삭제되었는지 상세하게 알림
	            redirectAttributes.addFlashAttribute("message", "스크랩이 성공적으로 삭제되었습니다.");
	        } catch (Exception e) {
	            e.printStackTrace();
	            // 에러 발생 시 에러 페이지로 이동
	            return "error";
	        }

	        // 삭제 후 마이페이지로 리다이렉트
	        return "redirect:/MyPage/Board"; 
	    }

    
    @RequestMapping("/UpdateForm")
    public ModelAndView updateForm(HttpServletRequest request){
        ModelAndView mv = new ModelAndView();
        HttpSession session = request.getSession();
        String userid = (String) session.getAttribute("userid");
        UserVo user = myPageMapper.getUserPage(userid);
        System.out.println(user);
        mv.addObject("user",user);
        mv.setViewName("mypage/update");
        return mv;
    }

    @RequestMapping("/Update")
    public ModelAndView update(HttpServletRequest request, UserVo userVo){
        ModelAndView mv = new ModelAndView();
        myPageMapper.updateUser(userVo);
        mv.setViewName("redirect:/MyPage/Board");
        return mv;
    }
    
    @RequestMapping("/UpdatePassForm")
    public ModelAndView updatePassForm(HttpServletRequest request) {
    	ModelAndView mv = new ModelAndView();
    	HttpSession session = request.getSession();
    	String userid = (String) session.getAttribute("userid");
    	UserVo user = myPageMapper.getUserPage(userid);
    	
    	mv.addObject("userpw", user.getUserpw());
    	mv.setViewName("mypage/updatePass");
    	return mv;
    }
    
    @RequestMapping("/UpdatePass")
    public ModelAndView updatePass(HttpServletRequest request, @RequestParam(value = "userpw") String userpw){
        ModelAndView mv = new ModelAndView();
        HttpSession session = request.getSession();
        UserVo vo = new UserVo();
        vo.setUserid((String) session.getAttribute("userid"));
        vo.setUserpw(userpw);
        myPageMapper.updatePass(vo);
        mv.setViewName("redirect:/MyPage/Board");
        return mv;
    }
    
    @RequestMapping("/StarPoint")
    public ModelAndView starPoint(@RequestParam(value = "comid") String comid) {
    	MyPageVo vo = new MyPageVo();
    	vo.setComname(myPageMapper.getComName(comid));
    	vo.setComid(comid);
    	
    	ModelAndView mv = new ModelAndView();
    	mv.addObject("vo", vo);
    	mv.setViewName("/mypage/starPoint");
    	return mv;
    }
    
    @RequestMapping("/InsertStar")
    public ModelAndView insertStar(HttpServletRequest request, StarVo vo) {
    	HttpSession session = request.getSession();
    	
    	vo.setUserid((String)session.getAttribute("userid"));
    	vo.setStar_val(vo.getStar_val());
    	//System.out.println(vo);
    	
    	myPageMapper.insertStar(vo);
    	
    	ModelAndView mv = new ModelAndView();
    	mv.setViewName("redirect:/MyPage/Board");
    	return mv;
    }
    
    @RequestMapping("/DeleteUser")
    public ModelAndView deleteUser(@RequestParam(value = "userid") String userid) {
    	
    	myPageMapper.delUser(userid);
    	
    	ModelAndView mv = new ModelAndView();
    	mv.setViewName("redirect:/Login/Logout");
    	return mv;
    }
}
