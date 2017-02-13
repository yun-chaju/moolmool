package com.wappl.moolmool.memo.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wappl.moolmool.memo.vo.MemoVO;

@Repository
public class MemoDao {
	
	@Autowired
	private SqlSession sqlSession;

	public MemoVO getMemoDetail(MemoVO vo) {
		return sqlSession.selectOne("getMemoDetail", vo);
	}

	public int insertMemo(MemoVO vo) {
		return sqlSession.insert("insertMemo", vo);
	}

	public int updateMemo(MemoVO vo) {
		return sqlSession.update("updateMemo", vo);
	}

	public int deleteMemo(MemoVO vo) {
		return sqlSession.delete("deleteMemo", vo);
	}

}
