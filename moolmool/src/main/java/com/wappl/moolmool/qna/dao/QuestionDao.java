package com.wappl.moolmool.qna.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wappl.moolmool.common.util.SearchUtil;
import com.wappl.moolmool.qna.vo.QuestionVO;

@Repository
public class QuestionDao {
	
	private static final String NAMESPACE = "qnaMapper.";
	
	@Autowired
	private SqlSession sqlSession;

	public List<QuestionVO> getQuestionList(SearchUtil searchInfo, int page) {	
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("searchInfo", searchInfo);
		paramMap.put("page", page);
		return sqlSession.selectList(NAMESPACE + "getQuestionList", paramMap);
	}
	
	public int getQuestionTotalCount(SearchUtil searchInfo) {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("searchInfo", searchInfo);
		return sqlSession.selectOne(NAMESPACE + "getQuestionTotalCount", paramMap);
	}
	
	public QuestionVO getQuestionDetail(int qno) {
		return sqlSession.selectOne(NAMESPACE + "getQuestionDetail", qno);
	}

	public int insertQuestion(QuestionVO vo) {	
		return sqlSession.insert(NAMESPACE + "insertQuestion", vo);
	}

	public int updateQuestion(QuestionVO vo) {
		return sqlSession.update(NAMESPACE + "updateQuestion", vo);
	}
	
	public int updateQuestion(int qno) {
		return sqlSession.update(NAMESPACE + "updateReply", qno);
	}


	public int deleteQuestion(int qno) {
		return sqlSession.update(NAMESPACE + "deleteQuestion", qno);
	}

	
}
