package com.wappl.moolmool.qna.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wappl.moolmool.common.util.SearchUtil;
import com.wappl.moolmool.qna.dao.QuestionDao;
import com.wappl.moolmool.qna.vo.QuestionVO;

@Service
public class QuestionServiceImpl implements QuestionService {

	@Autowired
	private QuestionDao questionDao;

	@Override
	public List<QuestionVO> getQuestionList(SearchUtil searchInfo, int page) throws Exception {
		return questionDao.getQuestionList(searchInfo, page);
	}
	
	@Override
	public int getQuestionTotalCount(SearchUtil searchInfo) throws Exception {
		return questionDao.getQuestionTotalCount(searchInfo);
	}

	@Override
	public QuestionVO getQuestionDetail(int qno) throws Exception {
		return questionDao.getQuestionDetail(qno);
	}

	@Override
	public int insertQuestion(QuestionVO vo) throws Exception {
		return questionDao.insertQuestion(vo);
	}

	@Override
	public int updateQuestion(QuestionVO vo) throws Exception {
		return questionDao.updateQuestion(vo);
	}
	
	@Override
	public int updateQuestion(int qno) throws Exception {
		return questionDao.updateQuestion(qno);
	}

	@Override
	public int deleteQuestion(int qno) throws Exception {
		return questionDao.deleteQuestion(qno);
	}

	

}
