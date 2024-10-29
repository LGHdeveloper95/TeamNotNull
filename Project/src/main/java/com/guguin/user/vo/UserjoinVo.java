package com.guguin.user.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class UserjoinVo {

  private String userid;
  private String userpw;
  private String username;
  private String gender;
  private String birth;
  private String uphone;
  private String uaddr;
  private String email;
 
}
