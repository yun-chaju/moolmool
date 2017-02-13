package com.wappl.moolmool.trade.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wappl.moolmool.trade.vo.TradeCategoryVO;

@Repository
public class TradeCategoryDao {
	
	private static final String NAMESAPCE = "tradeCategoryMapper."; 
	
	@Autowired
	SqlSession sqlSession;
	
	public List<TradeCategoryVO> getTradeCategoryList(){
		return sqlSession.selectList(NAMESAPCE + "getTradeCategoryList");
	}
	
	public List<TradeCategoryVO> getTradeSubCategoryList(String category){
		return sqlSession.selectList(NAMESAPCE + "getTradeSubCategoryList", category);
	}
	
	public int insertTradeCategory(TradeCategoryVO vo){
		return sqlSession.insert(NAMESAPCE + "insertTradeCategory", vo);
	}
	
	public int updateTradeCategory(TradeCategoryVO vo){
		return sqlSession.update(NAMESAPCE + "updateTradeCategory", vo);
	}
	
	public int deleteTradeCategory(int tdcNo){
		return sqlSession.delete(NAMESAPCE + "deleteTradeCategory", tdcNo);
	}

}
