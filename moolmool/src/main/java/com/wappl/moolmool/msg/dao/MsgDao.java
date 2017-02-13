package com.wappl.moolmool.msg.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wappl.moolmool.msg.vo.MsgVO;

@Repository
public class MsgDao { 
	
	private static final String NAMESPACE = "msgMapper.";

	@Autowired
	private SqlSession sqlSession;
	
	
	public List<MsgVO> getMsgList(Map<String, Object> map) throws Exception {
		return sqlSession.selectList(NAMESPACE + "getMsgList", map);
	}
	public MsgVO getMsgDetail(MsgVO vo) throws Exception{
		return sqlSession.selectOne(NAMESPACE + "getMsgDetail", vo);
	}
	public int insertMsg(MsgVO vo) throws Exception {
		return sqlSession.insert(NAMESPACE + "insertMsg", vo);
	}
	public int updateOpen(MsgVO vo) throws Exception {
		return sqlSession.update("updateOpen", vo);
	}
	public int deleteMsg(MsgVO vo) throws Exception {
		return sqlSession.delete(NAMESPACE + "deleteMsg", vo);
	}
	public int deleteMsg(Map<String, Object> map)	throws Exception {
		return sqlSession.delete(NAMESPACE + "deleteChecked", map);
	}
	public int getMsgCount(Map<String, Object> map) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"getMsgCount", map);
	}
	public int getNotOpendMsgCount(int rno) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"getNotOpendMsgCount", rno);
	}
	public int insertMessage(MsgVO vo) throws Exception {
		System.out.println(vo);
		return sqlSession.insert(NAMESPACE + "insertMessage", vo);
	}

	
	
	

}
