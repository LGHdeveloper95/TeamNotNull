package com.guguin.user.mapper;

import com.guguin.user.vo.UserjoinVo;
import org.apache.ibatis.annotations.Mapper;


@Mapper

public interface UserjoinMapper {

	void insertUser(UserjoinVo vo);

	boolean checkUserIdDuplicate(String userid);


}
