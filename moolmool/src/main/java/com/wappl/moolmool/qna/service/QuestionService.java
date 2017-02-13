package com.wappl.moolmool.qna.service;

import java.util.List;

import com.wappl.moolmool.common.util.SearchUtil;
import com.wappl.moolmool.qna.vo.QuestionVO;

public interface QuestionService {
	
	List<QuestionVO> getQuestionList(SearchUtil searchInfo, int page) throws Exception;

	int getQuestionTotalCount(SearchUtil searchInfo) throws Exception;
	
	QuestionVO getQuestionDetail(int qno) throws Exception;
	
	int insertQuestion(QuestionVO vo) throws Exception;
	
	int updateQuestion(QuestionVO vo) throws Exception;
	
	int updateQuestion(int qno) throws Exception;
	
	int deleteQuestion(int qno) throws Exception;

}
