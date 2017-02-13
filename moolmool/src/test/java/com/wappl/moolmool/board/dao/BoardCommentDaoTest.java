package com.wappl.moolmool.board.dao;

import static org.hamcrest.CoreMatchers.instanceOf;
import static org.hamcrest.CoreMatchers.is;
import static org.hamcrest.Matchers.greaterThan;
import static org.junit.Assert.assertThat;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.wappl.moolmool.board.vo.BoardCommentVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@Transactional
public class BoardCommentDaoTest {
	
	@Autowired
	private BoardCommentDao dao;
	
	@Test
	public void testGetDao() throws Exception {
		assertThat(dao, instanceOf(BoardCommentDao.class));
	}
	
	@Test
	public void testInsertBoardComment() throws Exception {
		BoardCommentVO vo = new BoardCommentVO();
		vo.setBno(1);
		vo.setContent("테스트 댓글");
		vo.setWriterNo(1);
		vo.setWriterNickname("관리자");
		
		assertThat(dao.insertBoardComment(vo), is(1));
	}
	
	@Test
	public void testGetBoardCommentDetail() throws Exception {
		int cno = 1;
		assertThat(
			dao.getBoardCommentDetail(cno), instanceOf(BoardCommentVO.class));
	}
	
	@Test
	public void testGetBoardCommentList() throws Exception {
		int bno = 1;
		int cpage = 1;
		assertThat(
			dao.getBoardCommentList(bno, cpage).size(), is(greaterThan(1)));
	}
	
	@Test
	public void testUpdateBoardComment() throws Exception {
		BoardCommentVO vo = new BoardCommentVO();
		vo.setCno(1);
		vo.setContent("변경된 내용");
		assertThat(dao.updateBoardComment(vo), is(1));
	}
	
	@Test
	public void testDeleteBoardComment() throws Exception {
		int cno = 1;
		assertThat(dao.deleteBoardComment(cno), is(1));
	}
	
}
