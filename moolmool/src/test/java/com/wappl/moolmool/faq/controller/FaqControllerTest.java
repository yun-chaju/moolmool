package com.wappl.moolmool.faq.controller;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.view;

import org.apache.ibatis.annotations.Insert;
import org.junit.Before;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.context.WebApplicationContext;

import com.wappl.moolmool.faq.service.FaqService;
import com.wappl.moolmool.faq.service.FaqTypeService;
import com.wappl.moolmool.member.vo.MemberVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={
				"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml", 
				"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@WebAppConfiguration
@Transactional
public class FaqControllerTest {

	@Autowired
	private WebApplicationContext ctx;
	private MockMvc mockMvc;	
	@Autowired
	private FaqService faqService;
	@Autowired
	private FaqTypeService faqTypeService;
	
	@Before
	public void setUp() {
		mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}
	
	@Test
	public void getFaqAllList() throws Exception {
		mockMvc.perform(get("/faq"))
		.andExpect(status().isOk())
		.andExpect(model().attributeExists("type"))
		.andExpect(model().attributeExists("vo"))
		.andExpect(model().attributeExists("fname"))
		.andExpect(view().name("faq/FaqList"));
	}
	
	@Test
	public void getFaqList()throws Exception {
		mockMvc.perform(get("/faq"))
		.andExpect(status().isOk())
		.andExpect(model().attributeExists("type"))
		.andExpect(model().attributeExists("vo"))
		.andExpect(model().attributeExists("fname"))
		.andExpect(view().name("faq/FaqList"));
	}
	
	@Test
	public void updateForm() throws Exception{
		
	}
	
	@Test
	public void updateFaq() throws Exception{
	}
	
	@Test
	public void insertForm() throws Exception{
		
	}
	
	@Test
	public void insertFaq() throws Exception{
	}
	
	@Test
	@Ignore
	public void deleteFaq()throws Exception {
	/*	mockMvc.perform(delete("/faq/account/1")
				.sessionAttr("loginUser", new MemberVO().setMemNo(1)))
		.andExpect(status().is3xxRedirection());*/
	}

}
