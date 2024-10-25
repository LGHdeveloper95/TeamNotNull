package com.guguin.resume.mapper;

import java.io.File;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.guguin.resume.vo.GugunVo;
import com.guguin.resume.vo.ResumeVo;
import com.guguin.resume.vo.SidoVo;
import com.guguin.resume.vo.sectionVo;
import com.guguin.resume.vo.skillVo;

@Mapper
public interface ResumeMapper {

	List<ResumeVo> getResumeList(String userid);

	ResumeVo getUser(String userid);

	ResumeVo getResume(String userid);

	List<ResumeVo> getSkill(String userid);

	String getEdu(int edu_code);

	String getCareer(int career_code);

	String getLicense(String resnum);

	void deleteResume(String resnum);

	List<sectionVo> getEduList();

	List<sectionVo>  getCareerList();

	List<sectionVo>  getSkillCateList();

	List<skillVo>  getSkillList();

	ResumeVo insertResume(ResumeVo vo);

	String updateImg(File filePath, String resnum);

	List<GugunVo> getGugunList();

	List<SidoVo> getSidoList();

	
}
