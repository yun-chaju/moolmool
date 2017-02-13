package com.wappl.moolmool.board.vo;

import java.io.Serializable;
import java.util.Date;

@SuppressWarnings("serial")
public class BoardEvaluateVO implements Serializable {
	
	public BoardEvaluateVO(){}
	
	private int bno;
	private int memNo;
	private Date regdate;
	private String eType;
	
	public int getBno() {
		return bno;
	}
	public BoardEvaluateVO setBno(int bno) {
		this.bno = bno;
		return this;
	}
	public int getMemNo() {
		return memNo;
	}
	public BoardEvaluateVO setMemNo(int memNo) {
		this.memNo = memNo;
		return this;
	}
	public Date getRegdate() {
		return regdate;
	}
	public BoardEvaluateVO setRegdate(Date regdate) {
		this.regdate = regdate;
		return this;
	}
	public String geteType() {
		return eType;
	}
	public BoardEvaluateVO seteType(String eType) {
		this.eType = eType;
		return this;
	}
	
	@Override
	public String toString() {
		return "BoardEvaluateVO [bno=" + bno + ", memNo=" + memNo + ", regdate=" + regdate + ", eType=" + eType + "]";
	}
	
}
