package com.wappl.moolmool.shop.vo;

import java.io.Serializable;
import java.util.Date;

@SuppressWarnings("serial")
public class PersonaconOrderHistoryVO implements Serializable{
	
	public PersonaconOrderHistoryVO(){}
	
	private int pscNo;
	private int memNo;
	private Date orderDate;
	
	public int getPscNo() {
		return pscNo;
	}
	public PersonaconOrderHistoryVO setPscNo(int pscNo) {
		this.pscNo = pscNo;
		return this;
	}
	public int getMemNo() {
		return memNo;
	}
	public PersonaconOrderHistoryVO setMemNo(int memNo) {
		this.memNo = memNo;
		return this;
	}
	public Date getOrderDate() {
		return orderDate;
	}
	public PersonaconOrderHistoryVO setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
		return this;
	}
	
	@Override
	public String toString() {
		return "PersonaconOrderHistoryVO [pscNo=" + pscNo + ", memNo=" + memNo + ", orderDate=" + orderDate + "]";
	}
	
}
