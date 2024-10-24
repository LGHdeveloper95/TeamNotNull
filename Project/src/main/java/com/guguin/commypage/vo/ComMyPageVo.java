package com.guguin.commypage.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ComMyPageVo {
    private String resnum;
    private String userid;
    private String username;
    private String reg_date;
    private String picture;
    private String edu_code;
    private String edu_content;
    private String license;
    private String career_code;
    private String career_content;
    private String sido_code;
    private String gugun_code;
    private String restitle;
    private String background;
    private String personality;
    private String motivation;

    private String birth;
    private String uphone;
    private String uaddr;
    private String email;

    private String recnum;
    private int pass_code;
}
