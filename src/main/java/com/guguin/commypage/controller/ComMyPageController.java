package com.guguin.commypage.controller;

import com.guguin.commypage.mapper.ComMyPageMapper;
import com.guguin.commypage.vo.BookVo;
import com.guguin.commypage.vo.ComMyPageVo;
import com.guguin.commypage.vo.ComVo;
import com.guguin.guin.mapper.GuinMapper;

import com.guguin.resume.mapper.ResumeMapper;
import com.guguin.resume.vo.ResumeVo;
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

    @Autowired
    private ResumeMapper resumeMapper;
 // 이력서 제출 메소드

    @RequestMapping("/")
    public String home(){
        return "redirect:/ComMyPage/Board";
    }


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
            List<BookVo> bookList = comMyPageMapper.getBook_resumeList(comid);
            ComVo com = comMyPageMapper.getCom(comid);
           mv.addObject("resList", resList);
           mv.addObject("bookList", bookList);
           mv.addObject("com",com);
            mv.setViewName("commypage/board");
        System.out.println(resList);
        }
        return mv;
    }

    @RequestMapping("/View")
    public ModelAndView view(HttpServletRequest request,ComMyPageVo comMyPageVo){
        HttpSession session = request.getSession(false);
        String comid = (String) session.getAttribute("comid");
        ModelAndView mv = new ModelAndView();
        mv.setViewName("commypage/view");

        System.out.println(comMyPageVo);
        ComMyPageVo resume = comMyPageMapper.getApplied_Resume(comMyPageVo.getSendnum());
        ComMyPageVo user = comMyPageMapper.getUser(resume.getUserid());
        resume.setEdu_name(resumeMapper.getEdu(resume.getEdu_code()));
        //경력정보 추가
        resume.setCareer_name(resumeMapper.getCareer(resume.getCareer_code()));
        //자격증리스트 추가("/")으로 자르기
        String license = resumeMapper.getLicense(comMyPageVo.getSendnum());
        if(license != null) {
            String[] licenseList = license.split("/");
            //System.out.println(licenseList[1]);
            mv.addObject("licenseList", licenseList);
        }
        //이미지
        String []paths = resume.getPicture().split("/");
        String image  = "/"+paths[4]+"/"+paths[5];
        resume.setPicture(image);

        //기술분야
        List<ResumeVo> skillList = resumeMapper.getSkill(resume.getResnum());
        mv.addObject("resume", resume);
       mv.addObject("skillList", skillList);

        mv.addObject("resume",resume);
        mv.addObject("user", user);
        return mv;
    }

    @RequestMapping("/ResumePass")
    public ModelAndView resumePass(ComMyPageVo comMyPageVo){
        ModelAndView mv = new ModelAndView();
        comMyPageMapper.updateResume(comMyPageVo);
        mv.setViewName("commypage/close");
        return mv;
    }

    @RequestMapping("/UpdateForm")
    public ModelAndView updateForm(HttpServletRequest request){
        ModelAndView mv = new ModelAndView();
        HttpSession session = request.getSession();
        String comid = (String) session.getAttribute("comid");
        ComVo com = comMyPageMapper.getCom(comid);
        mv.addObject("com",com);
        mv.setViewName("commypage/update");
        return mv;
    }

    @RequestMapping("/Update")
    public ModelAndView update(HttpServletRequest request,ComVo comVo){
        System.out.println(comVo);
        ModelAndView mv = new ModelAndView();
        comMyPageMapper.updateCom(comVo);
        mv.setViewName("redirect:/ComMyPage/Board");
        return mv;
    }

    @RequestMapping("/UpdatePassForm")
    public ModelAndView updatePassForm(HttpServletRequest request){
        HttpSession session = request.getSession();
        ModelAndView mv = new ModelAndView();
        String comid = (String) session.getAttribute("comid");
        ComVo com = comMyPageMapper.getCom(comid);
        mv.addObject("com",com);
        mv.setViewName("commypage/updatePass");

        return mv;
    }

    @RequestMapping("/UpdatePass")
    public ModelAndView updatePass(ComVo comVo){
        ModelAndView mv = new ModelAndView();
        comMyPageMapper.updatePass(comVo);
        mv.setViewName("redirect:/ComMyPage/");
        return mv;
    }

    @RequestMapping("/DeleteBook")
    public ModelAndView deleteBook(BookVo bookVo,HttpServletRequest request){
        ModelAndView mv = new ModelAndView();
        HttpSession session = request.getSession();
        String comid = (String) session.getAttribute("comid");
        comMyPageMapper.deleteBook(bookVo);
        mv.setViewName("redirect:/ComMyPage/Board");
        return mv;
    }

    @RequestMapping("/DeleteCom")
    public ModelAndView deleteUser(ComVo comVo) {

        comMyPageMapper.delCom(comVo);

        ModelAndView mv = new ModelAndView();
        mv.setViewName("redirect:/Login/Logout");
        return mv;
    }
}

