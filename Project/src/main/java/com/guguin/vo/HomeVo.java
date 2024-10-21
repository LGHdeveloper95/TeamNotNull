package com.guguin.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class HomeVo {
	
	//PERSONAL_MEMBERS 개인회원
	private String userid;
	private String userpw;
	private String username;
	//private String birth;
	//private String uphone;
	//private String uaddr;
	//private String email;
	
	//RECRUIT 공고
	private String recnum;
	private String comid;
	private String rectitle;
	//private String subtitle;
	//private String boss;
	//private String gcontent;
	/*
	private String reg_date;
	private String deadline;
	private int sido_code;
	private int gugun_code;
	private int career_code;
	private int edu_code;
	private int book_count;
	*/
    
	//BUSINESS_MEMBERS 기업회원
    //private String comid;
    //private String comnum;
    private String compw;
    private String comname;
    private String boss;
    //private String cphone;
    //private String caddr;
    //private int starrating;
    //private String bossemail;
    
	//RECRUIT 지원받은 이력서 목록
    
}