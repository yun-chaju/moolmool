package com.wappl.moolmool.notice.service;

import java.util.List;

import com.wappl.moolmool.notice.vo.NoticeVO;

public interface NoticeService {
	
	List<NoticeVO> getNoticeList(int page) throws Exception;
	
	int getNoticeTotalCount() throws Exception;
	
	public NoticeVO getNoticeOne(int nNo) throws Exception;
	
	int insertNotice(NoticeVO nVo) throws Exception;
	
	int updateNotice(NoticeVO nVo) throws Exception;
	
	int deleteNotice(int nNo) throws Exception;

}
