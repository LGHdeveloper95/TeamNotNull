package com.guguin.company.vo;

public class GridPaging {
	  private int page;
	    private int pageSize;
	    private int totalRecords;
	    private int totalPages;
	    private int startRecord;

	    public GridPaging(int page, int pageSize, int totalRecords) {
	        this.page = page;
	        this.pageSize = pageSize;
	        this.totalRecords = totalRecords;
	        this.totalPages = (int) Math.ceil((double) totalRecords / pageSize);
	        this.startRecord = (page - 1) * pageSize; // OFFSET으로 사용할 startRecord 값 계산
	    }

	    // Getters
	    public int getPage() { return page; }
	    public int getPageSize() { return pageSize; }
	    public int getTotalRecords() { return totalRecords; }
	    public int getTotalPages() { return totalPages; }
	    public int getStartRecord() { return startRecord; }
	}