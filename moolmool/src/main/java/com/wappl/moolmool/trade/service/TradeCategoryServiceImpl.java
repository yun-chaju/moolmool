package com.wappl.moolmool.trade.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wappl.moolmool.trade.dao.TradeCategoryDao;
import com.wappl.moolmool.trade.vo.TradeCategoryVO;

@Service
public class TradeCategoryServiceImpl implements TradeCategoryService{
	
	@Autowired
	TradeCategoryDao dao;

	@Override
	public List<TradeCategoryVO> getTradeCategoryList() {
		return dao.getTradeCategoryList();
	}

	@Override
	public List<TradeCategoryVO> getTradeSubCategoryList(String category) {
		return dao.getTradeSubCategoryList(category);
	}

	@Override
	public int insertTradeCategory(TradeCategoryVO vo) {
		return dao.insertTradeCategory(vo);
	}

	@Override
	public int updateTradeCategory(TradeCategoryVO vo) {
		return dao.updateTradeCategory(vo);
	}

	@Override
	public int deleteTradeCategory(int tdcNo) {
		return dao.deleteTradeCategory(tdcNo);
	}

}
