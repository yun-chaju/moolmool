package com.wappl.moolmool.msg.vo;

import java.io.Serializable;
import java.util.Date;

@SuppressWarnings("serial")
public class MsgVO implements Serializable{
	
	private int mno;
	private int sno;
	private String sid;
	private String snick;
	private int rno;
	private String rid;
	private String rnick;
	private char isOpened;
	private char sDeleted;
	private char rDeleted;
	private Date sendDate;
	private Date openDate;
	private String title;
	private String content;
	private int parentMno;
	
	public MsgVO(){}

	public MsgVO(int mno, int sno, String sid, String snick, int rno, String rid, String rnick, char isOpened,
			char sDeleted, char rDeleted, Date sendDate, Date openDate, String title, String content, int parentMno) {
		super();
		this.mno = mno;
		this.sno = sno;
		this.sid = sid;
		this.snick = snick;
		this.rno = rno;
		this.rid = rid;
		this.rnick = rnick;
		this.isOpened = isOpened;
		this.sDeleted = sDeleted;
		this.rDeleted = rDeleted;
		this.sendDate = sendDate;
		this.openDate = openDate;
		this.title = title;
		this.content = content;
		this.parentMno = parentMno;
	}

	public int getMno() {
		return mno;
	}

	public void setMno(int mno) {
		this.mno = mno;
	}

	public int getSno() {
		return sno;
	}

	public void setSno(int sno) {
		this.sno = sno;
	}

	public String getSid() {
		return sid;
	}

	public void setSid(String sid) {
		this.sid = sid;
	}

	public String getSnick() {
		return snick;
	}

	public void setSnick(String snick) {
		this.snick = snick;
	}

	public int getRno() {
		return rno;
	}

	public void setRno(int rno) {
		this.rno = rno;
	}

	public String getRid() {
		return rid;
	}

	public void setRid(String rid) {
		this.rid = rid;
	}

	public String getRnick() {
		return rnick;
	}

	public void setRnick(String rnick) {
		this.rnick = rnick;
	}

	public char getIsOpened() {
		return isOpened;
	}

	public void setIsOpened(char isOpened) {
		this.isOpened = isOpened;
	}

	public char getsDeleted() {
		return sDeleted;
	}

	public void setsDeleted(char sDeleted) {
		this.sDeleted = sDeleted;
	}

	public char getrDeleted() {
		return rDeleted;
	}

	public void setrDeleted(char rDeleted) {
		this.rDeleted = rDeleted;
	}

	public Date getSendDate() {
		return sendDate;
	}

	public void setSendDate(Date sendDate) {
		this.sendDate = sendDate;
	}

	public Date getOpenDate() {
		return openDate;
	}

	public void setOpenDate(Date openDate) {
		this.openDate = openDate;
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

	public int getParentMno() {
		return parentMno;
	}

	public void setParentMno(int parentMno) {
		this.parentMno = parentMno;
	}

	@Override
	public String toString() {
		return "MsgVO [mno=" + mno + ", sno=" + sno + ", sid=" + sid + ", snick=" + snick + ", rno=" + rno + ", rid="
				+ rid + ", rnick=" + rnick + ", isOpened=" + isOpened + ", sDeleted=" + sDeleted + ", rDeleted="
				+ rDeleted + ", sendDate=" + sendDate + ", openDate=" + openDate + ", title=" + title + ", content="
				+ content + ", parentMno=" + parentMno + "]";
	}

	
}
