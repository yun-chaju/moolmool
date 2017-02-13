package com.wappl.moolmool.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wappl.moolmool.board.dao.BoardTypeDao;
import com.wappl.moolmool.board.vo.BoardTypeVO;

@Service
public class BoardTypeServiceImpl implements BoardTypeService{
	
	@Autowired
	private BoardTypeDao dao;

	@Override
	public BoardTypeVO getBoardTypeDetail(String btCode) {
		return dao.getBoardTypeDetail(btCode);
	}

	@Override
	public List<BoardTypeVO> getBoardTypeList() {
		return dao.getBoardTypeList();
	}

	@Override
	public int insertBoardType(BoardTypeVO vo) {
		return dao.insertBoardType(vo);
	}

	@Override
	public int updateBoardType(BoardTypeVO vo) {
		return dao.updateBoardType(vo);
	}

	@Override
	public int deleteBoardType(String btCode) {
		return dao.deleteBoardType(btCode);
	}

}
