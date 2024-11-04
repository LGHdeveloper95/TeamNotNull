package com.guguin.guin.controller;

import com.guguin.guin.mapper.GuinMapper;
import com.guguin.guin.vo.GuinVo;
import com.guguin.guin.vo.PageDto;
import com.guguin.post.vo.CareerVo;
import com.guguin.post.vo.EduVo;
import com.guguin.post.vo.GugunVo;
import com.guguin.post.vo.PostVo;
import com.guguin.post.vo.SidoVo;
import com.guguin.post.vo.SkillCateVo;
import com.guguin.post.vo.SkillVo;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.HttpStatusCode;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/Guin")
public class GuinController {

    @Autowired 
    private GuinMapper guinMapper;

    @RequestMapping("/Board")
    public ModelAndView board(@RequestParam(required=false, defaultValue = "1", value="pageNo") int pageNo,HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();
        HttpSession session = request.getSession(false);
        PageDto page = new PageDto(pageNo,10,guinMapper.getCount());

        Map<String,Integer> map = new HashMap<>();
        map.put("startNo", page.getStartNo());
        map.put("endNo", page.getEndNo());
        List<GuinVo> recList = guinMapper.getPageList(map);

        mv.addObject("recList", recList);
        mv.addObject("page",page);
        mv.setViewName("guin/board");
        return mv;
    }

    @RequestMapping("/View")
    public ModelAndView view(HttpServletRequest request, GuinVo guinVo) {
        ModelAndView mv = new ModelAndView();
        HttpSession session = request.getSession(false);
        String userid = (String) session.getAttribute("userid");
        if (userid == null) {
            mv.setViewName("redirect:/Login/");
        } else {
        	GuinVo post = guinMapper.getPost(guinVo.getRecnum());
        	GuinVo com = guinMapper.getCom(post.getComid());
        	GuinVo region = guinMapper.getRegion(post.getGugun_code());
            List<SkillVo> skillList = guinMapper.getComSkillList(guinVo.getRecnum());
            String []paths = post.getImage_path().split("/");
            String image = paths[4]+"/"+paths[5];
            post.setImage_path(image);
            mv.addObject("sk", skillList);
            mv.addObject("po", post);
            mv.addObject("co", com);
            mv.addObject("re", region);
            mv.setViewName("guin/view");
        }
        return mv;
    }


    @RequestMapping("/Apply")
    public ModelAndView apply(HttpServletRequest request,GuinVo guinVo) {
        HttpSession session = request.getSession();
        String userid = (String) session.getAttribute("userid");
        List<GuinVo> resumeList = guinMapper.getResumeList(userid);
        
        GuinVo user = guinMapper.getUser(userid);
        String comid = guinMapper.getComid(guinVo.getRecnum());
        guinVo.setComid(comid);
          	System.out.println(guinVo);

        
        ModelAndView mv = new ModelAndView();
        mv.addObject("resumeList", resumeList);        
        mv.addObject("guinVo",guinVo);
        mv.addObject("user", user);
        mv.setViewName("guin/apply");
        
        return mv;
    }
  

    @PostMapping("/Applied")
    public ModelAndView  applied(GuinVo guinVo, HttpSession session) {
    	 String userid = (String) session.getAttribute("userid");
    	
    	 ModelAndView  mv = new ModelAndView();
		mv.setViewName("guin/apply");
    	 int submitCount = guinMapper.applyExists(userid);
		if (submitCount > 0) {
			mv.addObject("result", "No");
		} else {
			guinMapper.insertAppliedResume(guinVo);
		    mv.addObject("result", "Yes");
    	}
    	return mv;
    }
    
    
        //스크랩추가

    @PostMapping("/AddScrap")
    public ResponseEntity<String> addScrap(@RequestBody Map<String, Object> requestBody, HttpSession session) {
        // 세션에서 사용자 ID를 가져옵니다.
        String userid = (String) session.getAttribute("userid");
        
        // 사용자 ID가 null이면 로그인 페이지로 리디렉션
        if (userid == null) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("redirect:/Login");
        }

        // 요청 본체에서 recnum과 comid 가져오기
        String recnum = (String) requestBody.get("recnum"); // 스크랩할 항목의 번호
        String comid = (String) requestBody.get("comid");   // 회사 ID 추가
        
        // null 체크: recnum 또는 comid가 null이거나 비어있으면 오류 응답
        if (recnum == null || recnum.isEmpty() || comid == null || comid.isEmpty()) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("error"); // 오류 처리
        }

        // 데이터베이스에 전달할 파라미터 맵 생성
        Map<String, Object> params = new HashMap<>();
        params.put("userid", userid); // 사용자 ID 추가
        params.put("recnum", recnum);  // 스크랩할 항목 번호 추가
        params.put("comid", comid);    // 회사 ID 추가

        try {
            // 이미 스크랩한 경우 체크
            int scrapCount = guinMapper.scrapExists(params);
            if (scrapCount > 0) {
                return ResponseEntity.ok("scrapExists"); // 이미 스크랩했다는 응답 반환
            }

            // 스크랩 추가
            guinMapper.addScrap(params); // 실제로 스크랩 정보를 데이터베이스에 추가
        } catch (Exception e) {
            e.printStackTrace(); // 오류가 발생한 경우 콘솔에 출력
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("error"); // 서버 오류 응답
        }

        // 스크랩 성공 시 성공 응답
        return ResponseEntity.ok("success");
    }

    
}
