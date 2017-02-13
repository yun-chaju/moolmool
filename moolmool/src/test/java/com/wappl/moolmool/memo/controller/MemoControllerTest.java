package com.wappl.moolmool.memo.controller;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.delete;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.put;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.context.WebApplicationContext;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.wappl.moolmool.member.vo.MemberVO;
import com.wappl.moolmool.memo.vo.MemoVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={
				"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml", 
				"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@WebAppConfiguration
@Transactional
public class MemoControllerTest {

	@Autowired
	private WebApplicationContext ctx;

	private MockMvc mockMvc;
	
	@Before
	public void setUp() {
		mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}
	
	@Test
	public void testGetMemoDetail() throws Exception {
		MemberVO vo = new MemberVO().setMemNo(2);
		mockMvc.perform(get("/memo/1").sessionAttr("loginUser", vo))
			.andExpect(status().isOk());
	}
	
	@Test
	public void testInsertMemo() throws Exception {
		MemberVO memberVO = new MemberVO().setMemNo(1);
		MemoVO memoVO = new MemoVO().setContent("testtest");
		mockMvc.perform(post("/memo/2/new").sessionAttr("loginUser", memberVO)
				.content(new ObjectMapper().writeValueAsString(memoVO))
				.contentType(MediaType.APPLICATION_JSON))
			.andExpect(status().isOk());
	}
	
	@Test
	public void testUpdateMemo() throws Exception {
		MemberVO vo = new MemberVO().setMemNo(2);
		MemoVO memoVO = new MemoVO().setContent("testtest");
		mockMvc.perform(put("/memo/1").sessionAttr("loginUser", vo)
				.content(new ObjectMapper().writeValueAsString(memoVO))
				.contentType(MediaType.APPLICATION_JSON))
			.andExpect(status().isOk());
	}
	
	@Test
	public void testDeleteMemo() throws Exception {
		MemberVO vo = new MemberVO().setMemNo(2);
		mockMvc.perform(delete("/memo/1").sessionAttr("loginUser", vo))
			.andExpect(status().isOk());
	}

}
