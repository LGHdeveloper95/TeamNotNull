package com.guguin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.guguin.mapper.HomeMapper;
import com.guguin.vo.HomeVo;

import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.HttpServletRequest;

@Controller
public class HomeController {
	  
	@Autowired
	private HomeMapper homeMapper;
	
	@RequestMapping("/")
	public ModelAndView home(HttpServletRequest request) {
    	  List<HomeVo> recList = homeMapper.getRecList();
    	  
    	  ModelAndView mv = new ModelAndView();
    	  HttpSession session = request.getSession(false); //없으면 만들지 않음

          if (session != null) {
              String userId = (String) session.getAttribute("userid");
              String comId = (String) session.getAttribute("comid");

              if (userId != null) {
                  HomeVo user = homeMapper.getUser(userId);
                  mv.addObject("user", user);
              }
              else if (comId != null) {
                  HomeVo comp = homeMapper.getComp(comId);
                  mv.addObject("comp", comp);
              }
          }
    	  
    	  mv.addObject("recList",recList);
    	  mv.setViewName("home");
    	  
    	  return mv;
    }
      
      
}

