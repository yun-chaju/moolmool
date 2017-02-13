package com.wappl.moolmool.address.dao;

import static org.hamcrest.CoreMatchers.instanceOf;
import static org.hamcrest.Matchers.greaterThan;
import static org.hamcrest.Matchers.is;
import static org.junit.Assert.assertThat;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@Transactional
public class AddressDaoTest {
	
	@Autowired
	private AddressDao dao;
	
	@Test
	public void testGetAddressDaoInstance() throws Exception {
		assertThat(dao, instanceOf(AddressDao.class));
	}
	
	@Test
	public void testGetGugunList() throws Exception {
		String sido = "서울특별시";
		assertThat(dao.getGugunList(sido).size(), is(greaterThan(1)));
	}
	
	@Test
	public void testGetEmdList() throws Exception {
		String gugun = "강남구";
		assertThat(dao.getEmdList(gugun).size(), is(greaterThan(1)));
	}
	
}
