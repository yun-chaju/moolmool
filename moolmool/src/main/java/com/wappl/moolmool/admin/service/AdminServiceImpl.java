package com.wappl.moolmool.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wappl.moolmool.admin.dao.AdminDao;
import com.wappl.moolmool.board.dao.BoardDao;
import com.wappl.moolmool.board.vo.BoardVO;
import com.wappl.moolmool.common.util.SearchUtil;
import com.wappl.moolmool.member.vo.MemberVO;

@Service
public class AdminServiceImpl implements AdminService{

	@Autowired
	private AdminDao adminDao;
	@Autowired
	private BoardDao boardDao;
	
	@Override
	public int getMemberCount() throws Exception {
		
		return adminDao.getMemberCount();
	}
	
	@Override
	public int getMemberAllCount() throws Exception {
		return adminDao.getMemberAllCount();
	}

	@Override
	public List<MemberVO> getMemberList(int page, SearchUtil searchInfo) throws Exception {
		return adminDao.getMemberList(page, searchInfo);
	}

	@Override
	public int updateMember(MemberVO vo) throws Exception {
		return adminDao.updateMember(vo);
	}

	@Override
	public List<BoardVO> getBoardAllList(int page, SearchUtil searchInfo) throws Exception {
		return adminDao.getBoardAllList(page, searchInfo);
	}

	@Override
	public int getBoardTotalCount(SearchUtil searchInfo) throws Exception {
		return adminDao.getBoardTotalCount(searchInfo);
	}

	@Override
	public int getTradeCompleteCount() throws Exception {
		return adminDao.getTradeCompleteCount();
	}

	@Override
	public int getTradeStayCount() throws Exception {
		return adminDao.getTradeStayCount();
	}

	@Override
	public int getTradeProcessingCount() throws Exception {
		return adminDao.getTradeProcessingCount();
	}

	@Override
	public int deleteMember(int memNo) throws Exception {
		return adminDao.deleteMember(memNo);
	}

	@Override
	public int deleteBoard(int bno) {
		return boardDao.deleteBoard(bno);
	}

	@Override
	public BoardVO getBoardDetail(int bno) throws Exception {
		return adminDao.getBoardDetail(bno);
	}

	@Override
	public MemberVO getMember(int memNo) throws Exception {
		return adminDao.getMember(memNo);
	}
}
