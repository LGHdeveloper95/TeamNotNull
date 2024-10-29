package com.guguin.gusik.controller;

import com.guguin.gusik.mapper.GusikMapper;
import com.guguin.gusik.vo.GusikVo;
import com.guguin.resume.mapper.ResumeMapper;
import com.guguin.resume.vo.ResumeVo;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/Gusik")
public class GusikController {

    @Autowired
    private GusikMapper gusikMapper;

    @Autowired
    private ResumeMapper resumeMapper;
    @RequestMapping("/Board")
    public ModelAndView board(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();


        HttpSession session = request.getSession(false);
        if (session == null) {
            mv.addObject("loginReq", true);
            mv.setViewName("redirect:/Login/");
        } else {
            List<GusikVo> resList = gusikMapper.getResumeList();
            mv.setViewName("gusik/board");
            mv.addObject("resList", resList);
        }
        return mv;
    }

    @RequestMapping("/View")
    public ModelAndView view(GusikVo gusikVo,HttpServletRequest request) {
        HttpSession session = request.getSession();
        GusikVo user = gusikMapper.getUserByResnum(gusikVo.getResnum());
        String resnum = gusikVo.getResnum();
        String comid = (String) session.getAttribute("comid");
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
        List<ResumeVo> skillList = resumeMapper.getSkill(resnum);
        mv.addObject("resume", resume);
        mv.addObject("skillList", skillList);
        mv.setViewName("/gusik/view");

        return mv;
    }
}