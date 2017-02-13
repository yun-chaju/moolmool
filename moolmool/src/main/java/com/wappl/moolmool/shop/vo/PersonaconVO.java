package com.wappl.moolmool.shop.vo;

import java.io.Serializable;
import java.util.Date;

@SuppressWarnings("serial")
public class PersonaconVO implements Serializable{

	public PersonaconVO(){}
	
	private int pscNo;
	private String name;
	private String description;
	private String htmlTag;
	private String pscType;
	private int price;
	private int have;
	private Date regdate;
	private Date moddate;
	
	public int getPscNo() {
		return pscNo;
	}
	public PersonaconVO setPscNo(int pscNo) {
		this.pscNo = pscNo;
		return this;
	}
	public String getName() {
		return name;
	}
	public PersonaconVO setName(String name) {
		this.name = name;
		return this;
	}
	public String getDescription() {
		return description;
	}
	public PersonaconVO setDescription(String description) {
		this.description = description;
		return this;
	}
	public String getHtmlTag() {
		return htmlTag;
	}
	public PersonaconVO setHtmlTag(String htmlTag) {
		this.htmlTag = htmlTag;
		return this;
	}
	public String getPscType() {
		return pscType;
	}
	public PersonaconVO setPscType(String pscType) {
		this.pscType = pscType;
		return this;
	}
	public int getPrice() {
		return price;
	}
	public PersonaconVO setPrice(int price) {
		this.price = price;
		return this;
	}
	public int getHave() {
		return have;
	}
	public void setHave(int have) {
		this.have = have;
	}
	public Date getRegdate() {
		return regdate;
	}
	public PersonaconVO setRegdate(Date regdate) {
		this.regdate = regdate;
		return this;
	}
	public Date getModdate() {
		return moddate;
	}
	public void setModdate(Date moddate) {
		this.moddate = moddate;
	}
	
	@Override
	public String toString() {
		return "PersonaconVO [pscNo=" + pscNo + ", name=" + name + ", description=" + description + ", htmlTag="
				+ htmlTag + ", pscType=" + pscType + ", price=" + price + ", have=" + have + ", regdate=" + regdate
				+ ", moddate=" + moddate + "]";
	}
	
}
