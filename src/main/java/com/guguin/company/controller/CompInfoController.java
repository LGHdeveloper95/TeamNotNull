package com.guguin.company.controller;

import com.guguin.company.vo.CompInfoVo;
import com.guguin.company.vo.GridPaging;
import com.guguin.company.mapper.CompInfoMapper;
import com.guguin.company.mapper.StarPointMapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.util.StringUtils;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/CompInfo")
public class CompInfoController {

    @Autowired
    private CompInfoMapper compInfoMapper;
    
    @Autowired
    private StarPointMapper StarPointMapper;

    private static final String UPLOAD_DIRECTORY = "src/main/resources/static/compimage";

    // 목록 페이지
    @GetMapping("/Grid")
    public String showGridPage(@RequestParam(value = "page", defaultValue = "1") int page, Model model) {
        int pageSize = 12;
        int totalRecords = compInfoMapper.getTotalRecordCount();
        GridPaging paging = new GridPaging(page, pageSize, totalRecords);

        List<CompInfoVo> compInfoList = compInfoMapper.getCompanyList(paging);
        List<String> imageList = new ArrayList<>();
        for(int i = 0; i < compInfoList.size(); i++) {
        	String image = "/"+compInfoList.get(i).getImage_path().split("/")[4];
        	image +="/"+compInfoList.get(i).getImage_path().split("/")[5];
        	imageList.add(i, image);
        }
        model.addAttribute("compInfoList", compInfoList);
        model.addAttribute("imageList", imageList);
        model.addAttribute("paging", paging);

        return "compinfo/grid";
    }

    // 상세보기 페이지
    @GetMapping("/View")
    public ModelAndView showViewPage(@RequestParam("comid") String comid) {
        CompInfoVo compInfo = compInfoMapper.getCompanyById(comid);
        ModelAndView mv = new ModelAndView();
        mv.addObject("compInfo", compInfo);
        mv.setViewName("compinfo/view");
        
        String image = "/"+compInfo.getImage_path().split("/")[4];
        image +="/"+compInfo.getImage_path().split("/")[5];
        mv.addObject("image",image);
        System.out.println(image);
        
     // 평균 별점 조회 후 ModelAndView에 추가
       // Double avgStarPoint = StarPointMapper.getAverageStarPoint(comid);
       // mv.addObject("avgStarPoint", avgStarPoint != null ? avgStarPoint : 0.0);  // 평균 별점이 null일 경우 0으로 설정
        Double avgStarPoint = StarPointMapper.getAverageStarPoint(comid);
        String formattedStarPoint = String.format("%.1f", avgStarPoint != null ? avgStarPoint : 0.0);
        mv.addObject("avgStarPoint", formattedStarPoint);  // 소수점 한자리로 설정된 값 추가
        return mv;
    }

    // 작성 페이지
    @GetMapping("/Write")
    public String showWritePage() {
        return "compinfo/write";
    }

    @PostMapping("/Write")
    public String submitWrite(
            @RequestParam("comid") String comid,
            @RequestParam("title") String title,
            @RequestParam("content") String content,
            @RequestParam("history") String history,
            @RequestParam("peopleNum") String peopleNum,
            @RequestParam("link") String link,
            @RequestParam("image") MultipartFile imageFile) {

        String imagePath = saveImageFile(comid, imageFile);

        CompInfoVo compInfo = new CompInfoVo();
        compInfo.setComid(comid);
        compInfo.setTitle(title);
        compInfo.setContent(content);
        compInfo.setHistory(history);
        compInfo.setPeopleNum(peopleNum);
        compInfo.setLink(link);
        compInfo.setImagePath(imagePath);  // 상대 경로로 설정

        compInfoMapper.insertCompanyInfo(compInfo);
        return "redirect:/CompInfo/Grid";
    }
    
    // 수정 폼 페이지
    @GetMapping("/Update")
    public ModelAndView showUpdatePage(@RequestParam("comid") String comid) {
        CompInfoVo compInfo = compInfoMapper.getCompanyById(comid);
        ModelAndView mv = new ModelAndView("compinfo/update");
        mv.addObject("compInfo", compInfo);
        mv.addObject("image", compInfo.getImage_path());
        
        String image = "/"+compInfo.getImage_path().split("/")[4];
        image +="/"+compInfo.getImage_path().split("/")[5];
        mv.addObject("image",image);
        
        
        return mv;
    }

    // 수정 요청 처리
    @PostMapping("/Update")
    public String submitUpdate(
            @RequestParam("comid") String comid,
            @RequestParam("title") String title,
            @RequestParam("content") String content,
            @RequestParam("history") String history,
            @RequestParam("link") String link,
            @RequestParam(value = "image", required = false) MultipartFile imageFile) {

        CompInfoVo compInfo = compInfoMapper.getCompanyById(comid);
        compInfo.setTitle(title);
        compInfo.setContent(content);
        compInfo.setHistory(history);
        compInfo.setLink(link);

        if (imageFile != null && !imageFile.isEmpty()) {
            String image_path = saveImageFile(comid, imageFile);
            compInfo.setImagePath(image_path);
        }

        compInfoMapper.updateCompanyInfo(compInfo);
        return "redirect:/CompInfo/View?comid=" + comid;
    }
    

    // 이미지 파일 저장 처리
    private String saveImageFile(String comid, MultipartFile file) {
        if (file.isEmpty()) {
            return null;
        }

        // 고유한 파일명 생성
        String fileName = comid + "_" + StringUtils.cleanPath(file.getOriginalFilename());
        Path path = Paths.get(UPLOAD_DIRECTORY, fileName);

        try {
            file.transferTo(path.toFile());
            return "/compimage/" + fileName; // 상대 경로 반환
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }
    }
}




