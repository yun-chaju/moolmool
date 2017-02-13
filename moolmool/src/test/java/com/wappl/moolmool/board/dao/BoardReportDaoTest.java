package com.wappl.moolmool.board.dao;

import static org.hamcrest.Matchers.instanceOf;
import static org.hamcrest.Matchers.is;
import static org.junit.Assert.assertThat;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.wappl.moolmool.board.vo.BoardReportVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@Transactional
public class BoardReportDaoTest {
	
	@Autowired
	private BoardReportDao dao;
	
	@Test
	public void testGetBoardReportDaoInstance() throws Exception {
		assertThat(dao, instanceOf(BoardReportDao.class));
	}
	
	@Test
	public void testGetExistsBoardReport() throws Exception {
		BoardReportVO vo = new BoardReportVO()
				.setBno(1)
				.setMemNo(1);
		assertThat(dao.getExistsBoardReport(vo), is(1));
	}
	
	@Test
	public void testInsertBoardReport() throws Exception {
		BoardReportVO vo = new BoardReportVO()
				.setBno(2)
				.setMemNo(2);
		assertThat(dao.insertBoardReport(vo), is(1));
	}
}
