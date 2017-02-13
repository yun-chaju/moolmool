package com.wappl.moolmool.qna.vo;

import java.io.Serializable;
import java.sql.Date;

import org.hibernate.validator.constraints.NotBlank;

@SuppressWarnings("serial")
public class AnswerVO implements Serializable {

	private int ano;
	private int qno;
	private int adminNo;
	private	String adminNickname;
	@NotBlank private String content;
	private Date regDate;
	private Date modDate;
	private char isEvaluated;
	
	public AnswerVO(){}

	public AnswerVO(int ano, int qno, int adminNo, String adminNickname, String content, Date regDate, Date modDate, char isEvaluated) {
		super();
		this.ano = ano;
		this.qno = qno;
		this.adminNo = adminNo;
		this.adminNickname = adminNickname;
		this.content = content;
		this.regDate = regDate;
		this.modDate = modDate;
		this.isEvaluated = isEvaluated;
	}

	public int getAno() {
		return ano;
	}

	public void setAno(int ano) {
		this.ano = ano;
	}

	public int getQno() {
		return qno;
	}

	public void setQno(int qno) {
		this.qno = qno;
	}

	public int getAdminNo() {
		return adminNo;
	}

	public void setAdminNo(int adminNo) {
		this.adminNo = adminNo;
	}
	
	public String getAdminNickname() {
		return adminNickname;
	}

	public void setAdminNickname(String adminNickname) {
		this.adminNickname = adminNickname;
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

	public char getIsEvaluated() {
		return isEvaluated;
	}

	public void setIsEvaluated(char isEvaluated) {
		this.isEvaluated = isEvaluated;
	}

	@Override
	public String toString() {
		return "AnswerVO [ano=" + ano + ", qno=" + qno + ", adminNo=" + adminNo + ", adminNickname=" + adminNickname
				+ ", content=" + content + ", regDate=" + regDate + ", modDate=" + modDate + ", isEvaluated="
				+ isEvaluated + "]";
	}

}
