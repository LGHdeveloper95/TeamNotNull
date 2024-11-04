package com.guguin.resume.mapper;

import com.guguin.resume.vo.*;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

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

	void insertResume(ResumeVo vo);

	List<GugunVo> getGugunList();

	List<SidoVo> getSidoList();

	String getResnum();

	void insertSkill(ResumeVo skillVo);

	void updateImg(ResumeVo imgVo);

	void updateResume(ResumeVo vo);

	void updateResumeNopicture(ResumeVo vo);

	void deleteSkill(String resnum);

	
}
