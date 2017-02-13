package com.wappl.moolmool.shop.service;

import static org.hamcrest.CoreMatchers.instanceOf;
import static org.hamcrest.CoreMatchers.is;
import static org.hamcrest.Matchers.greaterThanOrEqualTo;
import static org.junit.Assert.assertThat;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.wappl.moolmool.shop.vo.PersonaconVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/root-context.xml" })
@Transactional
public class PersonaconServiceTest {
	
	@Autowired
	private PersonaconService svc;
	
	@Test
	public void testGetServiceInstance() throws Exception {
		assertThat(svc, instanceOf(PersonaconService.class));
	}

	
	@Test
	public void testInsertPersonacon() throws Exception {
		PersonaconVO vo = new PersonaconVO()
				.setName("다마고치알")
				.setDescription("다마고치알 형태의 퍼스나콘")
				.setHtmlTag("<img src='/resources/images/icon/test.jpg' alt='다마고치알'/>")
				.setPscType("imgs")
				.setPrice(500);
		assertThat(svc.insertPersonacon(vo), is(1));
	}
	
	@Test
	public void testGetPersonaconList() throws Exception {
		int memNo = 1;
		int page = 1;
		assertThat(svc.getPersonaconList(memNo, page).size(), is(greaterThanOrEqualTo(1)));
	}
	
	@Test
	public void testGetPersonaconDetail() throws Exception {
		int pscNo = 1;
		assertThat(svc.getPersonaconDetail(pscNo), instanceOf(PersonaconVO.class));
	}
	
	@Test
	public void testUpdatePersonacon() throws Exception {
		PersonaconVO vo = new PersonaconVO()
				.setPscNo(1)
				.setName("다마고치알")
				.setDescription("다마고치알 형태의 퍼스나콘")
				.setHtmlTag("<img src='/resources/images/icon/test.jpg' alt='다마고치알'/>")
				.setPscType("imgs")
				.setPrice(500);
		assertThat(svc.updatePersonacon(vo), is(1));
	}
	
	@Test
	public void testDeletePersonacon() throws Exception {
		int pscNo = 1;
		assertThat(svc.deletePersonacon(pscNo), is(1));
	}

}
