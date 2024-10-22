package com.guguin.mypage.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.guguin.mypage.vo.MypageVo;

@Mapper
public interface MypageMapper {

	List<MypageVo> getMyList();

	
}
