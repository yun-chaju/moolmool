package com.wappl.moolmool.trade.service;

import java.util.List;

import com.wappl.moolmool.map.vo.MapVO;
import com.wappl.moolmool.trade.vo.TradeVO;

public interface TradeService {
	
	public List<TradeVO> getTradeList(int page, String tradeType);
	
	public List<TradeVO> getMapList(MapVO vo);
	
	public int getTradeAllCount(String tradeType);
	
	public int getMapListCount(MapVO vo);
	
	public TradeVO getTradeDetail(int tno);
	
	public int insertTrade(TradeVO vo);
	
	public int updateTrade(TradeVO vo);
	
	public int deleteTrade(int tno);

}
