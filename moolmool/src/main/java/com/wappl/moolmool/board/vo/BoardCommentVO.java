package com.wappl.moolmool.board.vo;

import java.io.Serializable;
import java.sql.Date;

import org.hibernate.validator.constraints.NotBlank;

@SuppressWarnings("serial")
public class BoardCommentVO implements Serializable{
	
	public BoardCommentVO(){}
	
	private int cno;
	private int bno;
	@NotBlank private String content;
	private int writerNo;
	private String writerNickname;
	private int parentWriterNo = 0;
	private String parentWriterNickname = "";
	private Date regDate;
	private Date modDate;
	private int parentNo;
	private char isDeleted;
	
	public int getCno() {
		return cno;
	}
	public BoardCommentVO setCno(int cno) {
		this.cno = cno;
		return this;
	}
	public int getBno() {
		return bno;
	}
	public BoardCommentVO setBno(int bno) {
		this.bno = bno;
		return this;
	}
	public String getContent() {
		return content;
	}
	public BoardCommentVO setContent(String content) {
		this.content = content;
		return this;
	}
	public int getWriterNo() {
		return writerNo;
	}
	public BoardCommentVO setWriterNo(int writerNo) {
		this.writerNo = writerNo;
		return this;
	}
	public String getWriterNickname() {
		return writerNickname;
	}
	public BoardCommentVO setWriterNickname(String writerNickname) {
		this.writerNickname = writerNickname;
		return this;
	}
	public int getParentWriterNo() {
		return parentWriterNo;
	}
	public BoardCommentVO setParentWriterNo(int parentWriterNo) {
		this.parentWriterNo = parentWriterNo;
		return this;
	}
	public String getParentWriterNickname() {
		return parentWriterNickname;
	}
	public BoardCommentVO setParentWriterNickname(String parentWriterNickname) {
		this.parentWriterNickname = parentWriterNickname;
		return this;
	}
	public Date getRegDate() {
		return regDate;
	}
	public BoardCommentVO setRegDate(Date regDate) {
		this.regDate = regDate;
		return this;
	}
	public Date getModDate() {
		return modDate;
	}
	public BoardCommentVO setModDate(Date modDate) {
		this.modDate = modDate;
		return this;
	}
	public int getParentNo() {
		return parentNo;
	}
	public BoardCommentVO setParentNo(int parentNo) {
		this.parentNo = parentNo;
		return this;
	}
	public char getIsDeleted() {
		return isDeleted;
	}
	public BoardCommentVO setIsDeleted(char isDeleted) {
		this.isDeleted = isDeleted;
		return this;
	}
	
	@Override
	public String toString() {
		return "BoardCommentVO [cno=" + cno + ", bno=" + bno + ", content=" + content + ", writerNo=" + writerNo
				+ ", writerNickname=" + writerNickname + ", parentWriterNo=" + parentWriterNo
				+ ", parentWriterNickname=" + parentWriterNickname + ", regDate=" + regDate + ", modDate=" + modDate
				+ ", parentNo=" + parentNo + ", isDeleted=" + isDeleted + "]";
	}
	
}
