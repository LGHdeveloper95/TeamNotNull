package com.guguin.mypage.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MyPageVo {
			//이력서 PERSONAL_RESUME
		private String resnum;
		private String userid;
		private String username;
		private String restitle;
		private String reg_date;
		
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
		

	    //Applied_Resume 제출이력서 합격불합격 관리
	    private String sendnum;      // 제출된 이력서의 고유 번호
	    //private String restitle;     // 이력서 제목
	    //private String userid;       // 유저 ID
	    //private String username;     // 사용자 이름
	    private String ucontent;     // 자기소개서 내용
	    private String regdate;        // 제출일자
	    //private String picture;      // 사진
	   // private Integer edu_code;     // 학력 코드
	    private String educontent;   // 학력 내용
	    //private String license;      // 자격증 내용
	    //private Integer career_code;  // 경력 코드
	    private String careercontent; // 경력 내용
	    //private String skill;        // 기술 스택
	   // private Integer sido_code;    // 시도 코드
	    private Integer gugun_code;   // 구군 코드
	    private Integer pass_code;     // 합격 여부
	    private String recnum;       // 공고 번호

	    //회사정보
	    private String comname;
	    
	    //private String recnum;
	    private String comid;
	    private String rectitle;
	    private String subtitle;
	    private String boss;
	    private String gcontent;
	    //private String reg_date;
	    private String deadline;
	   // private int career_code;
	   // private int edu_code;
	    private int book_count;
	    //private String picture;
	    //private String license;
	    //private int gugun_code;
	    
	    
	    
	    //Scarp
	    
	    private int bmid;
	    //private String userid;
	    //private String comid;
	    //private String recnum;
	    //private String resnum;
	    private String scrap_date;
}