package com.wappl.moolmool.mypage.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wappl.moolmool.board.vo.BoardVO;
import com.wappl.moolmool.common.util.SearchUtil;
import com.wappl.moolmool.mypage.dao.MypageDao;
import com.wappl.moolmool.point.vo.PointVO;

@Service
public class MypageServiceImpl implements MypageService{

	@Autowired
	private MypageDao md;

	@Override
	public int getBoardTotalCount(SearchUtil searchInfo, int memNo) {
		return md.getBoardTotalCount(searchInfo, memNo);
	}

	@Override
	public List<BoardVO> getBoardAllList(int page, SearchUtil searchInfo, int memNo) {
		return md.getBoardAllList(page, searchInfo, memNo);
	}

	@Override
	public int getBoardTotalCount(String btCode, SearchUtil searchInfo, int memNo) {
		return md.getBoardTotalCount(btCode, searchInfo, memNo);
	}

	@Override
	public List<BoardVO> getBoardList(String btCode, int page, SearchUtil searchInfo, int memNo) {
		return md.getBoardList(btCode, page, searchInfo, memNo);
	}

	@Override
	public List<PointVO> getPointLog(int memNo) {
		return md.getPointLog(memNo);
	}
}
