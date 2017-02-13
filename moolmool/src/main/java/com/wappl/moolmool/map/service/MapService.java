package com.wappl.moolmool.map.service;

import java.util.List;

import com.wappl.moolmool.map.vo.MapVO;
import com.wappl.moolmool.trade.vo.TradeVO;

public interface MapService {

	public List<TradeVO> getMapList(MapVO vo);
	
	public int getMapListCount(MapVO vo);

}
