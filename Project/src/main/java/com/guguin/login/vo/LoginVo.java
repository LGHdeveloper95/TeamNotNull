package com.guguin.login.vo;

import lombok.*;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class LoginVo {
    private String comid;
    private String compw;
    private String userid;
    private String userpw;
    private Boolean loginReq;
    private Boolean loginFail;


}
