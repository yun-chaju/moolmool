package com.wappl.moolmool.board.controller;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.delete;
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

import com.wappl.moolmool.member.vo.MemberVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={
				"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml", 
				"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@WebAppConfiguration
@Transactional
public class BoardControllerTest {

	@Autowired
	private WebApplicationContext ctx;

	private MockMvc mockMvc;
	
	@Before
	public void setUp() {
		mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}
	
	@Test
	public void testBoardMain() throws Exception {
		mockMvc.perform(get("/board"))
			.andExpect(status().isOk())
			.andExpect(model().attributeExists("btypeList"))
			.andExpect(model().attributeExists("boardList"))
			.andExpect(view().name("board/index"));
	}
	
	@Test
	public void testGetBoardDetail() throws Exception {
		mockMvc.perform(get("/board/free/1"))
		.andExpect(status().isOk())
		.andExpect(model().attributeExists("boardArticle"))
		.andExpect(view().name("board/detail"));
	}
	
	@Test
	public void testGetBoardList() throws Exception {
		mockMvc.perform(get("/board/free"))
		.andExpect(status().isOk())
		.andExpect(model().attributeExists("boardList"))
		.andExpect(view().name("board/list"));
	}
	
	@Test
	public void testDeleteBoard() throws Exception {
		mockMvc.perform(delete("/board/free/1")
				.sessionAttr("loginUser", new MemberVO().setMemNo(1)))
		.andExpect(status().is3xxRedirection());
	}
}
