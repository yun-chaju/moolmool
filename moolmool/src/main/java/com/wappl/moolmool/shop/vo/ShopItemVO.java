package com.wappl.moolmool.shop.vo;

import java.io.Serializable;
import java.util.Date;

@SuppressWarnings("serial")
public class ShopItemVO implements Serializable{

	public ShopItemVO(){}
	
	private int itemNo;
	private String name;
	private String description;
	private String htmlTag;
	private String itemType; // font, imgs 등
	private int price;
	private int have; // 보유 여부
	private Date regdate;
	private Date moddate;
	
	public int getItemNo() {
		return itemNo;
	}
	public void setItemNo(int itemNo) {
		this.itemNo = itemNo;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getHtmlTag() {
		return htmlTag;
	}
	public void setHtmlTag(String htmlTag) {
		this.htmlTag = htmlTag;
	}
	public String getItemType() {
		return itemType;
	}
	public void setItemType(String itemType) {
		this.itemType = itemType;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
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
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public Date getModdate() {
		return moddate;
	}
	public void setModdate(Date moddate) {
		this.moddate = moddate;
	}
	
	@Override
	public String toString() {
		return "ShopItemVO [itemNo=" + itemNo + ", name=" + name + ", description=" + description + ", htmlTag="
				+ htmlTag + ", itemType=" + itemType + ", price=" + price + ", have=" + have + ", regdate=" + regdate
				+ ", moddate=" + moddate + "]";
	}
	
}
