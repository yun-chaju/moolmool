package com.wappl.moolmool.faq.vo;

import java.io.Serializable;

@SuppressWarnings("serial")
public class FaqTypeVO implements Serializable {

	private String fName;
	private String description;
	private String oldFName;

	public FaqTypeVO() {
	}

	public FaqTypeVO(String fName, String description, String oldFName) {
		this.fName = fName;
		this.description = description;
		this.oldFName = oldFName;
	}

	public String getOldFName() {
		return oldFName;
	}

	public void setOldFName(String oldFName) {
		this.oldFName = oldFName;
	}

	public String getfName() {
		return fName;
	}

	public void setfName(String fName) {
		this.fName = fName;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Override
	public String toString() {
		return "FaqTypeVO [fName=" + fName + ", description=" + description + ", oldFName=" + oldFName + "]";
	}

}
