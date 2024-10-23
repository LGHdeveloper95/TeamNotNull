package com.guguin.post.controller;

import com.guguin.post.mapper.PostMapper;
import com.guguin.post.vo.PostVo;
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
            mv.addObject("post", post);
            mv.setViewName("post/update");
        }
        return mv;
    }

    @RequestMapping("/Update")
    public ModelAndView update(HttpServletRequest request, PostVo postVo){
        ModelAndView mv = new ModelAndView();
        HttpSession session  = request.getSession(false);
        String comid = (String) session.getAttribute("comid");
        if(comid==null){
            mv.addObject("loginReq",true);
            mv.setViewName("redirect:/Login/");
        }
        else{
           postMapper.updatePost(postVo);
           mv.setViewName("redirect:/Post/View?recnum="+postVo.getRecnum());
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
