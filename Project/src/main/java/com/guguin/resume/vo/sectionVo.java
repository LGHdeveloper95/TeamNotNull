package com.guguin.resume.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@AllArgsConstructor
@NoArgsConstructor
public class sectionVo {
	private int edu_code;
	private String edu_name;
	private int career_code;
	private String career_name;
	private int scate_code;
	private String scate;
	
	private int gugun_code;
    private String gugun;
    private int sido_code;
    
    private String sido;
}
