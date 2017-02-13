package com.wappl.moolmool.trade.vo;

import java.io.Serializable;
import java.util.Date;

@SuppressWarnings("serial")
public class TradeVO implements Serializable {

	private int tno;
	private int targettno;
	private int tdcno;
	private String title;
	private String content;
	private int price;
	private String roadAddrPart;
	private String sido;
	private String sigugun;
	private String dongmyun;
	private String addrDetail;
	private double lat;
	private double lng;
	private char tradeCode;
	private Date regDate;
	private int writerUno;
	private String writerNickname;
	private Date endDate;
	private char tradeType;
	private String file1;
	private String file2;
	private String file3;
	private String pscUrl;

	public TradeVO() {}

	public int getTno() {
		return tno;
	}

	public TradeVO setTno(int tno) {
		this.tno = tno;
		return this;
	}

	public int getTargettno() {
		return targettno;
	}

	public TradeVO setTargettno(int targettno) {
		this.targettno = targettno;
		return this;
	}

	public int getTdcno() {
		return tdcno;
	}

	public TradeVO setTdcno(int tdcno) {
		this.tdcno = tdcno;
		return this;
	}

	public String getTitle() {
		return title;
	}

	public TradeVO setTitle(String title) {
		this.title = title;
		return this;
	}

	public String getContent() {
		return content;
	}

	public TradeVO setContent(String content) {
		this.content = content;
		return this;
	}

	public int getPrice() {
		return price;
	}

	public TradeVO setPrice(int price) {
		this.price = price;
		return this;
	}

	public String getRoadAddrPart() {
		return roadAddrPart;
	}

	public TradeVO setRoadAddrPart(String roadAddrPart) {
		this.roadAddrPart = roadAddrPart;
		return this;
	}

	public String getSido() {
		return sido;
	}

	public TradeVO setSido(String sido) {
		this.sido = sido;
		return this;
	}

	public String getSigugun() {
		return sigugun;
	}

	public TradeVO setSigugun(String sigugun) {
		this.sigugun = sigugun;
		return this;
	}

	public String getDongmyun() {
		return dongmyun;
	}

	public TradeVO setDongmyun(String dongmyun) {
		this.dongmyun = dongmyun;
		return this;
	}

	public String getAddrDetail() {
		return addrDetail;
	}

	public TradeVO setAddrDetail(String addrDetail) {
		this.addrDetail = addrDetail;
		return this;
	}

	public double getLat() {
		return lat;
	}

	public TradeVO setLat(double lat) {
		this.lat = lat;
		return this;
	}

	public double getLng() {
		return lng;
	}

	public TradeVO setLng(double lng) {
		this.lng = lng;
		return this;
	}

	public char getTradeCode() {
		return tradeCode;
	}

	public TradeVO setTradeCode(char tradeCode) {
		this.tradeCode = tradeCode;
		return this;
	}

	public Date getRegDate() {
		return regDate;
	}

	public TradeVO setRegDate(Date regDate) {
		this.regDate = regDate;
		return this;
	}

	public int getWriterUno() {
		return writerUno;
	}

	public TradeVO setWriterUno(int writerUno) {
		this.writerUno = writerUno;
		return this;
	}

	public String getWriterNickname() {
		return writerNickname;
	}

	public TradeVO setWriterNickname(String writerNickname) {
		this.writerNickname = writerNickname;
		return this;
	}

	public Date getEndDate() {
		return endDate;
	}

	public TradeVO setEndDate(Date endDate) {
		this.endDate = endDate;
		return this;
	}

	public char getTradeType() {
		return tradeType;
	}

	public TradeVO setTradeType(char tradeType) {
		this.tradeType = tradeType;
		return this;
	}

	public String getFile1() {
		return file1;
	}

	public void setFile1(String file1) {
		this.file1 = file1;
	}

	public String getFile2() {
		return file2;
	}

	public void setFile2(String file2) {
		this.file2 = file2;
	}

	public String getFile3() {
		return file3;
	}

	public void setFile3(String file3) {
		this.file3 = file3;
	}
	
	public String getPscUrl() {
		return pscUrl;
	}

	public void setPscUrl(String pscUrl) {
		this.pscUrl = pscUrl;
	}

	@Override
	public String toString() {
		return "TradeVO [tno=" + tno + ", targettno=" + targettno + ", tdcno=" + tdcno + ", title=" + title
				+ ", content=" + content + ", price=" + price + ", roadAddrPart=" + roadAddrPart + ", sido=" + sido
				+ ", sigugun=" + sigugun + ", dongmyun=" + dongmyun + ", addrDetail=" + addrDetail + ", lat=" + lat
				+ ", lng=" + lng + ", tradeCode=" + tradeCode + ", regDate=" + regDate + ", writerUno=" + writerUno
				+ ", writerNickname=" + writerNickname + ", endDate=" + endDate + ", tradeType=" + tradeType
				+ ", file1=" + file1 + ", file2=" + file2 + ", file3=" + file3 + ", pscUrl=" + pscUrl + "]";
	}
	
}
