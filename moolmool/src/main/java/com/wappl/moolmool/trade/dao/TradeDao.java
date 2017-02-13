package com.wappl.moolmool.trade.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wappl.moolmool.map.vo.MapVO;
import com.wappl.moolmool.trade.vo.TradeVO;

@Repository
public class TradeDao {
	
	private static final String NAMESPACE = "tradeMapper.";
	
	@Autowired
	SqlSession sqlSession;
	
	public int getTradeAllCount(String tradeType) {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("tradeType", tradeType);
		return sqlSession.selectOne(NAMESPACE+"getTradeAllCount", paramMap);
	}
		
	public List<TradeVO> getTradeList(int page, String tradeType){
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("tradeType", tradeType);
		paramMap.put("page", page);
		return sqlSession.selectList(NAMESPACE + "getTradeList", paramMap);
	}
	
	public TradeVO getTradeDetail(int tno){
		return sqlSession.selectOne(NAMESPACE + "getTradeDetail", tno);
	}
	
	public List<String> getTradeDetailFile(int tno) {
		return sqlSession.selectList(NAMESPACE + "getTradeDetailFile", tno);
	}
	
	public int insertTrade(TradeVO vo){
		return sqlSession.insert(NAMESPACE + "insertTrade", vo);
	}
	
	public int updateTrade(TradeVO vo){
		return sqlSession.update(NAMESPACE + "updateTrade", vo);
	}
	
	public int deleteTrade(int tno){
		return sqlSession.delete(NAMESPACE + "deleteTrade", tno);
	}
	
	public List<TradeVO> getMapList(MapVO vo){
		return sqlSession.selectList(NAMESPACE + "getMapList", vo);
	}
	
	public int getMapListCount(MapVO vo) {
		return sqlSession.selectOne(NAMESPACE+"getMapListCount",vo);
	}
	
	
	
	
}
