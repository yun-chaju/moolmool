package com.wappl.moolmool.board.service;

import static org.hamcrest.Matchers.instanceOf;
import static org.hamcrest.Matchers.is;
import static org.junit.Assert.*;

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
public class BoardReportServiceTest {
	
	@Autowired
	private BoardReportService svc;
	
	@Test
	public void testGetBoardReportServiceInstance() throws Exception {
		assertThat(svc, instanceOf(BoardReportService.class));
	}
	
	@Test
	public void testGetExistsBoardReport() throws Exception {
		BoardReportVO vo = new BoardReportVO()
				.setBno(1)
				.setMemNo(1);
		assertThat(svc.getExistsBoardReport(vo), is(1));
	}
	
	@Test
	public void testInsertBoardReport() throws Exception {
		BoardReportVO vo = new BoardReportVO()
				.setBno(2)
				.setMemNo(2);
		assertThat(svc.insertBoardReport(vo), is(1));
	}

}
