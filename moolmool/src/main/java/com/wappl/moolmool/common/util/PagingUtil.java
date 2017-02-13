package com.wappl.moolmool.common.util;

public class PagingUtil {
	
	public PagingUtil(){}
	
	private int divPage = 10; // 하단 네비게이션에 보여줄 번호 개수
	private int perPage = 10; // 한 화면에 보여줄 게시글 수
	
	private int startPage;
	private int endPage;
	private boolean hasPrev;
	private boolean hasNext;
	
	public PagingUtil getPageInfo(int curPage, int totalCount) {
		return doProcess(curPage, totalCount);
	}
	
	private PagingUtil doProcess(int curPage, int totalCount) {
		curPage = curPage>0 ? curPage : 1;
		setStartPage(curPage, totalCount);
		setEndPage(getTotalPage(totalCount));
		setHasPrev();
		setHasNext(totalCount);
		return this;
	}

	private int getTotalPage(int totalCount) {
		return (int)(Math.ceil(totalCount / (double)perPage));
	}

	private void setStartPage(int curPage, int totalCount) {
		this.startPage = 
				totalCount != 0 ? (int)(((int)Math.floor((double)(curPage - 1) / (double)divPage)) * divPage + 1): 1;
	}

	private void setEndPage(int totalPage) {
		totalPage = totalPage>0 ? totalPage : 1;
		this.endPage = 
				startPage + (divPage - 1) > totalPage ? totalPage : startPage + (divPage - 1);
	}

	private void setHasPrev() {
		this.hasPrev = startPage == 1 ? false : true;
	}

	private void setHasNext(int totalCount) {
		this.hasNext = endPage * perPage >= totalCount ? false : true;
	}

	public int getStartPage() {
		return startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public boolean isHasPrev() {
		return hasPrev;
	}

	public boolean isHasNext() {
		return hasNext;
	}
	
	public PagingUtil setPerPage(int perPage) {
		this.perPage = perPage;
		return this;
	}

	@Override
	public String toString() {
		return "PagingUtil [divPage=" + divPage + ", perPage=" + perPage + ", startPage=" + startPage + ", endPage="
				+ endPage + ", hasPrev=" + hasPrev + ", hasNext=" + hasNext + "]";
	}

}
