package com.wappl.moolmool.admin.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wappl.moolmool.board.vo.BoardVO;
import com.wappl.moolmool.common.util.SearchUtil;
import com.wappl.moolmool.member.vo.MemberVO;

@Repository
public class AdminDao {
	
	private static final String NAMESPACE = "adminMapper.";
	
	@Autowired
	private SqlSession sqlSession;

	public int getMemberCount() {
		return sqlSession.selectOne(NAMESPACE + "getMemberCount");
	}
	
	public int getMemberAllCount() {
		return sqlSession.selectOne(NAMESPACE + "getMemberAllCount");
	}

	public List<MemberVO> getMemberList(int page, SearchUtil searchInfo) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("page", page);
		paramMap.put("searchInfo", searchInfo);
		return sqlSession.selectList(NAMESPACE + "getMemberList", paramMap);
	}

	public int updateMember(MemberVO vo) {
		return sqlSession.update(NAMESPACE + "updateMember", vo);
	}

	public List<BoardVO> getBoardAllList(int page, SearchUtil searchInfo) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("page", page);
		paramMap.put("searchInfo", searchInfo);
		return sqlSession.selectList(NAMESPACE + "getBoardAllList", paramMap);			
	}
	
	public BoardVO getBoardDetail(int bno) {
		return sqlSession.selectOne(NAMESPACE + "getBoardDetail", bno);
	}

	public int getBoardTotalCount(SearchUtil searchInfo) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("searchInfo", searchInfo);
		return sqlSession.selectOne(NAMESPACE + "getBoardTotalCount", paramMap);
	}

	public int getTradeCompleteCount() {
		return sqlSession.selectOne(NAMESPACE + "getTradeCompleteCount");
	}

	public int getTradeStayCount() {
		return sqlSession.selectOne(NAMESPACE + "getTradeStayCount");
	}

	public int getTradeProcessingCount() {
		return sqlSession.selectOne(NAMESPACE + "getTradeProcessingCount");
	}

	public int deleteMember(int memNo) {
		return sqlSession.update(NAMESPACE + "deleteMember", memNo);
	}

	public MemberVO getMember(int memNo) {
		return sqlSession.selectOne(NAMESPACE + "getMember", memNo);
	}
}
