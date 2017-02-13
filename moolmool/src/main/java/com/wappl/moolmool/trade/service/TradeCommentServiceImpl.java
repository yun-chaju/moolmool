package com.wappl.moolmool.trade.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wappl.moolmool.trade.dao.TradeCommentDao;
import com.wappl.moolmool.trade.vo.TradeCommentVO;

@Service
public class TradeCommentServiceImpl implements TradeCommentService{
	
	@Autowired
	private TradeCommentDao dao;

	@Override
	public List<TradeCommentVO> getTradeCommentList(int tno) {
		return dao.getTradeCommentList(tno);
	}

	@Override
	public TradeCommentVO getTradeCommentDetail(int tcno) {
		return dao.getTradeCommentDetail(tcno);
	}

	@Override
	public int insertTradeComment(TradeCommentVO vo) {
		return dao.insertTradeComment(vo);
	}

	@Override
	public int updateTradeComment(TradeCommentVO vo) {
		return dao.updateTradeComment(vo);
	}

	@Override
	public int deleteTradeComment(int tcno) {
		return dao.deleteTradeComment(tcno);
	}

}
