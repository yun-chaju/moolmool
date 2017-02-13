package com.wappl.moolmool.notice.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wappl.moolmool.notice.vo.NoticeVO;

@Repository
public class NoticeDao {
	
	private static final String NAMESPACE = "noticeMapper.";
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<NoticeVO> getNoticeList(int page){
		return sqlSession.selectList(NAMESPACE + "getNoticeList", page);
	}
	
	public int getNoticeTotalCount() {
		return sqlSession.selectOne(NAMESPACE + "getNoticeTotalCount");
	}
	
	public NoticeVO getNoticeOne(int nNo){
		return sqlSession.selectOne(NAMESPACE + "getNoticeOne", nNo);
	}
	
	public int insertNotice(NoticeVO nVo){
		return sqlSession.insert(NAMESPACE + "insertNotice", nVo);
	}
	
	public int updateNotice(NoticeVO nVo){
		return sqlSession.update(NAMESPACE + "updateNotice", nVo);
	}
	
	public int deleteNotice(int nNo){
		return sqlSession.delete(NAMESPACE + "deleteNotice", nNo);
	}

	

}
