package com.wappl.moolmool.trade.dao;

import static org.hamcrest.CoreMatchers.is;
import static org.hamcrest.CoreMatchers.notNullValue;
import static org.hamcrest.Matchers.greaterThanOrEqualTo;
import static org.junit.Assert.*;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.wappl.moolmool.trade.vo.TradeVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@Transactional
public class TradeDaoTest {
	
	@Autowired
	private TradeDao dao;
	
	@Test
	@Ignore
	public void TestGetTradeList(){
	/*	assertThat(dao.getTradeList(1, "free").size(), is(greaterThanOrEqualTo(1)));*/
	}
	
	@Test
	@Ignore
	public void TestGetTradeDetail(){
		/*int tno = 1;
		assertThat(dao.getTradeDetail(tno), notNullValue());*/
	}
	
	@Test
	@Ignore
	public void TestInsertTrade(){
		/*TradeVO vo = new TradeVO();
		vo.setTitle("테스트 제목");
		vo.setContent("테스트 내용");
		vo.setPrice(10000);
		vo.setRoadAddrPart("서울시 무슨구 무슨로 1-1");
		vo.setSido("서울시");
		vo.setSigugun("서초구");
		vo.setDongmyun("양재동");
		vo.setAddrDetail("테스트 상세주소");
		vo.setTradeCode('S');
		vo.setWriterUno(1);
		vo.setWriterNickname("테스트 유저");
		vo.setTradeType('M');
		assertThat(dao.insertTrade(vo), is(1));*/
	}
	
	@Test
	public void TestUpdateTrade(){
		TradeVO vo = new TradeVO();
		vo.setTno(1);
		vo.setTdcno(5);
		vo.setTitle("테스트 제목 수정");
		vo.setContent("테스트 내용 수정");
		vo.setPrice(20000);
		vo.setRoadAddrPart("테스트 도로명 수정 1-1");
		vo.setSido("서울시");
		vo.setSigugun("서초구");
		vo.setDongmyun("양재동");
		vo.setAddrDetail("테스트 상세주소명 수정");
		vo.setTradeType('F');
		assertThat(dao.updateTrade(vo), is(1));
	}
	
	@Test
	public void TestDeleteTrade(){
		int tno = 1;
		assertThat(dao.deleteTrade(tno), is(1));
	}

}
