package com.wappl.moolmool.member.vo;

import java.io.Serializable;
import java.sql.Date;

import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;

@SuppressWarnings("serial")
public class MemberVO implements Serializable {

	private int memNo;
	private String roleCode;
	@NotBlank(message="필수 정보입니다.")
	@Length(min=5,max=20,message="5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.")
	@Pattern(regexp="^[a-zA-Z0-9_-]+$", message="5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.")
	private String id;
	private boolean rememberId;
	@NotBlank(message="필수 정보입니다.")
	@Length(min=6,max=16,message="6~16자 영문 대 소문자, 숫자, 특수문자를 조합하여 사용하세요.")
	@Pattern(regexp="^(?=.*[0-9])(?=.*[a-zA-Z])(?=.*[!@#$%^&+=*])[0-9a-zA-Z!@#$%^&+=]*$", message="6~16자 영문 대 소문자, 숫자, 특수문자를 조합하여 사용하세요.")
	private String password;
	@NotBlank(message="필수 정보입니다.")
	@Pattern(regexp="^[a-zA-Z가-힣]+$", message="한글, 영문 대소문자를 이용해 주세요.")
	private String nickName;
	
	@NotBlank(message="필수 정보입니다.") 
	@Pattern(regexp="^[a-zA-Z가-힣]+$", message="한글, 영문 대소문자를 이용해 주세요.")
	private String name;
	@NotBlank(message="필수 정보입니다.") 
	@Email(message="이메일 주소를 다시 확인해주세요.")
	private String email;
	@NotBlank(message="주소를 검색 해주세요.")
	private String zipCode;
	@NotBlank(message="주소를 검색 해주세요.")
	private String roadAddrPart;
	@NotBlank(message="주소를 검색 해주세요.")
	private String addrDetail;
	@NotBlank(message="주소를 검색 해주세요.")
	private String jibunAddr;
	@NotBlank(message="필수 정보입니다.")
	@Length(min=10,max=11,message="전화번호를 다시 확인해주세요.")
	@Pattern(regexp="^01[016789]+[0-9-]+$", message="전화번호를 다시 확인해주세요.")
	private String phone;
	private Date regdate;
	private Date lastModDate;
	
	private int authNo;
	private int point;
	private int totPoint;
	private char status;
	private int pscCode;
	private String pscUrl;

	public MemberVO() {
	}

	public MemberVO(int memNo, String roleCode, String id, boolean rememberId, String password, String nickName,
			String name, String email, String zipCode, String roadAddrPart, String addrDetail, String jibunAddr,
			String phone, Date regdate, Date lastModDate, int authNo, int point, int totPoint, char status) {
		super();
		this.memNo = memNo;
		this.roleCode = roleCode;
		this.id = id;
		this.rememberId = rememberId;
		this.password = password;
		this.nickName = nickName;
		this.name = name;
		this.email = email;
		this.zipCode = zipCode;
		this.roadAddrPart = roadAddrPart;
		this.addrDetail = addrDetail;
		this.jibunAddr = jibunAddr;
		this.phone = phone;
		this.regdate = regdate;
		this.lastModDate = lastModDate;
		this.authNo = authNo;
		this.point = point;
		this.totPoint = totPoint;
		this.status = status;
	}

	public boolean isRememberId() {
		return rememberId;
	}

	public MemberVO setRememberId(boolean rememberId) {
		this.rememberId = rememberId;
		return this;
	}

	public int getMemNo() {
		return memNo;
	}

	public MemberVO setMemNo(int memNo) {
		this.memNo = memNo;
		return this;
	}

	public String getRoleCode() {
		return roleCode;
	}

	public MemberVO setRoleCode(String roleCode) {
		this.roleCode = roleCode;
		return this;
	}

	public String getId() {
		return id;
	}

	public MemberVO setId(String id) {
		this.id = id;
		return this;
	}

	public String getPassword() {
		return password;
	}

	public MemberVO setPassword(String password) {
		this.password = password;
		return this;
	}

	public String getNickName() {
		return nickName;
	}

	public MemberVO setNickName(String nickName) {
		this.nickName = nickName;
		return this;
	}

	public String getName() {
		return name;
	}

	public MemberVO setName(String name) {
		this.name = name;
		return this;
	}

	public String getEmail() {
		return email;
	}

	public MemberVO setEmail(String email) {
		this.email = email;
		return this;
	}

	public String getZipCode() {
		return zipCode;
	}

	public MemberVO setZipCode(String zipCode) {
		this.zipCode = zipCode;
		return this;
	}

	public String getRoadAddrPart() {
		return roadAddrPart;
	}

	public MemberVO setRoadAddrPart(String roadAddrPart) {
		this.roadAddrPart = roadAddrPart;
		return this;
	}

	public String getJibunAddr() {
		return jibunAddr;
	}

	public MemberVO setJibunAddr(String jibunAddr) {
		this.jibunAddr = jibunAddr;
		return this;
	}

	public String getAddrDetail() {
		return addrDetail;
	}

	public MemberVO setAddrDetail(String addrDetail) {
		this.addrDetail = addrDetail;
		return this;
	}

	public String getPhone() {
		return phone;
	}

	public MemberVO setPhone(String phone) {
		this.phone = phone;
		return this;
	}

	public Date getRegdate() {
		return regdate;
	}

	public MemberVO setRegdate(Date regdate) {
		this.regdate = regdate;
		return this;
	}

	public Date getLastModDate() {
		return lastModDate;
	}

	public MemberVO setLastModDate(Date lastModDate) {
		this.lastModDate = lastModDate;
		return this;
	}
	
	public int getAuthNo() {
		return authNo;
	}

	public void setAuthNo(int authNo) {
		this.authNo = authNo;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public int getTotPoint() {
		return totPoint;
	}

	public void setTotPoint(int totPoint) {
		this.totPoint = totPoint;
	}

	public char getStatus() {
		return status;
	}

	public void setStatus(char status) {
		this.status = status;
	}

	public int getPscCode() {
		return pscCode;
	}

	public void setPscCode(int pscCode) {
		this.pscCode = pscCode;
	}

	public String getPscUrl() {
		return pscUrl;
	}

	public void setPscUrl(String pscUrl) {
		this.pscUrl = pscUrl;
	}

	@Override
	public String toString() {
		return "MemberVO [memNo=" + memNo + ", roleCode=" + roleCode + ", id=" + id + ", rememberId=" + rememberId
				+ ", password=" + password + ", nickName=" + nickName + ", name=" + name + ", email=" + email
				+ ", zipCode=" + zipCode + ", roadAddrPart=" + roadAddrPart + ", addrDetail=" + addrDetail
				+ ", jibunAddr=" + jibunAddr + ", phone=" + phone + ", regdate=" + regdate + ", lastModDate="
				+ lastModDate + ", authNo=" + authNo + ", point=" + point + ", totPoint=" + totPoint + ", status="
				+ status + ", pscCode=" + pscCode + ", pscUrl=" + pscUrl + "]";
	}
	
}