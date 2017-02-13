package com.wappl.moolmool.trade.vo;

import java.io.Serializable;

@SuppressWarnings("serial")
public class TradeCategoryVO implements Serializable {
	
	private int tdcno;
	private String name;
	private int parentno;

	public TradeCategoryVO(){}

	public TradeCategoryVO(int tdcNo, String name, int parentno) {
		super();
		this.tdcno = tdcNo;
		this.name = name;
		this.parentno = parentno;
	}

	public int getTdcNo() {
		return tdcno;
	}

	public void setTdcNo(int tdcNo) {
		this.tdcno = tdcNo;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getParentNo() {
		return parentno;
	}

	public void setParentNo(int parentNo) {
		this.parentno = parentNo;
	}

	@Override
	public String toString() {
		return "TradeCategoryVO [tdcNo=" + tdcno + ", name=" + name + ", parentNo=" + parentno + "]";
	}

}
