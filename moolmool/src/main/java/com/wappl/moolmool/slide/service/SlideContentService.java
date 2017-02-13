package com.wappl.moolmool.slide.service;

import java.util.List;

import com.wappl.moolmool.slide.vo.SlideContentVO;

public interface SlideContentService {

	public int insertSlideContent(SlideContentVO vo);

	public int updateSlideContent(SlideContentVO vo);

	public SlideContentVO getSlideContentDetail(int sno);

	public List<SlideContentVO> getSlideContentList();

}
