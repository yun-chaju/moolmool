package com.wappl.moolmool.trade.dao;

import static org.hamcrest.CoreMatchers.is;
import static org.hamcrest.CoreMatchers.notNullValue;
import static org.hamcrest.Matchers.greaterThanOrEqualTo;
import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.wappl.moolmool.trade.vo.TradeCommentVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@Transactional
public class TradeCommentDaoTest {
	
	@Autowired
	private TradeCommentDao dao;

	@Test
	public void testGetTradeCommentList() {
		int tno = 1;
		assertThat(dao.getTradeCommentList(tno).size(), is(greaterThanOrEqualTo(1)));
	}
	
	@Test
	public void testGetTradeCommentDetail(){
		int tcno = 1;
		assertThat(dao.getTradeCommentDetail(tcno), notNullValue());
	}
	
	@Test
	public void testInsertTradeComment(){
		TradeCommentVO vo = new TradeCommentVO();
		vo.setContent("테스트 댓글");
		vo.setAlink("테스트링크");
		vo.setWriterUno(1);
		vo.setWriterNickname("테스트유저");
		assertThat(dao.insertTradeComment(vo), is(1));
	}
	
	@Test
	public void testUpdateTradeComment(){
		TradeCommentVO vo = new TradeCommentVO();
		vo.setTcno(1);
		vo.setContent("테스트 댓글 수정");
		vo.setAlink("테스트 링크 수정");
		assertThat(dao.updateTradeComment(vo), is(1));
	}
	
	@Test
	public void testDeleteTradeComment(){
		int tcno = 1;
		assertThat(dao.deleteTradeComment(tcno), is(1));
	}

}
