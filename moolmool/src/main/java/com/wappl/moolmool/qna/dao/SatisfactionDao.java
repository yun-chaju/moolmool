package com.wappl.moolmool.qna.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wappl.moolmool.qna.vo.AnswerVO;
import com.wappl.moolmool.qna.vo.SatisfactionVO;

@Repository
public class SatisfactionDao {
	
	private static final String NAMESPACE = "qnaMapper.";
	
	@Autowired
	private SqlSession sqlSession;

	public SatisfactionVO getSatisfaction(AnswerVO vo) {
		return sqlSession.selectOne(NAMESPACE + "getSatisfaction", vo);
	}

	public int insertSatisfaction(SatisfactionVO vo) {
		return sqlSession.insert(NAMESPACE + "insertSatisfaction", vo);
	}
}
