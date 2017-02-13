package com.wappl.moolmool.faq.dao;

import static org.hamcrest.CoreMatchers.is;
import static org.hamcrest.CoreMatchers.notNullValue;
import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.wappl.moolmool.faq.vo.FaqVO;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@Transactional
public class FaqDaoTest {

	@Autowired
	private FaqDao faqDao;
	
	@Test
	public void testGetFaqList() {
		String fname = "member";
		assertThat(faqDao.getFaqList(fname), notNullValue());
	}

	@Test
	public void testGetFaqDetail() {
		int vo = 2;
		
		assertThat(faqDao.getFaqDetail(vo), notNullValue());
	}

	@Test
	public void testInsertFaq() {
		FaqVO vo = new FaqVO();
		vo.setContent("cont2");
		vo.setfName("fname");
		vo.setTitle("title2");
		
		assertThat(1, is(faqDao.insertFaq(vo)));
	}

	@Test
	public void testUpdateFaq() {
		FaqVO vo = new FaqVO();
		vo.setContent("cont-re");
		vo.setTitle("title-re");
		vo.setfNo(2);
		assertThat(1, is(faqDao.updateFaq(vo)));
	}

	@Test
	public void testDeleteFaq() {
		int vo = 2;
		assertThat(1, is(faqDao.deleteFaq(vo)));
	}

}
