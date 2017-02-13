package com.wappl.moolmool.member.service;

import java.util.List;

import com.wappl.moolmool.member.vo.MemberVO;

public interface MemberService {
	
	public MemberVO loginCheck(MemberVO vo);

	public int insertMember(MemberVO vo);

	public int deleteMember(MemberVO vo);

	public int updateMember(MemberVO vo);

	public int idCheck(String id);

	public int nickNameCheck(String nickName);
	
	public int emailCheck(String email);
	
	public List<String> getAllEmail();
	
	public int getMsgUser(String nickName);

	public String getName(String email);

	public int updateAuthNo(int result,String email);

	public MemberVO authCheck(int authNo);
	
	public int getMemberPoint(int memNo);
	
}

