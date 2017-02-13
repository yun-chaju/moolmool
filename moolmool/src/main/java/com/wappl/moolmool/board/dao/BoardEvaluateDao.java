package com.wappl.moolmool.board.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wappl.moolmool.board.vo.BoardEvaluateVO;

@Repository
public class BoardEvaluateDao {
	
	@Autowired
	private SqlSession sqlSession;

	public int getExistsBoardEvaluate(BoardEvaluateVO vo) {
		return sqlSession.selectOne("getExistsBoardEvaluate", vo);
	}

	public int insertBoardEvaluate(BoardEvaluateVO vo) {
		return sqlSession.insert("insertBoardEvaluate", vo);
	}

}
