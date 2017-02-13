package com.wappl.moolmool.board.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wappl.moolmool.board.dao.BoardDao;
import com.wappl.moolmool.board.vo.BoardTypeVO;
import com.wappl.moolmool.board.vo.BoardVO;
import com.wappl.moolmool.common.util.SearchUtil;
import com.wappl.moolmool.point.dao.PointDao;
import com.wappl.moolmool.point.vo.PointVO;

@Service
public class BoardServiceImpl implements BoardService{
	
	@Autowired private BoardDao bDao;
	@Autowired private PointDao pDao;

	@Override
	public int insertBoard(BoardVO vo) {
		PointVO pVo = new PointVO()
			.setMemNo(vo.getWriterNo())
			.setLog("게시물 작성")
			.setPointChange(2)
			.setAddEli('a');
		pDao.insertPoint(pVo);
		pDao.updateMemberPoint(pVo);
		return bDao.insertBoard(vo);
	}

	@Override
	public BoardVO getBoardDetail(int bno) {
		return bDao.getBoardDetail(bno);
	}
	
	@Override
	public Map<String, Object> getPrevAndNextTitle(int bno) {
		return bDao.getPrevAndNextTitle(bno);
	}

	@Override
	public List<BoardVO> getBoardList(String btCode, int page, SearchUtil searchInfo) {
		return bDao.getBoardList(btCode, page, searchInfo);
	}

	@Override
	public List<BoardVO> getBoardMainList(List<BoardTypeVO> list) {
		return bDao.getBoardMainList(list);
	}
	
	@Override
	public int getBoardTotalCount(String btCode, SearchUtil searchInfo) {
		return bDao.getBoardTotalCount(btCode, searchInfo);
	}

	@Override
	public int deleteBoard(int bno, int memNo) {
		PointVO pVo = new PointVO()
				.setMemNo(memNo)
				.setLog("게시물 삭제")
				.setPointChange(2)
				.setAddEli('e');
			pDao.insertPoint(pVo);
			pDao.updateMemberPoint(pVo);
		return bDao.deleteBoard(bno);
	}

	@Override
	public int updateBoard(BoardVO vo) {
		return bDao.updateBoard(vo);
	}

	@Override
	public int updateHit(int bno) {
		return bDao.updateHit(bno);
	}
	
}
