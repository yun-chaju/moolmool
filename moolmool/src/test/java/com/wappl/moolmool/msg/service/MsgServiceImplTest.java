package com.wappl.moolmool.msg.service;

import static org.hamcrest.CoreMatchers.is;
import static org.hamcrest.CoreMatchers.notNullValue;
import static org.junit.Assert.*;

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
public class MsgServiceImplTest {

	@Autowired
	private MsgService service;
	
	@Test
	public void getMsgListTest() throws Exception{
		Map<String, Object> map = new HashMap<>();
		map.put("page", 1);
		map.put("no", 1);
		map.put("mtype", "s");
		List<MsgVO> list = service.getMsgList(map);
		
		assertThat(list, notNullValue());
		
	}
	
	@Test
	public void getMsgDetailTest() throws Exception{
		MsgVO vo = new MsgVO();
		vo.setMno(1);
		MsgVO msg = service.getMsgDetail(vo);
		
		assertThat(msg, notNullValue());
	}
	
	
	@Test
	public void updateOpenTest() throws Exception{
		MsgVO vo = new MsgVO();
		vo.setMno(1);
		int result = service.updateOpen(vo);
		assertThat(result, is(1));
		
	}
	
	@Test
	public void insertMsgTest() throws Exception{
		MsgVO vo = new MsgVO();
		vo.setMno(1);
		vo.setSno(1);
		vo.setRno(2);
		vo.setTitle("제목");
		vo.setContent("내용");
		int result = service.insertMsg(vo);
		
		assertThat(result, is(1));
		
	}
	@Test
	public void deleteMsgTest() throws Exception{
		MsgVO vo = new MsgVO();
		vo.setMno(1);
		int result = service.deleteMsg(vo);
		
		assertThat(result, is(1));
		
	}

	
	@Test
	@Ignore
	public void getMsgCountTest() throws Exception {
		/*Map<String, Object> map = new HashMap<>();
		map.put("mtype", "s");
		map.put("no", 1);
		int result = service.getMsgCount(map);
		
		assertTrue(result >0 );
		*/
	} 
	
	@Test
	@Ignore
	public void getNotOpendMsgCountTest() throws Exception {
		/*int rno = 1;
		int result = service.getNotOpendMsgCount(rno);
		
		assertTrue(result> 0);*/
	}
	
	@Test
	@Ignore
	public void deleteMsgsTest() throws Exception {
		/*Map<String, Object> map = new HashMap<>();
		List<Integer> list = new ArrayList<>();
		Map<String, Object> nos = new HashMap<>();
		nos.put("rno", 1);
		map.put("nos", nos);
		map.put("list", list);
		list.add(1);
		list.add(2);
		int result = service.deleteMsg(map);
		assertThat(result, is(1));
		
		*/
	}
	
	
}
