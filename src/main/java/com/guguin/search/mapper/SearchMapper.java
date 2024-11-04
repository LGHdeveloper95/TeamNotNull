package com.guguin.search.mapper;

import com.guguin.post.vo.PostVo;
import com.guguin.resume.vo.ResumeVo;
import com.guguin.search.vo.SearchVo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface SearchMapper {
    List<ResumeVo> getSearchSkillResList(SearchVo searchVo);

    List<ResumeVo> getSearchResList(SearchVo searchVo);

    List<PostVo> getSearchSkillRecList(SearchVo searchVo);

    List<PostVo> getSearchRecList(SearchVo searchVo);
}
