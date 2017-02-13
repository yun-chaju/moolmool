package com.wappl.moolmool.admin.service;

import static org.hamcrest.CoreMatchers.is;
import static org.junit.Assert.assertThat;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@Transactional
public class AdminServiceImplTest {

	@Autowired
	private AdminService adminService;
	
	@Test
	@Ignore
	public void getMemberCountTest() throws Exception{
		/*assertThat(adminService.getMemberCount(), is(1));*/
	}
}
