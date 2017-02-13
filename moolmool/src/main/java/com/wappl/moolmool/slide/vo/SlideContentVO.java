package com.wappl.moolmool.slide.vo;

import java.io.Serializable;
import java.util.Date;

@SuppressWarnings("serial")
public class SlideContentVO implements Serializable{

	public SlideContentVO(){}
	
	private int sno;
	private String content;
	private Date regdate;
	private int writerNo;
	
	public int getSno() {
		return sno;
	}
	public SlideContentVO setSno(int sno) {
		this.sno = sno;
		return this;
	}
	public String getContent() {
		return content;
	}
	public SlideContentVO setContent(String content) {
		this.content = content;
		return this;
	}
	public Date getRegdate() {
		return regdate;
	}
	public SlideContentVO setRegdate(Date regdate) {
		this.regdate = regdate;
		return this;
	}
	public int getWriterNo() {
		return writerNo;
	}
	public SlideContentVO setWriterNo(int writerNo) {
		this.writerNo = writerNo;
		return this;
	}
	
	@Override
	public String toString() {
		return "SlideContentVO [sno=" + sno + ", content=" + content + ", regdate=" + regdate + ", writerNo=" + writerNo
				+ "]";
	}
	
}
