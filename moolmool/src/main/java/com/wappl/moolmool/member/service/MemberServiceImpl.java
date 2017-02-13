package com.wappl.moolmool.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wappl.moolmool.member.dao.MemberDao;
import com.wappl.moolmool.member.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDao mdao;
	
	@Override
	public MemberVO loginCheck(MemberVO mvo) {
		return mdao.loginCheck(mvo);
	}

	@Override
	public int insertMember(MemberVO vo) {
		return mdao.insertMember(vo);
	}

	@Override
	public int deleteMember(MemberVO vo) {
		return mdao.deleteMember(vo);
	}

	@Override
	public int updateMember(MemberVO vo) {
		return mdao.updateMember(vo);
	}
	
	@Override
	public int idCheck(String id) {
		return mdao.idCheck(id);
	}
	
	@Override
	public int nickNameCheck(String nickName) {
		return mdao.nickNameCheck(nickName);
	}
	
	@Override
	public int emailCheck(String email) {
		return mdao.emailCheck(email);
	}

	@Override
	public List<String> getAllEmail() {
		return mdao.getAllEmail();
	}

	@Override
	public int getMsgUser(String nick) {
		return mdao.getMsgUser(nick);
	}

	@Override
	public String getName(String email) {
		return mdao.getName(email);
	}

	@Override
	public int updateAuthNo(int result,String email) {
		return mdao.updateAuthNo(result,email);
		
	}

	@Override
	public MemberVO authCheck(int authNo) {
		return mdao.authCheck(authNo);
	}

	@Override
	public int getMemberPoint(int memNo) {
		return mdao.getMemberPoint(memNo);
	}
	
}
