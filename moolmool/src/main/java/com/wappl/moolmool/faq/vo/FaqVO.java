package com.wappl.moolmool.faq.vo;

import java.io.Serializable;
import java.sql.Date;

@SuppressWarnings("serial")
public class FaqVO implements Serializable{
	
	private int fNo;
	private String fName;
	private String title;
	private String content;
	private Date regDate;
	private Date modDate;
	private String description;
	
	public FaqVO() {}

	public FaqVO(int fNo, String fName, String title, String content, Date regDate, Date modDate, String description) {
		super();
		this.fNo = fNo;
		this.fName = fName;
		this.title = title;
		this.content = content;
		this.regDate = regDate;
		this.modDate = modDate;
		this.description = description;
	}

	public int getfNo() {
		return fNo;
	}

	public void setfNo(int fNo) {
		this.fNo = fNo;
	}

	public String getfName() {
		return fName;
	}

	public void setfName(String fName) {
		this.fName = fName;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public Date getModDate() {
		return modDate;
	}

	public void setModDate(Date modDate) {
		this.modDate = modDate;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Override
	public String toString() {
		return "FaqVO [fNo=" + fNo + ", fName=" + fName + ", title=" + title + ", content=" + content + ", regDate="
				+ regDate + ", modDate=" + modDate + ", description=" + description + "]";
	}

	
	
}
