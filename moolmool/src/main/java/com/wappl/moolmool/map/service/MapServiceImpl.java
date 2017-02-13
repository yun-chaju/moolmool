package com.wappl.moolmool.map.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wappl.moolmool.map.dao.MapDao;
import com.wappl.moolmool.map.vo.MapVO;
import com.wappl.moolmool.trade.vo.TradeVO;

@Service
public class MapServiceImpl implements MapService{

	@Autowired
	private MapDao dao;
	
	@Override
	public List<TradeVO> getMapList(MapVO vo) {
		return dao.getMapList(vo);
	}

	@Override
	public int getMapListCount(MapVO vo) {
		return dao.getMapListCount(vo);
	}


}
