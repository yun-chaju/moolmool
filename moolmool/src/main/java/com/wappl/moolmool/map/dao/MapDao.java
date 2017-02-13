package com.wappl.moolmool.map.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wappl.moolmool.map.vo.MapVO;
import com.wappl.moolmool.trade.vo.TradeVO;

@Repository
public class MapDao {
	
	private static final String NAMESPACE = "mapMapper.";
	
	@Autowired
	SqlSession sqlSession;

	public List<TradeVO> getMapList(MapVO vo){
		return sqlSession.selectList(NAMESPACE + "getMapList", vo);
	}
	
	public int getMapListCount(MapVO vo) {
		return sqlSession.selectOne(NAMESPACE + "getMapListCount", vo);
	}
	
}
