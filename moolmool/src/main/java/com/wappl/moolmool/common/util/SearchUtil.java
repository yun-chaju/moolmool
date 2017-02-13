package com.wappl.moolmool.common.util;

// 나중에 검색 관련 처리를 따로 해 줄 때 사용할 목적
public class SearchUtil {
	
	public SearchUtil(){}
	
	private String sType;
	private String sKeyword;
	
	public String getsType() {
		return sType;
	}
	public void setsType(String sType) {
		this.sType = sType;
	}
	public String getsKeyword() {
		return sKeyword;
	}
	public void setsKeyword(String sKeyword) {
		this.sKeyword = sKeyword;
	}
	
	@Override
	public String toString() {
		return "SearchUtil [sType=" + sType + ", sKeyword=" + sKeyword + "]";
	}
	
}
