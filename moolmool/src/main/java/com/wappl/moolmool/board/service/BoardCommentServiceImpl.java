package com.wappl.moolmool.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wappl.moolmool.board.dao.BoardCommentDao;
import com.wappl.moolmool.board.vo.BoardCommentVO;

@Service
public class BoardCommentServiceImpl implements BoardCommentService{
	
	@Autowired
	private BoardCommentDao dao;

	@Override
	public int insertBoardComment(BoardCommentVO vo) {
		return dao.insertBoardComment(vo);
	}

	@Override
	public BoardCommentVO getBoardCommentDetail(int cno) {
		return dao.getBoardCommentDetail(cno);
	}

	@Override
	public List<BoardCommentVO> getBoardCommentList(int bno, int cpage) {
		return dao.getBoardCommentList(bno, cpage);
	}

	@Override
	public int getBoardCommentCount(int bno) {
		return dao.getBoardCommentCount(bno);
	}

	@Override
	public int updateBoardComment(BoardCommentVO vo) {
		return dao.updateBoardComment(vo);
	}

	@Override
	public int deleteBoardComment(int cno) {
		return dao.deleteBoardComment(cno);
	}
}
