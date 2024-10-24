package com.guguin.guin.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class GuinVo {
	
    private String recnum;
    private String comid;
    private String comname;
    private String rectitle;
    private String subtitle;
    private String boss;
    private String gcontent;
    private String reg_date;
    private String deadline;
    private String sido_code;
    private String gugun_code;
    private String career_code;
    private String edu_code;
    private String book_count;

    //Applied_Resume 제출이력서 합격불합격 관리
    private String sendnum;      // 제출된 이력서의 고유 번호
    private String restitle;     // 이력서 제목
    private String userid;       // 유저 ID
    private String username;     // 사용자 이름
    private String ucontent;     // 자기소개서 내용
    private String regdate;        // 제출일자
    private String picture;      // 사진
    private Integer educode;     // 학력 코드
    private String educontent;   // 학력 내용
    private String license;      // 자격증 내용
    private Integer careercode;  // 경력 코드
    private String careercontent; // 경력 내용
    private String skill;        // 기술 스택
    private Integer sidocode;    // 시도 코드
    private Integer guguncode;   // 구군 코드
    private Integer pass_code;     // 합격 여부
    //private String recnum;       // 공고 번호

    
    
}
