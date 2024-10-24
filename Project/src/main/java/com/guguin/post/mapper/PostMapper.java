package com.guguin.post.mapper;

import com.guguin.post.vo.*;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface PostMapper {

    List<PostVo> getPostList(String comid);

    PostVo getPost(String recnum);

    void deletePost(PostVo postVo);

    PostVo getCom(String comid);

    List<EduVo> getEduList();

    List<CareerVo> getCareerList();

    List<SkillCateVo> getSkillCateList();

    List<SkillVo> getSkillList();
    
    void updatePost(PostUpdateVo postUpdateVo);

    void updateLicense(PostUpdateVo postUpdateVo);

    void deleteSkill(PostUpdateVo postUpdateVo);

    void insertSkill(String recnum, int skill_code);

    List<SkillVo> getComSkillList(String recnum);

    List<GugunVo> getGugunList();

    List<SidoVo> getSidoList();

    PostVo getRegion(String gugun_code);
}