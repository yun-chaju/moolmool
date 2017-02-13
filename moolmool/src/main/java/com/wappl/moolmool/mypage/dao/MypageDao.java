package com.wappl.moolmool.mypage.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wappl.moolmool.board.vo.BoardVO;
import com.wappl.moolmool.common.util.SearchUtil;
import com.wappl.moolmool.point.vo.PointVO;

@Repository
public class MypageDao {
	
	private static final String NAMESPACE = "mypageMapper.";
	
	@Autowired
	private SqlSession sqlSession;

	public int getBoardTotalCount(SearchUtil searchInfo, int memNo) {
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("searchInfo", searchInfo);
		m.put("memNo", memNo);
		return sqlSession.selectOne(NAMESPACE + "getBoardUserTotalCount", m);
	}

	public List<BoardVO> getBoardAllList(int page, SearchUtil searchInfo, int memNo) {
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("searchInfo", searchInfo);
		m.put("page", page);
		m.put("memNo", memNo);
		return sqlSession.selectList(NAMESPACE + "getBoardUserList", m);
	}

	public List<BoardVO> getBoardList(String btCode, int page, SearchUtil searchInfo, int memNo) {
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("searchInfo", searchInfo);
		m.put("page", page);
		m.put("memNo", memNo);
		m.put("btCode", btCode);
		return sqlSession.selectList(NAMESPACE + "getBoardList", m);
	}

	public int getBoardTotalCount(String btCode, SearchUtil searchInfo, int memNo) {
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("searchInfo", searchInfo);
		m.put("memNo", memNo);
		m.put("btCode", btCode);
		return sqlSession.selectOne(NAMESPACE + "getBoardTotalCount", m);
	}

	public List<PointVO> getPointLog(int memNo) {
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("memNo", memNo);
		return sqlSession.selectList(NAMESPACE + "getPointLog", m);
	}

}
