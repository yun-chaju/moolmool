package com.wappl.moolmool.mypage.service;

import java.util.List;

import com.wappl.moolmool.board.vo.BoardVO;
import com.wappl.moolmool.common.util.SearchUtil;
import com.wappl.moolmool.point.vo.PointVO;

public interface MypageService {

	int getBoardTotalCount(SearchUtil searchInfo, int memNo);

	List<BoardVO> getBoardAllList(int page, SearchUtil searchInfo, int memNo);

	int getBoardTotalCount(String btCode, SearchUtil searchInfo, int memNo);

	List<BoardVO> getBoardList(String btCode, int page, SearchUtil searchInfo, int memNo);

	List<PointVO> getPointLog(int memNo);

}
