package com.wappl.moolmool.admin.service;

import java.util.List;

import com.wappl.moolmool.board.vo.BoardVO;
import com.wappl.moolmool.common.util.SearchUtil;
import com.wappl.moolmool.member.vo.MemberVO;

public interface AdminService {
	int getMemberCount() throws Exception;
	
	int getMemberAllCount() throws Exception;
	
	List<MemberVO> getMemberList(int page, SearchUtil searchInfo) throws Exception;

	int updateMember(MemberVO vo) throws Exception;

	List<BoardVO> getBoardAllList(int page, SearchUtil searchInfo) throws Exception;

	int getBoardTotalCount(SearchUtil searchInfo) throws Exception;
	
	int getTradeCompleteCount() throws Exception;
	
	int getTradeStayCount() throws Exception;
	
	int getTradeProcessingCount() throws Exception;

	int deleteMember(int memNo) throws Exception;

	int deleteBoard(int bno) throws Exception;

	BoardVO getBoardDetail(int bno) throws Exception;

	MemberVO getMember(int memNo) throws Exception;
}
