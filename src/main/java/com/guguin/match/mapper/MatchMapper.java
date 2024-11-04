package com.guguin.match.mapper;

import com.guguin.match.vo.MatchVo;
import com.guguin.post.vo.PostVo;
import com.guguin.resume.vo.ResumeVo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface MatchMapper {
    List<MatchVo> getResnum(String userid);

    List<MatchVo> getUserSkill(String resnum);

    List<MatchVo> getRecruit(String skill_code);

    PostVo getRecruitList(String s);

    List<MatchVo> getRecnum(String comid);

    List<MatchVo> getComSkill(String recnum);

    List<MatchVo> getResume(String skill_code);

    ResumeVo getResumeList(String resnum);
}
