package com.guguin.user.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.guguin.company.vo.ComjoinVo;
import com.guguin.user.vo.UserjoinVo;


@Mapper

public interface UserjoinMapper {

	void insertUser(UserjoinVo vo);

	boolean checkUserIdDuplicate(String userid);


}
