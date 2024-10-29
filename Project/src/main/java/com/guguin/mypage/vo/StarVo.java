package com.guguin.mypage.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class StarVo {
	//STARPOINT
	private String userid;
	private String comid;
	private int star_val;
	
	//COMPANY_INFO
	private String comname;
}