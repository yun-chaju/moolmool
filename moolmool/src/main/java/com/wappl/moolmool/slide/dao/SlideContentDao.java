package com.wappl.moolmool.slide.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wappl.moolmool.slide.vo.SlideContentVO;

@Repository
public class SlideContentDao {
	
	@Autowired
	private SqlSession sqlSession;

	public int insertSlideContent(SlideContentVO vo) {
		return sqlSession.insert("insertSlideContent", vo);
	}

	public int updateSlideContent(SlideContentVO vo) {
		return sqlSession.update("updateSlideContent", vo);
	}

	public SlideContentVO getSlideContentDetail(int sno) {
		return sqlSession.selectOne("getSlideContentDetail", sno);
	}

	public List<SlideContentVO> getSlideContentList() {
		return sqlSession.selectList("getSlideContentList");
	}


}
