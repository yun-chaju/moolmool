package com.wappl.moolmool.notice.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wappl.moolmool.notice.dao.NoticeDao;
import com.wappl.moolmool.notice.vo.NoticeVO;

@Service
public class NoticeServiceImpl implements NoticeService {
	
	@Autowired
	private NoticeDao noticeDao;
	
	@Override
	public List<NoticeVO> getNoticeList(int page) throws Exception {
		return noticeDao.getNoticeList(page);
	}

	@Override
	public int getNoticeTotalCount() throws Exception {
		return noticeDao.getNoticeTotalCount();
	}

	@Override
	public NoticeVO getNoticeOne(int nNo) throws Exception {
		return noticeDao.getNoticeOne(nNo);
	}

	@Override
	public int insertNotice(NoticeVO nVo) throws Exception {
		return noticeDao.insertNotice(nVo);
	}

	@Override
	public int updateNotice(NoticeVO nVo) throws Exception {
		return noticeDao.updateNotice(nVo);
	}

	@Override
	public int deleteNotice(int nNo) throws Exception {
		return noticeDao.deleteNotice(nNo);
	}
	
}
