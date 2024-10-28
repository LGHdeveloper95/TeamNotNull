package com.guguin.search.controller;

import com.guguin.post.vo.PostVo;
import com.guguin.resume.vo.ResumeVo;
import com.guguin.search.mapper.SearchMapper;
import com.guguin.search.vo.SearchVo;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.*;

@Controller
@RequestMapping("/Search")
public class SearchController {

    @Autowired
    private SearchMapper searchMapper;

    @RequestMapping("")
    public ModelAndView home(HttpServletRequest request, SearchVo searchVo) {
        ModelAndView mv = new ModelAndView();
        HttpSession session = request.getSession(false);
        String comid = (String) session.getAttribute("comid");
        String[] sl = searchVo.getSkill().split("/");
        List<String> list = Arrays.asList(sl);
        Set<String> set = new HashSet<>(list);
        List<String> skillList = new ArrayList<>(set);
        skillList.sort(Comparator.naturalOrder());

        String skill = "";
        for (int i = 0; i < skillList.size(); i++) {
            if (i == skillList.size() - 1) {
                skill += skillList.get(i);
            } else {
                skill += skillList.get(i) + "/";
            }
        }
        searchVo.setSkill(skill);
        System.out.println("skill"+skill+"");

        String[] rl = searchVo.getRegion().split("/");
        List<String> rlist = Arrays.asList(rl);
        Set<String> rset = new HashSet<>(rlist);
        List<String> regionList = new ArrayList<>(rset);
        regionList.sort(Comparator.naturalOrder());


        if (comid != null) {
            List<ResumeVo> resList = new ArrayList<>();
            for (int i = 0; i < regionList.size(); i++) {
                searchVo.setGugun_code(regionList.get(i).trim());
                if (skill.trim() != null && !skill.trim().equals("")) {
                    List<ResumeVo> searchList = searchMapper.getSearchSkillResList(searchVo);
                    for (int j = 0; j < searchList.size(); j++) {
                        resList.add(searchList.get(j));
                    }
                } else {
                    List<ResumeVo> searchList = searchMapper.getSearchResList(searchVo);
                    for (int j = 0; j < searchList.size(); j++) {
                        resList.add(searchList.get(j));
                    }
                }
            }
            mv.addObject("resList", resList);
            mv.setViewName("search/comboard");
        } else {
/*            if(searchVo.getCareer_code()==1){
                searchVo.setCareer_code(5);
            }
            if(searchVo.getEdu_code()==1){
                searchVo.setEdu_code(6);
            }*/
            List<PostVo> recList = new ArrayList<>();
            for (int i = 0; i < regionList.size(); i++) {
                searchVo.setGugun_code(regionList.get(i).trim());
                if (skill.trim() != null && !skill.trim().equals("")) {
                    List<PostVo> searchList = searchMapper.getSearchSkillRecList(searchVo);
                    for (int j = 0; j < searchList.size(); j++) {
                        recList.add(searchList.get(j));
                    }
                } else {
                    List<PostVo> searchList = searchMapper.getSearchRecList(searchVo);
                    for (int j = 0; j < searchList.size(); j++) {
                        recList.add(searchList.get(j));
                    }
                }
            }
            mv.addObject("recList", recList);
            mv.setViewName("search/userboard");
        }
        return mv;
    }
}
