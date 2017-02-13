package com.wappl.moolmool.board.service;

import java.util.List;

import com.wappl.moolmool.board.vo.BoardTypeVO;

public interface BoardTypeService {

	public BoardTypeVO getBoardTypeDetail(String btCode);

	public List<BoardTypeVO> getBoardTypeList();

	public int insertBoardType(BoardTypeVO vo);

	public int updateBoardType(BoardTypeVO vo);

	public int deleteBoardType(String btCode);
	
}
