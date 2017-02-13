package com.wappl.moolmool.board.service;

import java.util.List;

import com.wappl.moolmool.board.vo.BoardCommentVO;

public interface BoardCommentService {

	public int insertBoardComment(BoardCommentVO vo);

	public BoardCommentVO getBoardCommentDetail(int cno);

	public List<BoardCommentVO> getBoardCommentList(int bno, int cpage);
	
	public int getBoardCommentCount(int bno);

	public int updateBoardComment(BoardCommentVO vo);

	public int deleteBoardComment(int cno);

}
