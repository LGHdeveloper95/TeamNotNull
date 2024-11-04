package com.guguin.gusik.mapper;

import com.guguin.gusik.vo.GusikVo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface GusikMapper {
    public List<GusikVo> getResumeList();

    GusikVo getResume(String resnum);

    GusikVo getUser(String userid);

    GusikVo getUserByResnum(String resnum);

    void insertBook( String userid, String comid,String resnum);

    String findBook(String userid, String comid, String resnum);

    String getResumeByApplied(String sendnum);

	public int getCount();

	public List<GusikVo> getPageList(Map<String, Integer> map);
}
