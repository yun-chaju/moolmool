package com.wappl.moolmool.qna.controller;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.view;

import org.junit.Before;
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

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml", 
		"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@WebAppConfiguration
@Transactional
public class AnswerControllerTest {
	@Autowired
	private WebApplicationContext ctx;

	private MockMvc mockMvc;
	
	@Before
	public void setUp() {
		mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}
	
	@Test
	public void testGetAnswerForm() throws Exception {
		mockMvc.perform(get("/qna/1/answer"))
			.andExpect(status().isOk())
			.andExpect(model().attributeExists("qnaArticle"))
			.andExpect(view().name("qna/answerInsert"));
	}
	
	@Test
	public void testGetUpdateAnswerForm() throws Exception {
		mockMvc.perform(get("/qna/1/answer/edit"))
			.andExpect(status().isOk())
			.andExpect(model().attributeExists("answerVO"))
			.andExpect(model().attributeExists("qnaArticle"))
			.andExpect(view().name("qna/answerUpdate"));
	}
	
}
