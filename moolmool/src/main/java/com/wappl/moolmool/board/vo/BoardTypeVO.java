package com.wappl.moolmool.board.vo;

import java.io.Serializable;

import org.hibernate.validator.constraints.NotBlank;

@SuppressWarnings("serial")
public class BoardTypeVO implements Serializable{
	
	public BoardTypeVO(){}
	
	private String btCode;
	@NotBlank private String btName;
	private String description;
	
	public String getBtCode() {
		return btCode;
	}
	public BoardTypeVO setBtCode(String btCode) {
		this.btCode = btCode;
		return this;
	}
	public String getBtName() {
		return btName;
	}
	public BoardTypeVO setBtName(String btName) {
		this.btName = btName;
		return this;
	}
	public String getDescription() {
		return description;
	}
	public BoardTypeVO setDescription(String description) {
		this.description = description;
		return this;
	}
	
	@Override
	public String toString() {
		return "BoardTypeVO [btCode=" + btCode + ", btName=" + btName + ", description=" + description + "]";
	}
	
}
