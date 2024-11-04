package com.guguin.company.mapper;

import com.guguin.company.vo.CompInfoVo;
import com.guguin.company.vo.GridPaging;
import org.apache.ibatis.annotations.Mapper;
import java.util.List;

@Mapper
public interface CompInfoMapper {
    int getTotalRecordCount();
    List<CompInfoVo> getCompanyList(GridPaging paging);
    CompInfoVo getCompanyById(String comid);
    void insertCompanyInfo(CompInfoVo compInfo);
    void updateCompanyInfo(CompInfoVo compInfo);
    void deleteCompanyInfo(String comid);
}