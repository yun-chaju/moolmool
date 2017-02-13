package com.wappl.moolmool.trade.service;

import static org.hamcrest.CoreMatchers.is;
import static org.hamcrest.Matchers.greaterThanOrEqualTo;
import static org.junit.Assert.assertThat;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.wappl.moolmool.trade.vo.TradeCategoryVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@Transactional
public class TradeCategoryServiceTest {
	
	@Autowired
	private TradeCategoryService svc;

	@Test
	public void testGetTradeCategoryList() {
		assertThat(svc.getTradeCategoryList().size(), is(greaterThanOrEqualTo(1)));
	}
	
	@Test
	public void testGetTradeSubCategoryList() throws Exception {
		assertThat(svc.getTradeSubCategoryList("컴퓨터").size(), is(greaterThanOrEqualTo(1)));
	}
	
	@Test
	public void testInsertTradeCategory(){
		TradeCategoryVO vo = new TradeCategoryVO();
		vo.setName("테스트 카테고리 제목");
		vo.setParentNo(1);
		assertThat(svc.insertTradeCategory(vo), is(1));
	}
	
	@Test
	public void testUpdateTradeCategory(){
		TradeCategoryVO vo = new TradeCategoryVO();
		vo.setTdcNo(1);
		vo.setName("테스트 카테고리 제목 수정");
		vo.setParentNo(2);
		assertThat(svc.updateTradeCategory(vo), is(1));
	}
	
	@Test
	public void testDeleteTradeCategory(){
		int tdcNo = 1;
		assertThat(svc.deleteTradeCategory(tdcNo), is(1));
	}

}
