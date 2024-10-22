package com.guguin.resume.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.guguin.resume.vo.ResumeVo;

@Mapper
public interface ResumeMapper {

	List<ResumeVo> getResumeList(String userid);

	ResumeVo getUser(String userid);

	ResumeVo getResume(String userid);

	List<ResumeVo> getSkillList(String userid);

	String getEdu(int edu_code);

	String getCareer(int career_code);

	String getLicense(String resnum);
	
}
