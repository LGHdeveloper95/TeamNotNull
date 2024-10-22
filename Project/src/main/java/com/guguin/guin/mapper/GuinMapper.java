package com.guguin.guin.mapper;

import com.guguin.guin.vo.GuinVo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface GuinMapper {
    List<GuinVo> getRecruitList();

    GuinVo getRecruit(String recnum);
}
