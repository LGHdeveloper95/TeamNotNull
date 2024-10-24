package com.guguin.company.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.guguin.company.vo.ComjoinVo;


@Mapper
public interface ComjoinMapper {

	void insertCompany(ComjoinVo vo);

	boolean checkIdDuplicate(String comid);

}
