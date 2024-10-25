package com.guguin.csboard.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.guguin.csboard.vo.CsBoardVo;
@Mapper
// 게시판 관련 DB 쿼리 인터페이스
public interface CsBoardMapper {
    List<CsBoardVo> getAllBoardList();  // 전체 게시글 목록 조회
    List<CsBoardVo> getPagedBoardList(int arg0, int arg1);  // 페이징 처리된 게시글 목록 조회
    int getTotalBoardCount();  // 게시글 총 개수 조회
    CsBoardVo getBoardDetail(int qnum);  // 게시글 상세 조회
    int updateBoard(CsBoardVo board);  // 게시글 수정
    int insertBoard(CsBoardVo board);
    int getLastQnum();// 게시글 번호 자동 설정용 쿼리
	List<CsBoardVo> getBoardListByUserId(String loggedInUser); //내가쓴글만 조
	List<CsBoardVo> getBoardListByComId(String loggedInComId);
}

