package com.wappl.moolmool.board.service;

import java.util.List;
import java.util.Map;

import com.wappl.moolmool.board.vo.BoardTypeVO;
import com.wappl.moolmool.board.vo.BoardVO;
import com.wappl.moolmool.common.util.SearchUtil;

public interface BoardService {

	public int insertBoard(BoardVO vo);

	public BoardVO getBoardDetail(int bno);
	
	public Map<String, Object> getPrevAndNextTitle(int bno);

	public List<BoardVO> getBoardList(String btCode, int page, SearchUtil searchInfo);

	public List<BoardVO> getBoardMainList(List<BoardTypeVO> list);
	
	public int getBoardTotalCount(String btCode, SearchUtil searchInfo);

	public int deleteBoard(int bno, int memNo);

	public int updateBoard(BoardVO vo);

	public int updateHit(int bno);
	
}
