package com.guguin.post.mapper;

import com.guguin.post.vo.PostVo;
import com.guguin.vo.HomeVo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface PostMapper {

    List<PostVo> getPostList(String comid);

    PostVo getPost(String recnum);
}