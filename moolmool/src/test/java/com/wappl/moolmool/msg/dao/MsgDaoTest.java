package com.wappl.moolmool.msg.dao;

import static org.hamcrest.CoreMatchers.is;
import static org.hamcrest.CoreMatchers.notNullValue;
import static org.junit.Assert.assertThat;
import static org.junit.Assert.assertTrue;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.wappl.moolmool.msg.vo.MsgVO;

@RunWith(SpringJUnit4ClassRunner.class)
@Transactional
@ContextConfiguration(locations="file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class MsgDaoTest {

	@Autowired
	private MsgDao dao;
	
	@Test
	public void getMsgListTest() throws Exception{
		Map<String, Object> map = new HashMap<>();
		map.put("page", 1);
		map.put("no", 1);
		map.put("mtype", "s");
		List<MsgVO> list = dao.getMsgList(map);
		
		assertThat(list, notNullValue());
		
	}
	
	@Test
	public void getMsgDetailTest() throws Exception{
		MsgVO vo = new MsgVO();
		vo.setMno(1);
		MsgVO msg = dao.getMsgDetail(vo);
		
		assertThat(msg, notNullValue());
	}
	
	
	@Test
	public void updateOpenTest() throws Exception{
		MsgVO vo = new MsgVO();
		vo.setMno(1);
		int result = dao.updateOpen(vo);
		assertThat(result, is(1));
		
	}
	
	@Test
	public void insertMsgTest() throws Exception{
		MsgVO vo = new MsgVO();
		vo.setSid("admin");
		vo.setRid("user01");
		vo.setTitle("insertMsgTest");
		vo.setContent("insertMsgTest");
		int result = dao.insertMsg(vo);
		assertThat(result, is(1));
		
	}
	@Test
	public void deleteMsgTest() throws Exception{
		MsgVO vo = new MsgVO();
		vo.setMno(1);
		int result = dao.deleteMsg(vo);
		assertThat(result, is(1));
		
	}

	
	@Test
	@Ignore
	public void getMsgCountTest() throws Exception {
		/*Map<String, Object> map = new HashMap<>();
		map.put("mtype", "s");
		map.put("no", 1);
		int result = dao.getMsgCount(map);
		
		assertTrue(result >0 );*/
		
	} 
	
	@Test
	@Ignore
	public void getNotOpendMsgCountTest() throws Exception {
	/*	int rno = 1;
		int result = dao.getNotOpendMsgCount(rno);
		
		assertTrue(result> 0);*/
	}
	
	@Test
	@Ignore
	public void deleteMsgsTest() throws Exception {
		/*y*/
		
		
	}

	
}
