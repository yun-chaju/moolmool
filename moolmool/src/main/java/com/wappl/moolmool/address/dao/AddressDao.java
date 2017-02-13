package com.wappl.moolmool.address.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AddressDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public List<String> getGugunList(String sido) {
		return sqlSession.selectList("getGugunList", sido);
	}
	
	public List<String> getEmdList(String gugun) {
		return sqlSession.selectList("getEmdList", gugun);
	}


}
