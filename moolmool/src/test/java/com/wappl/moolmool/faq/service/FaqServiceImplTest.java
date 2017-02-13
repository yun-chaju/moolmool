package com.wappl.moolmool.faq.service;

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
@Transactional
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class FaqServiceImplTest {

	@Autowired
	private FaqService faqService;
	
	@Test
	public void testGetFaqList() throws Exception {
		String fname = "member";
		assertThat(faqService.getFaqList(fname), notNullValue());
	}

	@Test
	public void testGetFaqOne() throws Exception{
		int vo = 2;
		
		assertThat(faqService.getFaqDetail(vo), notNullValue());
	}

	@Test
	public void testInsertFaq() throws Exception{
		FaqVO vo = new FaqVO();
		vo.setContent("cont2");
		vo.setfName("fname");
		vo.setTitle("title2");
		
		assertThat(1, is(faqService.insertFaq(vo)));
	}

	@Test
	public void testUpdateFaq() throws Exception{
		FaqVO vo = new FaqVO();
		vo.setContent("cont-re");
		vo.setfNo(2);
		vo.setTitle("title-re");
		
		assertThat(1, is(faqService.updateFaq(vo)));
	}

	@Test
	public void testDeleteFaq() throws Exception{
		int vo = 1;
		assertThat(1, is(faqService.deleteFaq(vo)));
	}

}
