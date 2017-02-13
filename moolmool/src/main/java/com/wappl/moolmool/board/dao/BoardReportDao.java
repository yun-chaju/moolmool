package com.wappl.moolmool.board.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wappl.moolmool.board.vo.BoardReportVO;

@Repository
public class BoardReportDao {
	
	@Autowired
	private SqlSession sqlSession;

	public int getExistsBoardReport(BoardReportVO vo) {
		return sqlSession.selectOne("getExistsBoardReport", vo);
	}

	public int insertBoardReport(BoardReportVO vo) {
		return sqlSession.insert("insertBoardReport", vo);
	}

}
