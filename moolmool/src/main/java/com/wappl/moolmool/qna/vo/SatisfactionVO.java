package com.wappl.moolmool.qna.vo;

import java.io.Serializable;
import java.sql.Date;

import org.hibernate.validator.constraints.NotBlank;

@SuppressWarnings("serial")
public class SatisfactionVO implements Serializable {
	// Field Area	
	private int ano;
	private int writerNo;
	private double rate;
	@NotBlank private String opinion;
	private Date regDate;
	
	// Constructor Area
	public SatisfactionVO(){}
	
	public SatisfactionVO(int ano, int writerNo, double rate, String opinion, Date regDate) {
		super();
		this.ano = ano;
		this.writerNo = writerNo;
		this.rate = rate;
		this.opinion = opinion;
		this.regDate = regDate;
	}
	
	// Method Area
	public int getAno() {
		return ano;
	}

	public void setAno(int ano) {
		this.ano = ano;
	}

	public int getWriterNo() {
		return writerNo;
	}

	public void setWriterNo(int writerNo) {
		this.writerNo = writerNo;
	}

	public double getRate() {
		return rate;
	}

	public void setRate(double rate) {
		this.rate = rate;
	}

	public String getOpinion() {
		return opinion;
	}

	public void setOpinion(String opinion) {
		this.opinion = opinion;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	@Override
	public String toString() {
		return "SatisfactionVO [ano=" + ano + ", writerNo=" + writerNo + ", rate=" + rate + ", opinion=" + opinion
				+ ", regDate=" + regDate + "]";
	}
	
	
	
	
}
