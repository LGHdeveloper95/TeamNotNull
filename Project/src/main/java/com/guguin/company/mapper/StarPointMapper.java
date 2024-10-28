package com.guguin.company.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;


@Mapper
public interface StarPointMapper {

	
	
	// 별점 평균 조회
    @Select("SELECT AVG(STAR_VAL) FROM STARPOINT WHERE COMID = #{comid}")
    Double getAverageStarPoint(String comid);
	
}
