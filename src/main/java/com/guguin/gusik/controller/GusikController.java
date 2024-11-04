package com.guguin.gusik.controller;

import com.guguin.guin.vo.PageDto;
import com.guguin.gusik.mapper.GusikMapper;
import com.guguin.gusik.vo.GusikVo;
import com.guguin.resume.mapper.ResumeMapper;
import com.guguin.resume.vo.ResumeVo;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/Gusik")
public class GusikController {

    @Autowired
    private GusikMapper gusikMapper;

    @Autowired
    private ResumeMapper resumeMapper;
    @RequestMapping("/Board")
    public ModelAndView board(@RequestParam(required=false, defaultValue = "1", value="pageNo") int pageNo , HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();

        PageDto page = new PageDto(pageNo,10,gusikMapper.getCount());

        Map<String,Integer> map = new HashMap<>();
        map.put("startNo", page.getStartNo());
        map.put("endNo", page.getEndNo());

        HttpSession session = request.getSession(false);
        if (session == null) {
            mv.addObject("loginReq", true);
            mv.setViewName("redirect:/Login/");
        } else {
            List<GusikVo> resList = gusikMapper.getPageList(map);
            mv.setViewName("gusik/board");
            mv.addObject("resList", resList);
            mv.addObject("page",page);
        }
        return mv;
    }

    @RequestMapping("/View")
    public ModelAndView view(GusikVo gusikVo,HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();
        HttpSession session = request.getSession();
        String resnum="";
        if(gusikVo.getResnum()==null||gusikVo.getResnum()==""){
            resnum = gusikMapper.getResumeByApplied(gusikVo.getSendnum());
        }
        else{
            resnum = gusikVo.getResnum();
        }

        GusikVo user = gusikMapper.getUserByResnum(resnum);
        String comid = (String) session.getAttribute("comid");

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
        String []paths = resume.getPicture().split("/");
        String image = "/"+paths[4]+"/"+paths[5];
        resume.setPicture(image);
        mv.addObject("resume", resume);
        mv.addObject("skillList", skillList);
        mv.setViewName("/gusik/view");


        return mv;
    }

    @RequestMapping("/Book")
    public ModelAndView book(HttpServletRequest request,GusikVo gusikVo){
        ModelAndView mv = new ModelAndView();
        HttpSession session = request.getSession(false);
        String comid = (String) session.getAttribute("comid");
        GusikVo userid = gusikMapper.getUserByResnum(gusikVo.getResnum());
        if(comid==null){
            mv.setViewName("redirect:/Login");
        }
        else{
            String bmid  = gusikMapper.findBook(userid.getUserid(),comid,gusikVo.getResnum());
            if(bmid == null || bmid==""){
            gusikMapper.insertBook(userid.getUserid(),comid,gusikVo.getResnum());
                mv.addObject("msg","스크랩 했습니다.");
                mv.addObject("link","/Gusik/View?resnum="+gusikVo.getResnum());
                mv.setViewName("commypage/alert");
            }
            else{
                mv.addObject("msg","이미 스크랩하셨습니다.");
                mv.addObject("link","/Gusik/View?resnum="+gusikVo.getResnum());
                mv.setViewName("commypage/alert");
            }
        }
        return mv;
    }
}