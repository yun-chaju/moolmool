package com.wappl.moolmool.point.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wappl.moolmool.point.vo.PointVO;

@Repository
public class PointDao {

	private static final String NAMESPACE = "pointMapper.";
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<PointVO> getAllPointLog(PointVO vo) {
		return sqlSession.selectList(NAMESPACE + "getAllPointLog", vo);
	}

	public int insertPoint(PointVO vo) {
		return sqlSession.insert(NAMESPACE + "insertPoint", vo);
	}
	
	public int updateMemberPoint(PointVO vo) {
		return sqlSession.update(NAMESPACE + "updateMemberPoint", vo);
	}

	public int deleteUserPointLog(PointVO vo) {
		return sqlSession.delete(NAMESPACE + "deleteUserPointLog", vo);
	}
	
	
}
