package com.guguin.mypage.mapper;

import java.util.List;


import org.apache.ibatis.annotations.Mapper;

import com.guguin.mypage.vo.MyPageVo;
import com.guguin.mypage.vo.StarVo;
import com.guguin.mypage.vo.UserVo;
import com.guguin.resume.vo.ResumeVo;

@Mapper
public interface MyPageMapper {

	List<MyPageVo> getMyList(String userid);

	MyPageVo getUser(String userid);

	MyPageVo getResume(String resnum);
 

	String getLicense(String sendnum);

	List<ResumeVo> getSkillList(String sendnum);


	List<MyPageVo> getScList(String userid);

	void deleteSc(int bmid);

	UserVo getUserPage(String userid);

	void updateUser(UserVo userVo);

	void updatePass(UserVo vo);

	String getComName(String comid);

	void insertStar(StarVo vo);

	List<MyPageVo> getStarList(String userid);

	}
