package com.guguin.csboard.vo;

import java.util.Date;


public class CsBoardVo {
    private int qnum;         // 게시글 번호
    private String qtitle;    // 제목
    private String qcontent;  // 내용
    private String userid;    // 작성자 아이디
    private String comid;     // 기업 아이디
    private String qdate;       // 작성일
     // 자꾸 에러남 매우 화가남 롬북 버리고 걍 게터세터 쓸거임 ㅗ
    public int getQnum() {
        return qnum;
    }

    public void setQnum(int qnum) {
        this.qnum = qnum;
    }

    public String getQtitle() {
        return qtitle;
    }

    public void setQtitle(String qtitle) {
        this.qtitle = qtitle;
    }

    public String getQcontent() {
        return qcontent;
    }

    public void setQcontent(String qcontent) {
        this.qcontent = qcontent;
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public String getComid() {
        return comid;
    }

    public void setComid(String comid) {
        this.comid = comid;
    }

    public String getQdate() {
        return qdate;
    }

    public void setQdate(String qdate) {
        this.qdate = qdate;
    }
}