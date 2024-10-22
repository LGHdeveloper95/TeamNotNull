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
	private String username;

	//RECRUIT 공고
	private String recnum;
	//private String comid;
	private String rectitle;

	//BUSINESS_MEMBERS 기업회원
	private String comid;
	private String comname;

	//RECRUIT 지원받은 이력서 목록
	private String resnum;
	//private String recnum;

	//PERSONAL_RESUME 이력서
	//private String resnum;
	private String restitle;
	private String reg_date;
	//private int edu;
	//private int career;
}