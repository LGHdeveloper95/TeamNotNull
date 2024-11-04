package com.guguin.commypage.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BookVo {
 private String bmid;
 private String userid;
 private String comid;
 private String recnum;
 private String resnum;
 private String scrap_date;

 private String restitle;
}
