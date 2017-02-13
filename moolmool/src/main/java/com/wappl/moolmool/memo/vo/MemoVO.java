package com.wappl.moolmool.memo.vo;

import java.io.Serializable;
import java.util.Date;

@SuppressWarnings("serial")
public class MemoVO implements Serializable{

	public MemoVO(){}
	
	private int writerNo;
	private int targetNo;
	private String content;
	private Date regdate;
	private Date moddate;
	
	public int getWriterNo() {
		return writerNo;
	}
	public MemoVO setWriterNo(int writerNo) {
		this.writerNo = writerNo;
		return this;
	}
	public int getTargetNo() {
		return targetNo;
	}
	public MemoVO setTargetNo(int targetNo) {
		this.targetNo = targetNo;
		return this;
	}
	public String getContent() {
		return content;
	}
	public MemoVO setContent(String content) {
		this.content = content;
		return this;
	}
	public Date getRegdate() {
		return regdate;
	}
	public MemoVO setRegdate(Date regdate) {
		this.regdate = regdate;
		return this;
	}
	public Date getModdate() {
		return moddate;
	}
	public MemoVO setModdate(Date moddate) {
		this.moddate = moddate;
		return this;
	}
	
	@Override
	public String toString() {
		return "MemoVO [writerNo=" + writerNo + ", targetNo=" + targetNo + ", content=" + content + ", regdate="
				+ regdate + ", moddate=" + moddate + "]";
	}
	
}
