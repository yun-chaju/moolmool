package com.wappl.moolmool.slide.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wappl.moolmool.slide.dao.SlideContentDao;
import com.wappl.moolmool.slide.vo.SlideContentVO;

@Service
public class SlideContentServiceImpl implements SlideContentService {
	
	@Autowired
	private SlideContentDao dao;

	@Override
	public int insertSlideContent(SlideContentVO vo) {
		return dao.insertSlideContent(vo);
	}

	@Override
	public int updateSlideContent(SlideContentVO vo) {
		return dao.updateSlideContent(vo);
	}

	@Override
	public SlideContentVO getSlideContentDetail(int sno) {
		return dao.getSlideContentDetail(sno);
	}

	@Override
	public List<SlideContentVO> getSlideContentList() {
		return dao.getSlideContentList();
	}

}
