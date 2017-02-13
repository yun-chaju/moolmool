package com.wappl.moolmool.board.service;

import static org.hamcrest.CoreMatchers.instanceOf;
import static org.hamcrest.CoreMatchers.is;
import static org.hamcrest.CoreMatchers.notNullValue;
import static org.hamcrest.Matchers.greaterThanOrEqualTo;
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
public class BoardServiceTest {
	
	@Autowired
	private BoardService svc;
	
	@Test
	public void testGetService() throws Exception {
		assertThat(svc, instanceOf(BoardService.class));
	}

	@Test
	public void testDaoSession() throws Exception {
		assertThat(svc, is(notNullValue()));
	}
	
	@Test
	public void testInsertBoard() throws Exception {
		BoardVO vo = new BoardVO();
		vo.setTitle("테스트 제목4");
		vo.setContent("테스트 내용4");
		vo.setWriterNo(1);
		vo.setWriterNickname("관리자");
		vo.setBtCode("free");
		assertThat(svc.insertBoard(vo), is(1));
	}
	
	@Test
	public void testGetBoardDetail() throws Exception {
		int bno = 1;
		assertThat(
			svc.getBoardDetail(bno), is(notNullValue()));
	}

	@Test
	public void testGetPrevAndNextTitle() throws Exception {
		int bno = 2;
		assertThat(svc.getPrevAndNextTitle(bno), is(notNullValue()));
	}
	
	@Test
	public void testGetBoardMainList() throws Exception {
		List<BoardTypeVO> list = new ArrayList<>();
		list.add(new BoardTypeVO().setBtCode("free").setBtName("자유"));
		assertThat(svc.getBoardMainList(list).size(), is(greaterThanOrEqualTo(1)));
	}
	
	@Test
	public void testGetBoardTotalCount() throws Exception {
		SearchUtil searchInfo = null;
		String btName = "free";
		assertThat(svc.getBoardTotalCount(btName, searchInfo), 
				is(greaterThanOrEqualTo(1)));
	}
	
	@Test
	public void testGetBoardList() throws Exception {
		String btName = "free";
		int page = 1;
		SearchUtil searchInfo = null;
		assertThat(
				svc.getBoardList(btName, page, searchInfo).size(), 
				is(greaterThanOrEqualTo(2)));
	}
	
	@Test
	public void testDeleteBoard() throws Exception {
		int bno = 1;
		int memNo = 1;
		assertThat(svc.deleteBoard(bno, memNo), is(1));
	}
	
	@Test
	public void testUpdateBoard() throws Exception {
		BoardVO vo = new BoardVO();
		vo.setBno(1);
		vo.setTitle("제목 변경");
		vo.setContent("내용 변경");
		assertThat(svc.updateBoard(vo), is(1));
	}
	
	@Test
	public void testUpdateHit() throws Exception {
		int bno = 1;
		assertThat(svc.updateHit(bno), is(1));
	}

}
