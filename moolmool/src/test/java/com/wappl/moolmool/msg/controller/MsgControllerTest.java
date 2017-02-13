package com.wappl.moolmool.msg.controller;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.delete;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.flash;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.redirectedUrl;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.view;

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

import com.wappl.moolmool.member.vo.MemberVO;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={
				"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml", 
				"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@WebAppConfiguration
@Transactional
public class MsgControllerTest {

	@Autowired
	private WebApplicationContext ctx;
	private MockMvc mockMvc;
	
	@Before
	public void setUp() {
		/*mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();*/
	}

	@Test
	public void getMsgListTest() throws Exception {
	/*	mockMvc.perform(get("message/list/receive"))
			.andExpect(status().isOk())
			.andExpect(model().attributeExists("msgList"))
			.andExpect(view().name("message/list"));*/
	}

	@Test
	@Ignore
	public void getMsgListByTypeTest() throws Exception {
/*		mockMvc.perform(get("message/list/send"))
			.andExpect(status().isOk())
			.andExpect(model().attributeExists("msgList"))
			.andExpect(view().name("message/list"));*/
	}

	@Test
	@Ignore
	public void getMsgDetailTest() throws Exception {
		/*mockMvc.perform(get("message/1"))
			.andExpect(status().isOk())
			.andExpect(model().attributeExists("msg"))
			.andExpect(view().name("message/detail"));*/
	}


	@Test
	@Ignore
	public void insertMsgTest() throws Exception {


		/* mockMvc.perform(get("/person/1"))
		 		.andExpect(status().isOk())
	 			.andExpect(content().contentType(MediaType.APPLICATION_JSON))
	 			.andExpect(jsonPath("$.person.name").value("Jason"));

		 mockMvc.perform(post("/form"))
		   .andExpect(status().isOk())
		   .andExpect(redirectedUrl("/person/1"))
		   .andExpect(model().size(1))
		   .andExpect(model().attributeExists("person"))
		   .andExpect(flash().attributeCount(1))
		   .andExpect(flash().attribute("message", "success!"));
		 
		mockMvc.perform(post("message/list/insert")
				.sessionAttr("loginUser", new MemberVO().setMemNo(1)))
				.andExpect(status().is3xxRedirection())
				.andExpect(redirectedUrl("receive"))
				.andExpect(flash().attribute("message", "success!"));*/
	}

	@Test
	@Ignore
	public void deleteMsgTest() throws Exception {
	/*	mockMvc.perform(delete("message/list/1")
				.sessionAttr("loginUser", new MemberVO().setMemNo(1)))
				.andExpect(status().is3xxRedirection());*/
	}
	
}
