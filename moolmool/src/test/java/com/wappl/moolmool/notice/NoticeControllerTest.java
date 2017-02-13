package com.wappl.moolmool.notice;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.delete;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.put;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;
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
public class NoticeControllerTest {
	
	@Autowired
	private WebApplicationContext ctx;

	private MockMvc mockMvc;
	
	@Before
	public void setUp() {
		mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}

	/*@Test
	@Ignore
	public void testGetNoticeList() throws Exception {
		mockMvc.perform(get("/notice/list"))
		.andExpect(status().isOk())
		.andExpect(model().attributeExists("noticeList"))
		.andExpect(view().name("notice/noticeList"));		
	}*/

	@Test
	public void testInsertNoticeForm() throws Exception {
		mockMvc.perform(get("/notice/new"))
		.andExpect(status().isOk())
		.andExpect(view().name("notice/noticeInsert"));	
	}

	@Test
	public void testInsertNotice() {
	//	
	}

	@Test
	public void testUpdateNoticeForm() throws Exception {
		mockMvc.perform(get("/notice/1/edit"))
		.andExpect(status().isOk())
		.andExpect(model().attributeExists("noticeDetail"))
		.andExpect(view().name("notice/noticeUpdate"));
	}

	@Test
	public void testUpdateNotice() {
		//
	}

	@Test
	public void testDeleteNotice() throws Exception {
		mockMvc.perform(delete("/notice/1").sessionAttr("loginUser", new MemberVO().setMemNo(1)))
		.andExpect(status().is3xxRedirection());
		
		
	}

}
