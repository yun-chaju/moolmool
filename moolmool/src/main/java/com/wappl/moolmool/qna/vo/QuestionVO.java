package com.wappl.moolmool.qna.vo;

import java.io.Serializable;
import java.sql.Date;

import org.hibernate.validator.constraints.NotBlank;

@SuppressWarnings("serial")
public class QuestionVO implements Serializable {

	private int qno;
	private int writerNo;
	private String writerNickname;
	@NotBlank private String title;
	@NotBlank private String content;
	private Date regDate;
	private Date modDate;
	private char isPrivate;
	private char isDeleted;
	private char reply;
	
	public QuestionVO(){}

	public QuestionVO(int qno, int writerNo, String writerNickname, String title, String content, Date regDate,
			Date modDate, char isPrivate, char isDeleted, char reply) {
		super();
		this.qno = qno;
		this.writerNo = writerNo;
		this.writerNickname = writerNickname;
		this.title = title;
		this.content = content;
		this.regDate = regDate;
		this.modDate = modDate;
		this.isPrivate = isPrivate;
		this.isDeleted = isDeleted;
		this.reply = reply;
	}

	public int getQno() {
		return qno;
	}

	public void setQno(int qno) {
		this.qno = qno;
	}

	public int getWriterNo() {
		return writerNo;
	}

	public void setWriterNo(int writerNo) {
		this.writerNo = writerNo;
	}

	public String getWriterNickname() {
		return writerNickname;
	}

	public void setWriterNickname(String writerNickname) {
		this.writerNickname = writerNickname;
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

	public char getIsPrivate() {
		return isPrivate;
	}

	public void setIsPrivate(char isPrivate) {
		this.isPrivate = isPrivate;
	}

	public char getIsDeleted() {
		return isDeleted;
	}

	public void setIsDeleted(char isDeleted) {
		this.isDeleted = isDeleted;
	}

	public char getReply() {
		return reply;
	}

	public void setReply(char reply) {
		this.reply = reply;
	}

	@Override
	public String toString() {
		return "QuestionVO [qno=" + qno + ", writerNo=" + writerNo + ", writerNickname="
				+ writerNickname + ", title=" + title + ", content=" + content + ", regDate=" + regDate + ", modDate="
				+ modDate + ", isPrivate=" + isPrivate + ", isDeleted=" + isDeleted + ", reply=" + reply + "]";
	}


	
	
	
}
