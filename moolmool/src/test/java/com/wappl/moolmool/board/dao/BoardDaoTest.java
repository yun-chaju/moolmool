package com.wappl.moolmool.board.dao;

import static org.hamcrest.CoreMatchers.instanceOf;
import static org.hamcrest.CoreMatchers.is;
import static org.hamcrest.Matchers.greaterThanOrEqualTo;
import static org.hamcrest.Matchers.notNullValue;
import static org.junit.Assert.*;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.wappl.moolmool.board.vo.BoardTypeVO;
import com.wappl.moolmool.board.vo.BoardVO;
import com.wappl.moolmool.common.util.SearchUtil;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@Transactional
public class BoardDaoTest {

	@Autowired
	private BoardDao dao;
	
	@Test
	public void testGetDao() throws Exception {
		assertThat(dao, instanceOf(BoardDao.class));
	}
	
	@Test
	public void testInsertBoard() throws Exception {
		BoardVO vo = new BoardVO();
		vo.setTitle("테스트 제목4");
		vo.setContent("테스트 내용4");
		vo.setWriterNo(1);
		vo.setWriterNickname("관리자");
		vo.setBtCode("free");
		assertThat(dao.insertBoard(vo), is(1));
	}
	
	@Test
	public void testGetBoardDetail() throws Exception {
		int bno = 1;
		assertThat(
			dao.getBoardDetail(bno), instanceOf(BoardVO.class));
	}
	
	@Test
	public void testGetPrevAndNextTitle() throws Exception {
		int bno = 2;
		assertThat(dao.getPrevAndNextTitle(bno), is(notNullValue()));
	}
	
	@Test
	public void testGetBoardList() throws Exception {
		String btName = "free";
		int page = 1;
		SearchUtil searchInfo = null;
		assertThat(
				dao.getBoardList(btName, page, searchInfo).size(), 
				is(greaterThanOrEqualTo(1)));
	}
	
	@Test
	public void testGetBoardMainList() throws Exception {
		List<BoardTypeVO> list = new ArrayList<>();
		list.add(new BoardTypeVO().setBtCode("free").setBtName("자유"));
		assertThat(dao.getBoardMainList(list).size(), is(greaterThanOrEqualTo(1)));
	}
	
	@Test
	public void testGetBoardTotalCount() {
		SearchUtil searchInfo = null;
		String btName = "free";
		assertThat(dao.getBoardTotalCount(btName, searchInfo), 
				is(greaterThanOrEqualTo(1)));
	}
	
	@Test
	public void testDeleteBoard() throws Exception {
		int bno = 1;
		assertThat(dao.deleteBoard(bno), is(1));
	}
	
	@Test
	public void testUpdateBoard() throws Exception {
		BoardVO vo = new BoardVO();
		vo.setBno(4);
		vo.setTitle("제목 변경");
		vo.setContent("내용 변경");
		assertThat(dao.updateBoard(vo), is(1));
	}
	
	@Test
	public void testUpdateHit() throws Exception {
		int bno = 1;
		assertThat(dao.updateHit(bno), is(1));
	}
	
}
