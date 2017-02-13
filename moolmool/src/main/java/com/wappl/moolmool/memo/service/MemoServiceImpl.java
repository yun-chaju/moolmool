package com.wappl.moolmool.memo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wappl.moolmool.memo.dao.MemoDao;
import com.wappl.moolmool.memo.vo.MemoVO;

@Service
public class MemoServiceImpl implements MemoService{
	
	@Autowired
	private MemoDao dao;

	@Override
	public MemoVO getMemoDetail(MemoVO vo) {
		return dao.getMemoDetail(vo);
	}

	@Override
	public int insertMemo(MemoVO vo) {
		return dao.insertMemo(vo);
	}

	@Override
	public int updateMemo(MemoVO vo) {
		return dao.updateMemo(vo);
	}

	@Override
	public int deleteMemo(MemoVO vo) {
		return dao.deleteMemo(vo);
	}

}
