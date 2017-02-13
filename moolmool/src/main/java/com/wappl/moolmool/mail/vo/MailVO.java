package com.wappl.moolmool.mail.vo;

import java.io.Serializable;

@SuppressWarnings("serial")
public class MailVO implements Serializable{

	private String subject;
	private String content;
    private String regdate;
    private String reciver;
    private String mailList;
       
	public MailVO() {}

	public MailVO(String subject, String content, String regdate, String reciver, String mailList) {
		super();
		this.subject = subject;
		this.content = content;
		this.regdate = regdate;
		this.reciver = reciver;
		this.mailList = mailList;
	}


	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public String getReciver() {
		return reciver;
	}

	public void setReciver(String reciver) {
		this.reciver = reciver;
	}

	public String getMailList() {
		return mailList;
	}

	public void setMailList(String mailList) {
		this.mailList = mailList;
	}

	@Override
	public String toString() {
		return "MailVO [subject=" + subject + ", content=" + content + ", regdate=" + regdate + ", reciver=" + reciver
				+ ", mailList=" + mailList + "]";
	}

	
	

}
