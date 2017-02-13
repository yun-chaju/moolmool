package com.wappl.moolmool.memo.service;

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
public class MemoServiceTest {
	
	@Autowired
	private MemoService svc;
	
	@Test
	public void testGetService() throws Exception {
		assertThat(svc, instanceOf(MemoService.class));
	}

	@Test
	public void testGetMemoDetail() {
		int targetNo = 1;
		int writerNo = 2;
		assertThat(svc.getMemoDetail(
			new MemoVO().setWriterNo(writerNo).setTargetNo(targetNo)), 
			instanceOf(MemoVO.class));
	}

	@Test
	public void testInsertMemo() {
		MemoVO vo = new MemoVO()
				.setWriterNo(1)
				.setTargetNo(2)
				.setContent("일반 유저네요.");
		assertThat(svc.insertMemo(vo), is(1));
	}

	@Test
	public void testUpdateMemo() {
		MemoVO vo = new MemoVO()
				.setWriterNo(2)
				.setTargetNo(1)
				.setContent("생각해보니 관리자가 아닐...수도");
		assertThat(svc.updateMemo(vo), is(1));
	}

	@Test
	public void testDeleteMemo() {
		MemoVO vo = new MemoVO()
				.setWriterNo(2)
				.setTargetNo(1);
		assertThat(svc.deleteMemo(vo), is(1));
	}

}
