package com.guguin.post.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PostVo {
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
    private int career_code;
    private int edu_code;
    private String book_count;

    private String comnum;
    private String cphone;
    private String caddr;
    private String starrating;
    private String bossemail;

    private String edu_name;
    private String career_name;

    private String sido;
    private String gugun;

    private String today;
}
