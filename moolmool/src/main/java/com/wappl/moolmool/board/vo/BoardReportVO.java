package com.wappl.moolmool.board.vo;

import java.io.Serializable;
import java.util.Date;

@SuppressWarnings("serial")
public class BoardReportVO implements Serializable {
	
	public BoardReportVO(){}
	
	private int bno;
	private int memNo;
	private Date regdate;
	
	public int getBno() {
		return bno;
	}
	public BoardReportVO setBno(int bno) {
		this.bno = bno;
		return this;
	}
	public int getMemNo() {
		return memNo;
	}
	public BoardReportVO setMemNo(int memNo) {
		this.memNo = memNo;
		return this;
	}
	public Date getRegdate() {
		return regdate;
	}
	public BoardReportVO setRegdate(Date regdate) {
		this.regdate = regdate;
		return this;
	}
	
	@Override
	public String toString() {
		return "BoardReportVO [bno=" + bno + ", memNo=" + memNo + ", regdate=" + regdate + "]";
	}
	
}
