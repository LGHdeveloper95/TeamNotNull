package com.guguin.gusik.mapper;

import com.guguin.gusik.vo.GusikVo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface GusikMapper {
    public List<GusikVo> getResumeList();

    GusikVo getResume(String resnum);

    GusikVo getUser(String userid);
}
