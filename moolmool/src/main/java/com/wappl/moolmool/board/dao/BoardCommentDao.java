package com.wappl.moolmool.board.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wappl.moolmool.board.vo.BoardCommentVO;

@Repository
public class BoardCommentDao {
	
	private static final String NAMESPACE = "boardMapper.";
	
	@Autowired
	private SqlSession sqlSession;

	public int insertBoardComment(BoardCommentVO vo) {
		return sqlSession.insert(NAMESPACE + "insertBoardComment", vo);
	}

	public BoardCommentVO getBoardCommentDetail(int cno) {
		return sqlSession.selectOne(NAMESPACE + "getBoardCommentDetail", cno);
	}

	public List<BoardCommentVO> getBoardCommentList(int bno, int cpage) {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("bno", bno);
		paramMap.put("cpage", cpage);
		return sqlSession.selectList(NAMESPACE + "getBoardCommentList", paramMap);
	}

	public int updateBoardComment(BoardCommentVO vo) {
		return sqlSession.update(NAMESPACE + "updateBoardComment", vo);
	}

	public int deleteBoardComment(int cno) {
		return sqlSession.delete(NAMESPACE + "deleteBoardComment", cno);
	}
	
	public int getBoardCommentCount(int bno) {
		return sqlSession.selectOne(NAMESPACE + "getBoardCommentCount", bno);
	}

}
