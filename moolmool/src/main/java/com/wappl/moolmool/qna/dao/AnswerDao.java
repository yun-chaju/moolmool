package com.wappl.moolmool.qna.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wappl.moolmool.qna.vo.AnswerVO;

@Repository
public class AnswerDao {
	
	private static final String NAMESPACE = "qnaMapper.";
	
	@Autowired
	private SqlSession sqlSession;

	public AnswerVO getAnswer(int qno) {
		return sqlSession.selectOne(NAMESPACE + "getAnswer", qno);
	}

	public int insertAnswer(AnswerVO vo) {
		return sqlSession.insert(NAMESPACE + "insertAnswer", vo);
	}

	public int updateAnswer(AnswerVO vo) {
		return sqlSession.update(NAMESPACE + "updateAnswer", vo);
	}

	public int updateIsEvaluated(int ano) {
		return sqlSession.update(NAMESPACE + "updateIsEvaluated", ano);
	}

}
