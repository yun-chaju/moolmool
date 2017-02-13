package com.wappl.moolmool.map.vo;

import java.io.Serializable;

@SuppressWarnings("serial")
public class MapVO implements Serializable{

	private String title;
	private String category;
	private String subcategory;
	private String tradeType;
	private String sd;
	private String sgg;
	private String emd;
	private String addr;
	private int page;
	
	public MapVO(){}

	public MapVO(String title, String category, String subcategory, String tradeType, String sd, String sgg, String emd,
			String addr, int page) {
		super();
		this.title = title;
		this.category = category;
		this.subcategory = subcategory;
		this.tradeType = tradeType;
		this.sd = sd;
		this.sgg = sgg;
		this.emd = emd;
		this.addr = addr;
		this.page = page;
	}
	
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getSubcategory() {
		return subcategory;
	}

	public void setSubcategory(String subcategory) {
		this.subcategory = subcategory;
	}

	public String getTradeType() {
		return tradeType;
	}

	public void setTradeType(String tradeType) {
		this.tradeType = tradeType;
	}

	public String getSd() {
		return sd;
	}

	public void setSd(String sd) {
		this.sd = sd;
	}

	public String getSgg() {
		return sgg;
	}

	public void setSgg(String sgg) {
		this.sgg = sgg;
	}

	public String getEmd() {
		return emd;
	}

	public void setEmd(String emd) {
		this.emd = emd;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	@Override
	public String toString() {
		return "MapVO [title=" + title + ", category=" + category + ", subcategory=" + subcategory + ", tradeType="
				+ tradeType + ", sd=" + sd + ", sgg=" + sgg + ", emd=" + emd + ", addr=" + addr + ", page=" + page
				+ "]";
	}

		
}
