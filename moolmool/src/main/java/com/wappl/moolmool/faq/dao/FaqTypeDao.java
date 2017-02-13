package com.wappl.moolmool.faq.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wappl.moolmool.faq.vo.FaqTypeVO;

@Repository
public class FaqTypeDao {

	private static final String NAMESPACE = "faqtypeMapper.";
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<FaqTypeVO> getFaqTypeList() {
		return sqlSession.selectList(NAMESPACE + "getFaqTypeList");
	}

	public FaqTypeVO getFaqTypeDetail(String vo) {	
		return sqlSession.selectOne(NAMESPACE + "getFaqTypeOne", vo);
	}

	public int insertFaqType(FaqTypeVO vo) {		
		return sqlSession.insert(NAMESPACE + "insertFaqType", vo);
	}

	public int updateFaqType(FaqTypeVO vo) {
		return sqlSession.update(NAMESPACE + "updateFaqType", vo);
	}

	public int deleteFaqType(FaqTypeVO vo) {
		return sqlSession.delete(NAMESPACE + "deleteFaqType", vo);
	}

}
