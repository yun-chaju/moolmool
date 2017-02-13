package com.wappl.moolmool.board.service;

import static org.hamcrest.CoreMatchers.instanceOf;
import static org.hamcrest.CoreMatchers.is;
import static org.hamcrest.Matchers.greaterThan;
import static org.hamcrest.Matchers.notNullValue;
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
public class BoardTypeServiceTest {
	
	@Autowired
	private BoardTypeService svc;
	
	@Test
	public void testGetService() throws Exception {
		assertThat(svc, instanceOf(BoardTypeService.class));
	}

	@Test
	public void testGetBoardTypeDetail() {
		String btName = "free";
		assertThat(
			svc.getBoardTypeDetail(btName), is(notNullValue()));
	}

	@Test
	public void testGetBoardTypeList() {
		assertThat(
				svc.getBoardTypeList().size(), is(greaterThan(1)));
	}

	@Test
	public void testInsertBoardType() {
		BoardTypeVO vo = new BoardTypeVO();
		vo.setBtCode("book");
		vo.setBtName("책");
		vo.setDescription("게시판 설명");
		assertThat(svc.insertBoardType(vo), is(1));
	}

	@Test
	public void testUpdateBoardType() {
		BoardTypeVO vo = new BoardTypeVO();
		vo.setBtCode("free");
		vo.setBtName("자유");
		vo.setDescription("자유 게시판의 설명 변경");
		assertThat(svc.updateBoardType(vo), is(1));
	}

	@Test
	public void testDeleteBoardType() {
		String btName = "free";
		assertThat(svc.deleteBoardType(btName), is(1));
	}

}
