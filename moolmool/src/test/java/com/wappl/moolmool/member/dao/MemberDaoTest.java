package com.wappl.moolmool.member.dao;

import static org.hamcrest.CoreMatchers.is;
import static org.hamcrest.CoreMatchers.notNullValue;
import static org.junit.Assert.*;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.wappl.moolmool.member.vo.MemberVO;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/root-context.xml" })
@Transactional
public class MemberDaoTest {
	
	@Autowired
	private MemberDao dao;

	@Test
	public void testLoginCheck() {
		MemberVO vo = new MemberVO();
		vo.setId("user01");
		vo.setPassword("pass01");
		assertThat(dao.loginCheck(vo), is(notNullValue()));;
	}
	
	@Test
	@Ignore
	public void testInsertMember() throws Exception {
		/*MemberVO vo = new MemberVO();
		vo.setRoleCode("사용자");
		vo.setId("user02");
		vo.setPassword("pass02");
		vo.setNickName("사용자02");
		vo.setName("사용자");
		vo.setEmail("user02@moolmool.com");
		vo.setZipCode("222222");
		vo.setRoadAddrPart("사용자시 사용자구 사용자동 사용자아파트");
		vo.setJibunAddr("사용자시 사용자구 사용자동 사용자아파트");
		vo.setAddrDetail("사용자2동 사용자1호");
		vo.setPhone("22222222222");
		assertThat(dao.insertMember(vo), is(1));*/
	}
	
	
	@Test
	public void testDeleteMember() throws Exception {
		MemberVO vo = new MemberVO();
		vo.setMemNo(1);
		vo.setPassword("admin");
		assertThat(1, is(dao.deleteMember(vo)));
	}
	
	@Test
	public void testUpdateMember() throws Exception {
		MemberVO vo = new MemberVO();
		vo.setPassword("test01");
		vo.setNickName("테스트02");
		vo.setName("테스터");
		vo.setEmail("test02@moolmool.com");
		vo.setZipCode("777777");
		vo.setRoadAddrPart("테스트시 테스트구 테스트동 테스트아파트");
		vo.setJibunAddr("테스트시 테스트구 테스트동 테스트아파트");
		vo.setAddrDetail("테스트2동 테스트1호");
		vo.setPhone("77777777777");
		vo.setMemNo(1);
		assertThat(dao.updateMember(vo), is(1));
	}

}
