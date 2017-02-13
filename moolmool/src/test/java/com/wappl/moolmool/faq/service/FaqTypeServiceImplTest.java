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

import com.wappl.moolmool.faq.service.FaqTypeService;
import com.wappl.moolmool.faq.vo.FaqTypeVO;
@Transactional
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class FaqTypeServiceImplTest {

	@Autowired
	private FaqTypeService faqTypeService;
	@Test
	public void testGetFaqList() throws Exception{
		assertThat(faqTypeService.getFaqTypeList(), notNullValue());
	}

	@Test
	public void testGetFaqOne() throws Exception{
		String vo = "account";
		
		assertThat(faqTypeService.getFaqTypeDetail(vo), notNullValue());
	}

	@Test
	public void testInsertFaq() throws Exception{
		FaqTypeVO vo = new FaqTypeVO();
		vo.setfName("fname2");
		vo.setDescription("desc2");
		
		assertThat(1, is(faqTypeService.insertFaqType(vo)));
	}

	@Test
	public void testUpdateFaq() throws Exception{
		FaqTypeVO vo = new FaqTypeVO();
		vo.setfName("account2");
		vo.setDescription("설명2");
		vo.setOldFName("account");
		
		assertThat(1, is(faqTypeService.updateFaqType(vo)));
	}

	@Test
	public void testDeleteFaq() throws Exception{
		FaqTypeVO vo = new FaqTypeVO();
		vo.setfName("account");
		
		assertThat(1, is(faqTypeService.deleteFaqType(vo)));
	}

}
