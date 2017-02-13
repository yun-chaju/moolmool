package com.wappl.moolmool.trade.vo;

import java.io.Serializable;
import java.sql.Date;

@SuppressWarnings("serial")
public class TradeCommentVO implements Serializable{
	
	private int tcno;
	private int tno;
	private String content;
	private String alink;
	private Date regDate;
	private int writerUno;
	private String writerNickname;
	
	public TradeCommentVO(){}

	public int getTcno() {
		return tcno;
	}

	public void setTcno(int tcno) {
		this.tcno = tcno;
	}

	public int getTno() {
		return tno;
	}

	public void setTno(int tno) {
		this.tno = tno;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getAlink() {
		return alink;
	}

	public void setAlink(String alink) {
		this.alink = alink;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public int getWriterUno() {
		return writerUno;
	}

	public void setWriterUno(int writerUno) {
		this.writerUno = writerUno;
	}

	public String getWriterNickname() {
		return writerNickname;
	}

	public void setWriterNickname(String writerNickname) {
		this.writerNickname = writerNickname;
	}

	@Override
	public String toString() {
		return "TradeCommentVO [tcno=" + tcno + ", tno=" + tno + ", content=" + content + ", alink=" + alink
				+ ", regDate=" + regDate + ", writerUno=" + writerUno + ", writerNickname=" + writerNickname + "]";
	};

}
