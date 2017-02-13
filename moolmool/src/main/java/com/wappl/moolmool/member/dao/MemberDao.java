package com.wappl.moolmool.member.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wappl.moolmool.member.vo.MemberVO;

@Repository
public class MemberDao {
	
private static final String NAMESPACE = "memberMapper.";
	
	@Autowired
	private SqlSession sqlSession;
	
	public MemberVO loginCheck(MemberVO vo) {
		return sqlSession.selectOne(NAMESPACE+"getMember", vo);
	}

	public int insertMember(MemberVO vo) {
		return sqlSession.insert(NAMESPACE+"insertMember", vo);
	}

	public int deleteMember(MemberVO vo) {
		return sqlSession.delete(NAMESPACE+"deleteMember", vo);
	}

	public int updateMember(MemberVO vo) {
		return sqlSession.update(NAMESPACE+"updateMember",vo);
	}

	public int idCheck(String id) {
		return sqlSession.selectOne(NAMESPACE+"idCheck", id);
	}

	public int nickNameCheck(String nickName) {
		return sqlSession.selectOne(NAMESPACE+"nickNameCheck", nickName);
	}
	
	public int emailCheck(String email) {
		return sqlSession.selectOne(NAMESPACE+"emailCheck", email);
	}

	public List<String> getAllEmail() {
		return sqlSession.selectList(NAMESPACE+"getAllEmail");
	}
	
	public int getMsgUser(String nick) {
		return sqlSession.selectOne(NAMESPACE + "getMsgUser", nick);
	}

	public String getName(String email) {
		return sqlSession.selectOne(NAMESPACE + "getName", email);
	}

	public int updateAuthNo(int result, String email) {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("result", result);
		paramMap.put("email", email);
		return sqlSession.update(NAMESPACE + "updateAuthNo", paramMap);
	}

	public MemberVO authCheck(int authNo) {
		return sqlSession.selectOne(NAMESPACE+"authCheck", authNo);
	}
	
	public int updateMemberNickname(String nickname, int memNo) {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("nickname", nickname);
		paramMap.put("memNo", memNo);
		return sqlSession.update(NAMESPACE + "updateMemberNickname", paramMap);
	}
	
	public int getMemberPoint(int memNo) {
		return sqlSession.selectOne("getMemberPoint", memNo);
	}
	
}

