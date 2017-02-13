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

import com.wappl.moolmool.board.vo.BoardTypeVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@Transactional
public class BoardTypeDaoTest {
	
	@Autowired
	private BoardTypeDao dao;
	
	@Test
	public void testGetDao() throws Exception {
		assertThat(dao, instanceOf(BoardTypeDao.class));
	}
	
	@Test
	public void testGetBoardTypeDetail() throws Exception {
		String btName = "free";
		assertThat(
			dao.getBoardTypeDetail(btName), instanceOf(BoardTypeVO.class));
	}
	
	@Test
	public void testGetBoardTypeList() throws Exception {
		assertThat(
			dao.getBoardTypeList().size(), is(greaterThan(1)));
	}
	
	@Test
	public void testInsertBoardType() throws Exception {
		BoardTypeVO vo = new BoardTypeVO();
		vo.setBtCode("book");
		vo.setBtName("책");
		vo.setDescription("게시판 설명");
		assertThat(dao.insertBoardType(vo), is(1));
	}
	
	@Test
	public void testUpdateBoardType() throws Exception {
		BoardTypeVO vo = new BoardTypeVO();
		vo.setBtCode("free");
		vo.setBtName("자유");
		vo.setDescription("자유 게시판의 설명 변경");
		assertThat(dao.updateBoardType(vo), is(1));
	}
	
	@Test
	public void testDeleteBoardType() throws Exception {
		String btName = "free";
		assertThat(dao.deleteBoardType(btName), is(1));
	}

}
