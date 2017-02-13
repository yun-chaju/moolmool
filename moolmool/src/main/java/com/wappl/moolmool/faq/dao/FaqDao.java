package com.wappl.moolmool.faq.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wappl.moolmool.faq.vo.FaqTypeVO;
import com.wappl.moolmool.faq.vo.FaqVO;

@Repository
public class FaqDao {

	private static final String NAMESPACE = "faqMapper.";
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<FaqVO> getFaqList(String fname) {
		return sqlSession.selectList(NAMESPACE + "getFaqList", fname);
	}

	public FaqVO getFaqDetail(int vo) {
		return sqlSession.selectOne(NAMESPACE + "getFaqOne", vo);
	}

	public int insertFaq(FaqVO vo) {
		return sqlSession.insert(NAMESPACE + "insertFaq", vo);
	}

	public int updateFaq(FaqVO vo) {
		return sqlSession.update(NAMESPACE + "updateFaq", vo);
	}

	public int deleteFaq(int vo) {
		return sqlSession.delete(NAMESPACE + "deleteFaq", vo);
	}

	public List<FaqVO> getFaqAllList() {
		return sqlSession.selectList(NAMESPACE + "getFaqAllList");
	}

	public int updateFname(FaqTypeVO vo) {
		return sqlSession.update(NAMESPACE + "updateFname", vo);
	}

	public int deleteFname(FaqTypeVO vo) {
		return sqlSession.delete(NAMESPACE + "deleteFname", vo);
	}

}
