package com.guguin.company.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.guguin.company.mapper.ComjoinMapper;
import com.guguin.company.vo.ComjoinVo;


@Controller
@RequestMapping("/Join")
public class ComjoinController {

	@Autowired
	private ComjoinMapper comjoinMapper;
	
	// /Comjoin/Join
	
	@RequestMapping("/ComJoin") // /ComJoin
	public  ModelAndView   writeForm() {	
		ModelAndView  mv = new ModelAndView();
		mv.setViewName("/join/comJoin");
		return  mv;
	}

		@RequestMapping("/ComJoinForm")  ///ComJoinForm
		public  ModelAndView  ComJoin( ComjoinVo vo ) {
			// comjoin.jsp 가 넘겨준 데이터를 저장
			comjoinMapper.insertCompany( vo );
			
			
			ModelAndView  mv  =  new ModelAndView();
			mv.setViewName("redirect:/Login/");
			return  mv;
		}


		@RequestMapping("/checkId")
		public ModelAndView checkId(@RequestParam("companyId") String companyId, Model model) {
		    boolean isDuplicate = comjoinMapper.checkIdDuplicate(companyId);
		    model.addAttribute("isDuplicate", isDuplicate);
		    return new ModelAndView("/join/checkIdPopup");
		}
	

}




