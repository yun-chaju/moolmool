package com.wappl.moolmool.board.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wappl.moolmool.board.vo.BoardTypeVO;
import com.wappl.moolmool.board.vo.BoardVO;
import com.wappl.moolmool.common.util.SearchUtil;

@Repository
public class BoardDao {
	
	private static final String NAMESPACE = "boardMapper.";
	
	@Autowired
	private SqlSession sqlSession;

	public int insertBoard(BoardVO vo) {
		return sqlSession.insert(NAMESPACE + "insertBoard", vo);
	}

	public BoardVO getBoardDetail(int bno) {
		return sqlSession.selectOne(NAMESPACE + "getBoardDetail", bno);
	}
	
	public Map<String, Object> getPrevAndNextTitle(int bno) {
		return sqlSession.selectOne(NAMESPACE + "getPrevAndNextTitle", bno);
	}

	public List<BoardVO> getBoardList(String btCode, int page, SearchUtil searchInfo) {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("btCode", btCode);
		paramMap.put("page", page);
		paramMap.put("searchInfo", searchInfo);
		return sqlSession.selectList(NAMESPACE + "getBoardList", paramMap);
	}
	
	public List<BoardVO> getBoardMainList(List<BoardTypeVO> list) {
		return sqlSession.selectList(NAMESPACE + "getBoardMainList", list);
	}
	
	public int getBoardTotalCount(String btCode, SearchUtil searchInfo) {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("btCode", btCode);
		paramMap.put("searchInfo", searchInfo);
		return sqlSession.selectOne(NAMESPACE + "getBoardTotalCount", paramMap);
	}

	public int deleteBoard(int bno) {
		return sqlSession.update(NAMESPACE + "deleteBoard", bno);
	}

	public int updateBoard(BoardVO vo) {
		return sqlSession.update(NAMESPACE + "updateBoard", vo);
	}

	public int updateHit(int bno) {
		return sqlSession.update(NAMESPACE + "updateHit", bno);
	}
	
}
