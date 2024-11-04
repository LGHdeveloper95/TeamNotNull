package com.guguin.search.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class SearchVo {
    private String word;
    private String skill;
    private String region;
    private String gugun_code;
    private int edu_code;
    private int career_code;
}
