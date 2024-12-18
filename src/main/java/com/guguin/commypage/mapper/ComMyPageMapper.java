package com.guguin.commypage.mapper;

import com.guguin.commypage.vo.BookVo;
import com.guguin.commypage.vo.ComMyPageVo;
import com.guguin.commypage.vo.ComVo;
import com.guguin.guin.vo.GuinVo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ComMyPageMapper {

    List<ComMyPageVo> getApplied_resumeList(String comid);

    ComMyPageVo getApplied_Resume(String sendnum);

    ComMyPageVo getUser(String userid);

    void updateResume(ComMyPageVo comMyPageVo);

    ComVo getCom(String comid);

    void updateCom(ComVo comVo);

    void updatePass(ComVo comVo);

    List<BookVo> getBook_resumeList(String comid);

    void deleteBook(BookVo bookVo);

    void delCom(ComVo comVo);
}
