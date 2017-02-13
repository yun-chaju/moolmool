package com.wappl.moolmool.qna.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wappl.moolmool.qna.dao.AnswerDao;
import com.wappl.moolmool.qna.vo.AnswerVO;

@Service
public class AnswerServiceImpl implements AnswerService {

	@Autowired
	private AnswerDao answerDao;

	@Override
	public AnswerVO getAnswer(int qno) throws Exception {
		return answerDao.getAnswer(qno);
	}

	@Override
	public int insertAnswer(AnswerVO vo) throws Exception {
		return answerDao.insertAnswer(vo);
	}

	@Override
	public int updateAnswer(AnswerVO vo) throws Exception {
		return answerDao.updateAnswer(vo);
	}

	@Override
	public int updateIsEvaluated(int ano) throws Exception {
		return answerDao.updateIsEvaluated(ano);
	}
}
