package com.wappl.moolmool.memo.dao;

import static org.hamcrest.CoreMatchers.is;
import static org.hamcrest.Matchers.instanceOf;
import static org.junit.Assert.assertThat;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.wappl.moolmool.memo.vo.MemoVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/root-context.xml" })
@Transactional
public class MemoDaoTest {
	
	@Autowired
	private MemoDao dao;

	@Test
	public void testGetMemoDao() throws Exception {
		assertThat(dao, instanceOf(MemoDao.class));
	}
	
	@Test
	public void testGetMemoDetail() throws Exception {
		int targetNo = 1;
		int writerNo = 2;
		assertThat(dao.getMemoDetail(
			new MemoVO().setWriterNo(writerNo).setTargetNo(targetNo)), 
			instanceOf(MemoVO.class));
	}
	
	@Test
	public void testInsertMemo() throws Exception {
		MemoVO vo = new MemoVO()
				.setWriterNo(1)
				.setTargetNo(2)
				.setContent("일반 유저네요.");
		assertThat(dao.insertMemo(vo), is(1));
	}
	
	@Test
	public void testUpdateMemo() throws Exception {
		MemoVO vo = new MemoVO()
				.setWriterNo(2)
				.setTargetNo(1)
				.setContent("생각해보니 관리자가 아닐...수도");
		assertThat(dao.updateMemo(vo), is(1));
	}
	
	@Test
	public void testDeleteMemo() throws Exception {
		MemoVO vo = new MemoVO()
				.setWriterNo(2)
				.setTargetNo(1);
		assertThat(dao.deleteMemo(vo), is(1));
	}
	
}
