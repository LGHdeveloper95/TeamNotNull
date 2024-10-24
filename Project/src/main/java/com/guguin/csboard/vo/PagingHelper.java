package com.guguin.csboard.vo;

public class PagingHelper {
    private int totalRecords;    // 전체 게시글 수
    private int recordsPerPage;  // 페이지당 게시글 수
    private int totalPages;      // 전체 페이지 수
    private int nowPage;     // 현재 페이지
    private int startPage;       // 화면에 보여줄 시작 페이지 번호
    private int endPage;         // 화면에 보여줄 마지막 페이지 번호

    public PagingHelper(int totalRecords, int nowPage, int recordsPerPage) {
        this.totalRecords = totalRecords;
        this.recordsPerPage = recordsPerPage;
        this.totalPages = (int) Math.ceil((double) totalRecords / recordsPerPage);
        this.nowPage = nowPage;
        this.startPage = Math.max(1, nowPage - 5);
        this.endPage = Math.min(totalPages, nowPage + 5);
    }

    public int getTotalRecords() {
        return totalRecords;
    }

    public int getRecordsPerPage() {
        return recordsPerPage;
    }

    public int getTotalPages() {
        return totalPages;
    }

    public int getNowPage() {
        return nowPage;
    }

    public int getStartPage() {
        return startPage;
    }

    public int getEndPage() {
        return endPage;
    }

    public boolean hasPreviousPage() {
        return nowPage > 1;
    }

    public boolean hasNextPage() {
        return nowPage < totalPages;
    }
}