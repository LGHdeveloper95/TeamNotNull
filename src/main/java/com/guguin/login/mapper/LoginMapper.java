package com.guguin.login.mapper;

import com.guguin.login.vo.LoginVo;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface LoginMapper {
    LoginVo getUser(LoginVo loginVo);

    LoginVo getCom(LoginVo loginVo);
}
