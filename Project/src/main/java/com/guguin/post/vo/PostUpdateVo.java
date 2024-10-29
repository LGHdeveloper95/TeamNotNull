package com.guguin.post.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PostUpdateVo {
    private String recnum;
    private String comid;
    private String comname;
    private String rectitle;
    private String subtitle;
    private String boss;
    private String gcontent;
    private String reg_date;
    private String deadline;
    private String gugun_code;
    private int career_code;
    private int edu_code;
    private String book_count;

    private String license;

    private String skill;
}
