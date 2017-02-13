package com.wappl.moolmool.trade.service;

import java.util.List;
import com.wappl.moolmool.trade.vo.TradeCategoryVO;

public interface TradeCategoryService {
	
	public List<TradeCategoryVO> getTradeCategoryList();

	public List<TradeCategoryVO> getTradeSubCategoryList(String category);
	
	public int insertTradeCategory(TradeCategoryVO vo);
	
	public int updateTradeCategory(TradeCategoryVO vo);
	
	public int deleteTradeCategory(int tdcNo);

}
