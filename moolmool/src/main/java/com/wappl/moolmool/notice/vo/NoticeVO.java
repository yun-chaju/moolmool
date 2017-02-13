package com.wappl.moolmool.notice.vo;

import java.sql.Date;

import org.hibernate.validator.constraints.NotBlank;

@SuppressWarnings("serial")
public class NoticeVO implements java.io.Serializable {
	
	private int nno;
	
	@NotBlank private String title;
	@NotBlank private String content;
	@NotBlank private String category;
	private int hit;
	private Date regDate;
	private Date modDate;
	private char isDeleted;
	
	public NoticeVO(){}

	public int getnNo() {
		return nno;
	}

	public void setnNo(int nNo) {
		this.nno = nNo;
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

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
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

	public char getIsDeleted() {
		return isDeleted;
	}

	public void setIsDeleted(char isDeleted) {
		this.isDeleted = isDeleted;
	}

	@Override
	public String toString() {
		return "NoticeVO [nNo=" + nno + ", title=" + title + ", content=" + content + ", category=" + category
				+ ", hit=" + hit + ", regDate=" + regDate + ", modDate=" + modDate + ", isDeleted=" + isDeleted + "]";
	}

	
}
