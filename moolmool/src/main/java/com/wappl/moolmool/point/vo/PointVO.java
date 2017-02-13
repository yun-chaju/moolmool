package com.wappl.moolmool.point.vo;

import java.sql.Date;

public class PointVO {

	private int memNo;
	private String logComment;
	private int pointChange;
	private char addEli;
	private Date pointDate;

	
	public PointVO() {}

	public PointVO(String log, int pointChange, int memNo, Date pointDate, char addEli) {
		super();
		this.logComment = log;
		this.pointChange = pointChange;
		this.memNo = memNo;
		this.pointDate = pointDate;
		this.addEli = addEli;
	}

	public String getLog() {
		return logComment;
	}

	public PointVO setLog(String log) {
		this.logComment = log;
		return this;
	}

	public int getPointChange() {
		return pointChange;
	}

	public PointVO setPointChange(int pointChange) {
		this.pointChange = pointChange;
		return this;
	}

	public int getMemNo() {
		return memNo;
	}

	public PointVO setMemNo(int memNo) {
		this.memNo = memNo;
		return this;
	}

	public Date getPointDate() {
		return pointDate;
	}

	public PointVO setPointDate(Date pointDate) {
		this.pointDate = pointDate;
		return this;
	}

	public char getAddEli() {
		return addEli;
	}

	public PointVO setAddEli(char addEli) {
		this.addEli = addEli;
		return this;
	}

	@Override
	public String toString() {
		return "PointVO [log=" + logComment + ", pointChange=" + pointChange + ", memNo=" + memNo + ", pointDate=" + pointDate
				+ ", addEli=" + addEli + "]";
	}

	
}
