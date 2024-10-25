package com.guguin.commypage.mapper;

import com.guguin.commypage.vo.ComMyPageVo;
import com.guguin.commypage.vo.ComVo;
import com.guguin.guin.vo.GuinVo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ComMyPageMapper {

    List<ComMyPageVo> getApplied_resumeList(String comid);

    ComMyPageVo getApplied_Resume(String sendnum);

    ComMyPageVo getUser(String userid);

    void updateResume(ComMyPageVo comMyPageVo);

    ComVo getCom(String comid);
}
