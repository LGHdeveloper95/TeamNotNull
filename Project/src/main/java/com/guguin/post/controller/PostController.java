package com.guguin.post.controller;

import com.guguin.post.mapper.PostMapper;
import com.guguin.post.vo.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.ImportAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/Post")
public class PostController {

    @Autowired
    private PostMapper postMapper;

    @RequestMapping("/Board")
    public ModelAndView board(HttpServletRequest request){
        ModelAndView mv = new ModelAndView();
        HttpSession session = request.getSession(false);
        String comid = (String) session.getAttribute("comid");
        if(comid==null){
            mv.addObject("loginReq",true);
            mv.setViewName("redirect:/Login/");
        }
        else{
            List<PostVo> postList = postMapper.getPostList(comid);
            mv.addObject("postList", postList);
            mv.setViewName("post/board");
        }
        return mv;
    }

    @RequestMapping("/View")
    public ModelAndView view(HttpServletRequest request,PostVo postVo){
        ModelAndView mv = new ModelAndView();
        HttpSession session  = request.getSession(false);
        String comid = (String) session.getAttribute("comid");
        if(comid==null){
            mv.addObject("loginReq",true);
            mv.setViewName("redirect:/Login/");
        }
        else{
            PostVo post = postMapper.getPost(postVo.getRecnum());
            PostVo com = postMapper.getCom(post.getComid());
            mv.addObject("post", post);
            mv.addObject("com", com);
            mv.setViewName("post/view");
        }
        return mv;
    }

    @RequestMapping("/UpdateForm")
    public ModelAndView updateForm(HttpServletRequest request,PostVo postVo){
        ModelAndView mv = new ModelAndView();
        HttpSession session  = request.getSession(false);
        String comid = (String) session.getAttribute("comid");
        if(comid==null){
            mv.addObject("loginReq",true);
            mv.setViewName("redirect:/Login/");
        }
        else{
            PostVo post = postMapper.getPost(postVo.getRecnum());
            PostVo com = postMapper.getCom(post.getComid());
            List<EduVo> eduList = postMapper.getEduList();
            List<CareerVo> careerList = postMapper.getCareerList();
            List<SkillCateVo> skillCateList = postMapper.getSkillCateList();
            List<SkillVo> skillList = postMapper.getSkillList();
            mv.addObject("post", post);
            mv.addObject("com", com);
            mv.addObject("eduList", eduList);
            mv.addObject("careerList", careerList);
            mv.addObject("skillCateList", skillCateList);
            mv.addObject("skillList", skillList);
            mv.setViewName("post/update");
        }
        return mv;
    }

    @RequestMapping("/Update")
    public ModelAndView update(HttpServletRequest request, PostUpdateVo postUpdateVo){
        ModelAndView mv = new ModelAndView();
        HttpSession session  = request.getSession(false);
        String comid = (String) session.getAttribute("comid");
        System.out.println(postUpdateVo);
        if(comid==null){
            mv.addObject("loginReq",true);
            mv.setViewName("redirect:/Login/");
        }
        else{
            postMapper.updatePost(postUpdateVo);
//            postMapper.updateLicense(postUpdateVo);
            postMapper.deleteSkill(postUpdateVo);
            String []skillList = postUpdateVo.getSkill().split("/");
            for(int i=0;i<skillList.length;i++){
                postMapper.insertSkill(postUpdateVo.getRecnum(),Integer.parseInt(skillList[i]));
            }
           mv.setViewName("redirect:/Post/View?recnum="+postUpdateVo.getRecnum());
        }
        return mv;
    }

    @RequestMapping("/Delete")
    public ModelAndView delete(HttpServletRequest request,PostVo postVo){
        ModelAndView mv = new ModelAndView();
        HttpSession session  = request.getSession(false);
        String comid = (String) session.getAttribute("comid");
        if(comid==null){
            mv.addObject("loginReq",true);
            mv.setViewName("redirect:/Login/");
        }
        else{
            postMapper.deletePost(postVo);
            mv.setViewName("redirect:/Post/Board");
        }
        return mv;

    }

}
