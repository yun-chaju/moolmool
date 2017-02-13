package com.wappl.moolmool.board.service;

import static org.hamcrest.CoreMatchers.instanceOf;
import static org.hamcrest.CoreMatchers.is;
import static org.hamcrest.Matchers.greaterThanOrEqualTo;
import static org.hamcrest.Matchers.notNullValue;
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
public class BoardCommentServiceTest {
	
	@Autowired
	private BoardCommentService svc;
	
	@Test
	public void testGetService() throws Exception {
		assertThat(svc, instanceOf(BoardCommentService.class));
	}

	@Test
	public void testInsertBoardComment() {
		BoardCommentVO vo = new BoardCommentVO();
		vo.setBno(1);
		vo.setContent("테스트 댓글");
		vo.setWriterNo(1);
		vo.setWriterNickname("관리자");
		
		assertThat(svc.insertBoardComment(vo), is(1));
	}

	@Test
	public void testGetBoardCommentDetail() {
		int cno = 1;
		assertThat(
			svc.getBoardCommentDetail(cno), is(notNullValue()));
	}

	@Test
	public void testGetBoardCommentList() {
		int bno = 1;
		int cpage = 1;
		assertThat(
				svc.getBoardCommentList(bno, cpage).size(), is(greaterThanOrEqualTo(1)));
	}
	
	@Test
	public void testGetBoardCommentCount() throws Exception {
		int bno = 1;
		assertThat(svc.getBoardCommentCount(bno), is(greaterThanOrEqualTo(1)));
	}

	@Test
	public void testUpdateBoardComment() {
		BoardCommentVO vo = new BoardCommentVO();
		vo.setCno(1);
		vo.setContent("변경된 내용");
		assertThat(svc.updateBoardComment(vo), is(1));
	}

	@Test
	public void testDeleteBoardComment() {
		int cno = 1;
		assertThat(svc.deleteBoardComment(cno), is(1));
	}

}
