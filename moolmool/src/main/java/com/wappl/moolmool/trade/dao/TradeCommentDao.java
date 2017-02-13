package com.wappl.moolmool.trade.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wappl.moolmool.trade.vo.TradeCommentVO;

@Repository
public class TradeCommentDao {
	
	private static final String NAMESPACE = "tradeCommentMapper.";
	
	@Autowired
	private SqlSession sqlSession;
	
	public List<TradeCommentVO> getTradeCommentList(int tno){
		return sqlSession.selectList(NAMESPACE + "getTradeCommentList", tno);
	}
	
	public TradeCommentVO getTradeCommentDetail(int tcno){
		return sqlSession.selectOne(NAMESPACE + "getTradeCommentDetail", tcno);
	}
	
	public int insertTradeComment(TradeCommentVO vo){
		return sqlSession.insert(NAMESPACE + "insertTradeComment", vo);
	}
	
	public int updateTradeComment(TradeCommentVO vo){
		return sqlSession.update(NAMESPACE + "updateTradeComment", vo);
	}
	
	public int deleteTradeComment(int tcno){
		System.out.println(tcno);
		return sqlSession.delete(NAMESPACE + "deleteTradeComment", tcno);
	}

}
