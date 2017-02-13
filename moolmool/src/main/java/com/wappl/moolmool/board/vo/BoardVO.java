package com.wappl.moolmool.board.vo;

import java.io.Serializable;
import java.text.ParseException;
import java.util.Date;

import org.hibernate.validator.constraints.NotBlank;

import com.fasterxml.jackson.annotation.JsonFormat;


@SuppressWarnings("serial")
public class BoardVO implements Serializable{
	
	public BoardVO(){}
	
	private int pno;
	private int bno;
	@NotBlank private String title;
	@NotBlank private String content;
	private String btCode;
	private int writerNo;
	private String writerNickname;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd HH:mm:ss")
	private Date regDate;
	private Date modDate;
	private int hit;
	private int score;
	private char isDeleted;
	private int cmtCount;
	private String pscHtmlTag;
	private int reportCount;
	
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	public int getBno() {
		return bno;
	}
	public BoardVO setBno(int bno) {
		this.bno = bno;
		return this;
	}
	public String getTitle() {
		return title;
	}
	public BoardVO setTitle(String title) {
		this.title = title;
		return this;
	}
	public String getContent() {
		return content;
	}
	public BoardVO setContent(String content) {
		this.content = content;
		return this;
	}
	public String getBtCode() {
		return btCode;
	}
	public BoardVO setBtCode(String btCode) {
		this.btCode = btCode;
		return this;
	}
	public int getWriterNo() {
		return writerNo;
	}
	public BoardVO setWriterNo(int writerNo) {
		this.writerNo = writerNo;
		return this;
	}
	public String getWriterNickname() {
		return writerNickname;
	}
	public BoardVO setWriterNickname(String writerNickname) {
		this.writerNickname = writerNickname;
		return this;
	}
	public Date getRegDate() {
		return regDate;
	}
	public BoardVO setRegDate(Date regDate) throws ParseException {
		this.regDate = regDate;
		return this;
	}
	public Date getModDate() {
		return modDate;
	}
	public BoardVO setModDate(Date modDate) {
		this.modDate = modDate;
		return this;
	}
	public int getHit() {
		return hit;
	}
	public BoardVO setHit(int hit) {
		this.hit = hit;
		return this;
	}
	public int getScore() {
		return score;
	}
	public BoardVO setScore(int score) {
		this.score = score;
		return this;
	}
	public char getIsDeleted() {
		return isDeleted;
	}
	public BoardVO setIsDeleted(char isDeleted) {
		this.isDeleted = isDeleted;
		return this;
	}
	public int getCmtCount() {
		return cmtCount;
	}
	public BoardVO setCmtCount(int cmtCount) {
		this.cmtCount = cmtCount;
		return this;
	}
	public String getPscHtmlTag() {
		return pscHtmlTag;
	}
	public BoardVO setPscHtmlTag(String pscHtmlTag) {
		this.pscHtmlTag = pscHtmlTag;
		return this;
	}
	public int getReportCount() {
		return reportCount;
	}
	public void setReportCount(int reportCount) {
		this.reportCount = reportCount;
	}
	@Override
	public String toString() {
		return "BoardVO [pno=" + pno + ", bno=" + bno + ", title=" + title + ", content=" + content + ", btCode="
				+ btCode + ", writerNo=" + writerNo + ", writerNickname=" + writerNickname + ", regDate=" + regDate
				+ ", modDate=" + modDate + ", hit=" + hit + ", score=" + score + ", isDeleted=" + isDeleted
				+ ", cmtCount=" + cmtCount + ", pscHtmlTag=" + pscHtmlTag + ", reportCount=" + reportCount + "]";
	}
	
}
