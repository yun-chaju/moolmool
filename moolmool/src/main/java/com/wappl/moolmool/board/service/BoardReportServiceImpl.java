package com.wappl.moolmool.board.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wappl.moolmool.board.dao.BoardReportDao;
import com.wappl.moolmool.board.vo.BoardReportVO;

@Service
public class BoardReportServiceImpl implements BoardReportService{

	@Autowired
	private BoardReportDao dao;

	@Override
	public int getExistsBoardReport(BoardReportVO vo) {
		return dao.getExistsBoardReport(vo);
	}
	
	@Override
	public int insertBoardReport(BoardReportVO vo) {
		return dao.insertBoardReport(vo);
	}

}
