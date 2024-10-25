package com.guguin.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.guguin.vo.HomeVo;

@Mapper
public interface HomeMapper {

	List<HomeVo> getRecList();

	HomeVo getUserById(String userid);

	HomeVo getComp(String comid);

	List<HomeVo> getResList(String comid);


}