package com.wappl.moolmool.shop.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wappl.moolmool.shop.vo.PersonaconOrderHistoryVO;
import com.wappl.moolmool.shop.vo.PersonaconVO;

@Repository
public class PersonaconDao {
	
	@Autowired
	private SqlSession sqlSession;

	public int insertPersonacon(PersonaconVO vo) {
		return sqlSession.insert("insertPersonacon", vo);
	}
	
	public int insertOrderPersonacon(PersonaconOrderHistoryVO vo) {
		return sqlSession.insert("insertOrderPersonacon", vo);
	}

	public List<PersonaconVO> getPersonaconList(int memNo, int page) {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("memNo", memNo);
		paramMap.put("page", page);
		return sqlSession.selectList("getPersonaconList", paramMap);
	}

	public PersonaconVO getPersonaconDetail(int pscNo) {
		return sqlSession.selectOne("getPersonaconDetail", pscNo);
	}

	public int updatePersonacon(PersonaconVO vo) {
		return sqlSession.update("updatePersonacon", vo);
	}

	public int deletePersonacon(int pscNo) {
		return sqlSession.delete("deletePersonacon", pscNo);
	}
	
	public int updateMemberPersonacon(int pscNo, int memNo) {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("pscNo", pscNo);
		paramMap.put("memNo", memNo);
		return sqlSession.update("updateMemberPersonacon", paramMap);
	}
	
	public int getPersonaconTotalCount() {
		return sqlSession.selectOne("getPersonaconTotalCount");
	}

}
