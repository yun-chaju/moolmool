package com.wappl.moolmool.trade.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wappl.moolmool.map.vo.MapVO;
import com.wappl.moolmool.trade.dao.TradeDao;
import com.wappl.moolmool.trade.vo.TradeVO;

@Service
public class TradeServiceImpl implements TradeService {
	
	@Autowired
	private TradeDao dao;

	@Override
	public List<TradeVO> getTradeList(int page, String tradeType) {
		return dao.getTradeList(page, tradeType);
	}
	
	@Override
	public int getTradeAllCount(String tradeType) {
		return dao.getTradeAllCount(tradeType);
	}

	@Override
	public TradeVO getTradeDetail(int tno) {
		return dao.getTradeDetail(tno);
	}

	@Override
	public int insertTrade(TradeVO vo) {
		int result = dao.insertTrade(vo);
		return result;
	}

	@Override
	public int updateTrade(TradeVO vo) {
		return dao.updateTrade(vo);
	}

	@Override
	public int deleteTrade(int tno) {
		return dao.deleteTrade(tno);
	}

	@Override
	public List<TradeVO> getMapList(MapVO vo) {
		return dao.getMapList(vo);
	}

	@Override
	public int getMapListCount(MapVO vo) {
		return dao.getMapListCount(vo);
	}
	

}
