package com.guguin.guin.mapper;


import com.guguin.guin.vo.GuinVo;
import com.guguin.post.vo.GugunVo;
import com.guguin.post.vo.SidoVo;
import com.guguin.post.vo.SkillVo;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface GuinMapper {
    List<GuinVo> getRecruitList();

    GuinVo getRecruit(String recnum);

	List<GuinVo> getResumeList(String userid);

	GuinVo getUser(String userid);


	void addScrap(Map<String, Object> params);

	int scrapExists(Map<String, Object> params);

	GuinVo getScrap(String recnum);

	int applyExists(Map<String, Object> params);

	void insertAppliedResume(GuinVo guinVo);

	String getComid(String recnum);

	int applyExists(String userid);

	List<SidoVo> getSidoList();

	List<GugunVo> getGugunList();

	List<SkillVo> getComSkillList(String recnum);

	GuinVo getRegion(String gugun_code);

	GuinVo getCom(String comid);

	GuinVo getPost(String recnum);

	int getCount();

	List<GuinVo> getPageList(Map<String, Integer> map);

	
}