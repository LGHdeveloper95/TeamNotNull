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
}
