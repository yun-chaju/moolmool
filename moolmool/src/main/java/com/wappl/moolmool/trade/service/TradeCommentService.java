package com.wappl.moolmool.trade.service;

import java.util.List;

import com.wappl.moolmool.trade.vo.TradeCommentVO;

public interface TradeCommentService {
	
	public List<TradeCommentVO> getTradeCommentList(int tno);
	
	public TradeCommentVO getTradeCommentDetail(int tcno);
	
	public int insertTradeComment(TradeCommentVO vo);
	
	public int updateTradeComment(TradeCommentVO vo);
	
	public int deleteTradeComment(int tcno);

}
