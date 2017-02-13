package com.wappl.moolmool.board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wappl.moolmool.board.vo.BoardTypeVO;

@Repository
public class BoardTypeDao {
	
	private static final String NAMESPACE = "boardMapper.";
	
	@Autowired
	private SqlSession sqlSession;

	public BoardTypeVO getBoardTypeDetail(String btCode) {
		return sqlSession.selectOne(NAMESPACE + "getBoardTypeDetail", btCode);
	}

	public List<BoardTypeVO> getBoardTypeList() {
		return sqlSession.selectList(NAMESPACE + "getBoardTypeList");
	}
	
	public List<BoardTypeVO> getBoardMainTypeList() {
		return sqlSession.selectList(NAMESPACE + "getBoardMainTypeList");
	}

	public int insertBoardType(BoardTypeVO vo) {
		return sqlSession.insert(NAMESPACE + "insertBoardType", vo);
	}

	public int updateBoardType(BoardTypeVO vo) {
		return sqlSession.update(NAMESPACE + "updateBoardType", vo);
	}

	public int deleteBoardType(String btCode) {
		return sqlSession.delete(NAMESPACE + "deleteBoardType", btCode);
	}

}
