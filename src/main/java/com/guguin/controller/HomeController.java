package com.guguin.controller;

import java.util.List;
import java.util.stream.Collectors;

import com.guguin.post.mapper.PostMapper;
import com.guguin.post.vo.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.guguin.mapper.HomeMapper;
import com.guguin.vo.HomeVo;

import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.HttpServletRequest;

@Controller
public class HomeController {

	@Autowired
	private HomeMapper homeMapper;

	@Autowired
	private PostMapper postMapper;

	@RequestMapping("/")
	public ModelAndView home(HttpServletRequest request) {

		List<HomeVo> recList = homeMapper.getRecList(); //공고리스트
		//System.out.println(recList);
		List<HomeVo> limitedRec = recList.stream().limit(7).collect(Collectors.toList());
		//출력 7개로 제한한 공고 리스트

		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession(false); //없으면 만들지 않음

		if (session != null) {
			String userid = (String) session.getAttribute("userid");
			String comid = (String) session.getAttribute("comid");

			if (userid != null) {
				//System.out.println(userid);
				HomeVo user = homeMapper.getUserById(userid);
				//System.out.println(user);
				mv.addObject("user", user);
			}
			else if (comid != null) {
				System.out.println(comid);
				List<HomeVo> resList = homeMapper.getResList(comid); //이력서 리스트
				List<HomeVo> limitedRes = resList.stream().limit(7).collect(Collectors.toList());
				//출럭 7개로 제한한 이력서 리스트

				mv.addObject("resList", limitedRes);
				HomeVo comp = homeMapper.getComp(comid);
				mv.addObject("comp", comp);
			}
		}

		List<SkillCateVo> skillCateList = postMapper.getSkillCateList();
		List<SkillVo> skillList = postMapper.getSkillList();
		List<GugunVo> gugunList = postMapper.getGugunList();
		List<SidoVo> sidoList = postMapper.getSidoList();
		List<EduVo> eduList = postMapper.getEduList();
		List<CareerVo> careerList = postMapper.getCareerList();

		mv.addObject("recList",limitedRec);

		mv.addObject("skillCateList", skillCateList);
		mv.addObject("skillList", skillList);
		mv.addObject("gugunList", gugunList);
		mv.addObject("sidoList", sidoList);
		mv.addObject("eduList", eduList);
		mv.addObject("careerList", careerList);
		mv.setViewName("home");

		return mv;
	}



}
