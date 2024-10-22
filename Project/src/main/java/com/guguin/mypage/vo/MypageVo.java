package com.guguin.mypage.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MypageVo {
	//PERSONAL_MEMBERS 개인회원
	private String userid;
	private String userpw;
	private String username;
	private String birth;
	private String uphone;
	private String uaddr;
	private String email;
	
	//APPLIED_RESUME  합격 불합격
	private String resnum;
	private String recnum;
	private int pass_code;
	
	//MANAGEMENT_BOOKMARK 북마크
	//private String userid;
	private String comid;
	private String type_select;
	
	//RECRUIT 공고
	//private String recnum;
	//private String comid;
	private String rectitle;
	private String subtitle;
	private String boss;
	private String gcontent;
	private String reg_date;
	private String deadline;
	private int sido_code;
	private int gugun_code;
	private int career_code;
	private int edu_code;
	private int book_count;
	
	//PERSONAL_RESUME 이력서
	//private String resnum;
	private String restitle;
	//private String userid;
	//private String username;
	private String ucontent;
	//private String reg_date;
	private String picture;
	//private int edu_code;
	private String edu_content;
	private String license;
	//private int career_code;
	private String career_content;
	private String skill;
	//private int sido_code;
	//private int gugun_code;
	
}
