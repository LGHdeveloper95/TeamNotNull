package com.guguin.guin.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class GuinVo {
    // 이력서 PERSONAL_RESUME
    private String resnum; // 이력서 번호
    private String edu_content; // 학력 세부사항
    private String career_content; // 경력 세부사항
    private int dudun_code; // 둔전 코드
    private String background; // 성장 배경
    private String personality; // 성격의 장단점
    private String motivation; // 지원 동기

    // HR.PERSONAL MEMBERS
    private String birth; // 생년월일
    private String uphone; // 전화번호
    private String uaddr; // 주소
    private String email; // 이메일
    
    // 이력서 스킬 RESUME_SKILL, SKILL_LIST, SKILL_CATEGORY_LIST
    private int scate_code; // 스킬 카테고리 코드
    private String scate; // 스킬 카테고리
    private int skill_code; // 스킬 코드
    
    // EDU_LIST
    private String edu_name; // 학교 이름
    
    // CAREER
    private String career_name; // 경력 이름
    
    private String recnum; // 공고 번호
    private String comid; // 회사 ID
    private String comname; // 회사 이름
    private String rectitle; // 공고 제목
    private String subtitle; // 부제목
    private String boss; // 담당자
    private String gcontent; // 내용
    private String reg_date; // 등록 날짜
    private String deadline; // 마감일
    private String sido_code; // 시도 코드
    private String gugun_code; // 구군 코드
    private String career_code; // 경력 코드
    private String edu_code; // 학력 코드
    private String book_count; // 북마크 수

    // Applied_Resume 제출 이력서 합격 불합격 관리
    private String sendnum; // 제출된 이력서의 고유 번호
    private String restitle; // 이력서 제목
    private String userid; // 유저 ID
    private String username; // 사용자 이름
    private String ucontent; // 자기소개서 내용
    private String regdate; // 제출 일자
    private String picture; // 사진
    private String educontent; // 학력 내용
    private String license; // 자격증 내용
    private String careercontent; // 경력 내용
    private String skill; // 기술 스택
    private Integer pass_code; // 합격 여부
    private int bmid; // 북마크 ID
    
    
        private String comnum;
        private String cphone;
        private String caddr;
        private String bossemail;
        private String sido;
        private String gugun;

        private String today;
        private String image_path;
}
