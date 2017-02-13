package com.wappl.moolmool.board.service;

import com.wappl.moolmool.board.vo.BoardReportVO;

public interface BoardReportService {

	public int getExistsBoardReport(BoardReportVO vo);

	public int insertBoardReport(BoardReportVO vo);

}
