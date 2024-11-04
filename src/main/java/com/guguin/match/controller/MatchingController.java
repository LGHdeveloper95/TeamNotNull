package com.guguin.match.controller;

import com.guguin.match.mapper.MatchMapper;
import com.guguin.match.vo.MatchVo;
import com.guguin.post.vo.PostVo;
import com.guguin.resume.vo.ResumeVo;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Controller
@RequestMapping("/Matching")
public class MatchingController {

    @Autowired
    private MatchMapper matchMapper;

    @RequestMapping("/")
    public ModelAndView home(HttpServletRequest request){
        ModelAndView mv = new ModelAndView();
        HttpSession session = request.getSession(false);

        String comid = (String) session.getAttribute("comid");
        String userid = (String) session.getAttribute("userid");
        if(comid==null&&userid==null){
            mv.setViewName("redirect:/Login/");
        }
        else if(comid!=null){
                mv.setViewName("redirect:/Matching/Com");
        }
        else if(userid!=null){
            mv.setViewName("redirect:/Matching/User");
        }
        return mv;
    }
    @RequestMapping("/User")
    public ModelAndView user(HttpServletRequest request){
        ModelAndView mv = new ModelAndView();
        HttpSession session = request.getSession();
        String userid = (String) session.getAttribute("userid");
        List<String> recnumList = new ArrayList<>();
        List<MatchVo> numList = matchMapper.getResnum(userid);
        for(int i=0;i< numList.size();i++){
        List<MatchVo> skillList = matchMapper.getUserSkill(numList.get(i).getResnum());
        for(int j=0;j< skillList.size();j++){
            List<MatchVo> resList = matchMapper.getRecruit(skillList.get(j).getSkill_code());
            for(int k=0;k< resList.size();k++){
            recnumList.add(resList.get(k).getRecnum());
            }
        }
        }
        Set<String> set = new HashSet<String>(recnumList);
        List<String> newList =new ArrayList<String>(set);
        List<PostVo> recList = new ArrayList<>();
        for(int i=0;i< newList.size();i++){
        PostVo rec = matchMapper.getRecruitList(newList.get(i));
        recList.add(rec);
        }
        mv.addObject("recList",recList);
        mv.setViewName("match/user");
        return mv;
    }

    @RequestMapping("/Com")
    public ModelAndView com(HttpServletRequest request){
        ModelAndView mv = new ModelAndView();
        HttpSession session = request.getSession();
        String comid = (String) session.getAttribute("comid");
        List<String> resnumList = new ArrayList<>();
        List<MatchVo> numList = matchMapper.getRecnum(comid);
        for(int i=0;i< numList.size();i++){
            List<MatchVo> skillList = matchMapper.getComSkill(numList.get(i).getRecnum());
            for(int j=0;j< skillList.size();j++){
                List<MatchVo> resList = matchMapper.getResume(skillList.get(j).getSkill_code());
                for(int k=0;k< resList.size();k++){
                    resnumList.add(resList.get(k).getResnum());
                }
            }
        }
        Set<String> set = new HashSet<String>(resnumList);
        List<String> newList =new ArrayList<String>(set);
        System.out.println(newList);
        List<ResumeVo> resList = new ArrayList<>();
        for(int i=0;i< newList.size();i++){
            ResumeVo res = matchMapper.getResumeList(newList.get(i));
            resList.add(res);
        }
        mv.addObject("resList",resList);
        mv.setViewName("match/com");
        return mv;
    }
}
