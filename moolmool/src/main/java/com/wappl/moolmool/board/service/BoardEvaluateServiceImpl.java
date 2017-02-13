package com.wappl.moolmool.board.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wappl.moolmool.board.dao.BoardEvaluateDao;
import com.wappl.moolmool.board.vo.BoardEvaluateVO;

@Service
public class BoardEvaluateServiceImpl implements BoardEvaluateService{
	
	@Autowired
	private BoardEvaluateDao dao;

	@Override
	public int getExistsBoardEvaluate(BoardEvaluateVO vo) {
		return dao.getExistsBoardEvaluate(vo);
	}

	@Override
	public int insertBoardEvaluate(BoardEvaluateVO vo) {
		return dao.insertBoardEvaluate(vo);
	}

}
