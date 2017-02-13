package com.wappl.moolmool.qna.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wappl.moolmool.qna.dao.SatisfactionDao;
import com.wappl.moolmool.qna.vo.AnswerVO;
import com.wappl.moolmool.qna.vo.SatisfactionVO;

@Service
public class SatisfactionServiceImpl implements SatisfactionService {
	
	@Autowired
	private SatisfactionDao satisfactionDao;

	@Override
	public SatisfactionVO getSatisfaction(AnswerVO vo) throws Exception {
		return satisfactionDao.getSatisfaction(vo);
	}

	@Override
	public int insertSatisfaction(SatisfactionVO vo) throws Exception {
		return satisfactionDao.insertSatisfaction(vo);
	}
}
