package com.guguin.resume.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@AllArgsConstructor
@NoArgsConstructor
public class ResumeVo {
	//이력서 PERSONAL_RESUME
	private String resnum;
	private String userid;
	private String username;
	private String restitle;
	private String reg_date;
	private String gender;
	
	private String picture;
	private int edu_code;       //학력 분류
	private String edu_content; //학력 세부사항
	private String license;     //자격증 split "/"
	private int career_code;      //경력 분류
	private String career_content; //경력 세부사항
	private int sido_code;
	private int dudun_code;
	
	private String background;  //성장배경
	private String personality; //성격의 장단점
	private String motivation;  //지원동기
	
	//HR.PERSONAL MEMBERS
	//USERNAME, BIRTH, UPHONE, UADDR, EMAIL
	private String birth;
	private String uphone;
	private String uaddr;
	private String email;
	
	//이력서스킬 RESUME_SKILL, SKILL_LIST, SKILL_CATEGORY_LIST
	//RESNUM, SCATE_CODE, SCATE, SKILL_CODE, SKILL
	private int scate_code;
	private String scate;
	private int skill_code;
	private String skill;
	
	//EDU_LIST
	private String edu_name;
	
	//CAREER
	private String career_name;
}
