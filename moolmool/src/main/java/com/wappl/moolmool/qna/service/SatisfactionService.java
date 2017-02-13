package com.wappl.moolmool.qna.service;

import com.wappl.moolmool.qna.vo.AnswerVO;
import com.wappl.moolmool.qna.vo.SatisfactionVO;

public interface SatisfactionService {
	
	SatisfactionVO getSatisfaction(AnswerVO vo) throws Exception;
	
	int insertSatisfaction(SatisfactionVO vo) throws Exception;
	
}
