package com.guguin.csboard.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.guguin.csboard.mapper.CsBoardMapper;
import com.guguin.csboard.vo.CsBoardVo;
import com.guguin.csboard.vo.PagingHelper;

import jakarta.servlet.http.HttpSession;

import java.util.List;

@Controller
@RequestMapping("/Cs")
public class CsBoardController {

    @Autowired
    private CsBoardMapper csBoardMapper;
/*
    // 게시판 목록
    @GetMapping("/csboard")
    public String boardList(Model model) {
        List<CsBoardVo> boardList = csBoardMapper.getAllBoardList();
        model.addAttribute("boardList", boardList);
        return "/WEB-INF/views/csboard/board.jsp";
    }
    */
 // 게시판 목록 (페이징 처리)
    @GetMapping("/Board")
    public String boardList(@RequestParam(value = "page", defaultValue = "1") int page, Model model) {
        int recordsPerPage = 10;  // 페이지당 보여줄 게시글 수
        int arg0 = (page - 1) * recordsPerPage;  // 오프셋 계산
        int totalRecords = csBoardMapper.getTotalBoardCount();  // 전체 게시글 수
        PagingHelper pagingHelper = new PagingHelper(totalRecords, page, recordsPerPage);
        System.out.println(arg0);
        List<CsBoardVo> boardList = csBoardMapper.getPagedBoardList(arg0, recordsPerPage);
       System.out.println(boardList);
        model.addAttribute("boardList", boardList);
        model.addAttribute("pagingHelper", pagingHelper);

        return "/csboard/board";
    }
    
    @GetMapping("/myPosts")
    public String myPosts(HttpSession session, Model model) {
        // 세션에서 로그인된 사용자 ID와 기업 ID 가져오기
        String loggedInUserId = (String) session.getAttribute("userid");
        String loggedInComId = (String) session.getAttribute("comid");

        // 로그인하지 않은 경우 로그인 페이지로 리다이렉트
        if (loggedInUserId == null && loggedInComId == null) {
            return "redirect:/Login/";
        }

        // 로그인된 사용자의 게시글 목록 가져오기
        List<CsBoardVo> myBoardList;
        if (loggedInUserId != null) {
            myBoardList = csBoardMapper.getBoardListByUserId(loggedInUserId);
        } else {
            myBoardList = csBoardMapper.getBoardListByComId(loggedInComId);
        }
        
        model.addAttribute("boardList", myBoardList);
        return "/csboard/board";  // 게시글 목록 페이지로 이동
    }
    
    @GetMapping("/View")
    public String boardView(@RequestParam("qnum") int qnum, Model model, HttpSession session) {
        // 세션에서 로그인된 사용자 ID와 기업 ID를 가져오기
        String loggedInUserId = (String) session.getAttribute("userid");
        String loggedInComId = (String) session.getAttribute("comid");

        // 로그인하지 않은 경우 로그인 페이지로 리다이렉트
        if (loggedInUserId == null && loggedInComId == null) {
            model.addAttribute("loginError", "로그인 하신후 이용부탁드립니다.");
            return "/csboard/alert";  // 알림용 JSP 페이지로 이동
        }

        // 게시글 상세 정보 가져오기
        CsBoardVo board = csBoardMapper.getBoardDetail(qnum);
        
     // 본인이 작성한 글인지 확인 (userid와 comid 둘 다 체크)
        if ((board.getUserid() == null || !board.getUserid().equals(loggedInUserId)) &&
            (board.getComid() == null || !board.getComid().equals(loggedInComId))) {
            model.addAttribute("error", "본인이 작성한 글만 볼 수 없습니다.");
            return "/csboard/alert";  // 알림용 JSP 페이지로 이동
        }

        // 게시글 정보를 모델에 추가
        model.addAttribute("board", board);
        return "/csboard/view";  // 게시글 상세 페이지로 이동
    }
    
    

    
    @GetMapping("/Writeform")
    public String insertBoardForm(HttpSession session, Model model) {
        String loggedInUser = (String) session.getAttribute("loggedInUser");
        String loggedInComId = (String) session.getAttribute("loggedInComId");


        // 게시글 번호 자동 설정 (마지막 번호 + 1)
        int lastQnum = csBoardMapper.getLastQnum();
        model.addAttribute("lastQnum", lastQnum);

        // 작성 페이지로 이동
        return "/csboard/write";
    }
    // 게시글 수정 페이지로 이동
    @GetMapping("/Updateform")
    public String updateBoard(@RequestParam("qnum") int qnum, Model model) {
    	CsBoardVo board = csBoardMapper.getBoardDetail(qnum);
    	model.addAttribute("board", board);
    	return "/csboard/update";
    }

    @PostMapping("/Write")
    public String insertBoard(CsBoardVo board, HttpSession session) {
    	String loggedInUserId = (String) session.getAttribute("userid");
        String loggedInComId = (String) session.getAttribute("comid");

        // 작성자 ID를 설정 (userid 또는 comid 중 하나만 설정)
        if (loggedInUserId != null) {
            board.setUserid(loggedInUserId);
            board.setComid(null);  // 기업 ID는 null로 설정
        } else if (loggedInComId != null) {
            board.setComid(loggedInComId);
            board.setUserid(null);  // 개인 ID는 null로 설정
        }

        // 게시글 작성 로직 처리
        csBoardMapper.insertBoard(board);

        return "redirect:/Cs/Board";  // 작성 완료 후 목록 페이지로 리다이렉트
    }


    // 게시글 수정
    @PostMapping("/Update")
    public String updateBoardProcess(CsBoardVo board) {
        csBoardMapper.updateBoard(board);
        return "redirect:/Cs/Board";
    }
}


