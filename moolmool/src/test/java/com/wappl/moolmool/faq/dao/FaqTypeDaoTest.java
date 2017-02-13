package com.wappl.moolmool.faq.dao;

import static org.hamcrest.CoreMatchers.is;
import static org.hamcrest.CoreMatchers.notNullValue;
import static org.junit.Assert.assertThat;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.wappl.moolmool.faq.dao.FaqTypeDao;
import com.wappl.moolmool.faq.vo.FaqTypeVO;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Transactional
public class FaqTypeDaoTest {

	@Autowired
	private FaqTypeDao faqTypeDao;
	
	@Test
	public void testGetFaqTypeList() {
		assertThat(faqTypeDao.getFaqTypeList(), notNullValue());
	}

	@Test
	public void testGetFaqTypeDetail() {
		String vo = "account";
		
		assertThat(faqTypeDao.getFaqTypeDetail(vo), notNullValue());
	}

	@Test
	public void testInsertFaqType() {
		FaqTypeVO vo = new FaqTypeVO();
		vo.setfName("fname2");
		vo.setDescription("desc2");
		
		assertThat(1, is(faqTypeDao.insertFaqType(vo)));
	}

	@Test
	public void testUpdateFaqType() {
		FaqTypeVO vo = new FaqTypeVO();
		vo.setfName("account2");
		vo.setDescription("설명2");
		vo.setOldFName("account");
		
		assertThat(1, is(faqTypeDao.updateFaqType(vo)));
	}

	@Test
	public void testDeleteFaqType() {
		FaqTypeVO vo = new FaqTypeVO();
		vo.setfName("account");
		
		assertThat(1, is(faqTypeDao.deleteFaqType(vo)));
	}

}
