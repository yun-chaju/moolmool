package com.wappl.moolmool.qna.service;

import com.wappl.moolmool.qna.vo.AnswerVO;

public interface AnswerService {
	
	AnswerVO getAnswer(int qno) throws Exception; 
	
	int insertAnswer(AnswerVO vo) throws Exception;
	
	int updateAnswer(AnswerVO vo) throws Exception;

	int updateIsEvaluated(int ano)throws Exception;
	
}
