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

import com.wappl.moolmool.board.vo.BoardEvaluateVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@Transactional
public class BoardEvaluateDaoTest {

	@Autowired
	private BoardEvaluateDao dao;
	
	@Test
	public void testGetBoardEvaluateDaoInstance() throws Exception {
		assertThat(dao, instanceOf(BoardEvaluateDao.class));
	}
	
	@Test
	public void testGetExistsBoardEvaluate() throws Exception {
		BoardEvaluateVO vo = new BoardEvaluateVO()
				.setBno(1)
				.setMemNo(1);
		assertThat(dao.getExistsBoardEvaluate(vo), is(1));
	}
	
	@Test
	public void testInsertBoardReport() throws Exception {
		BoardEvaluateVO vo = new BoardEvaluateVO()
				.setBno(2)
				.setMemNo(2)
				.seteType("LIKE");
		assertThat(dao.insertBoardEvaluate(vo), is(1));
	}
}
