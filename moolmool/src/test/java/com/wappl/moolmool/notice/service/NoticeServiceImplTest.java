package com.wappl.moolmool.notice.service;

import static org.hamcrest.CoreMatchers.is;
import static org.hamcrest.CoreMatchers.notNullValue;
import static org.hamcrest.Matchers.greaterThanOrEqualTo;
import static org.junit.Assert.assertThat;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.wappl.moolmool.notice.vo.NoticeVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@Transactional
public class NoticeServiceImplTest {
	
	@Autowired
	private NoticeService nSvc;

	@Test
	public void testGetNoticeList() throws Exception {
		int page = 1;
		assertThat(nSvc.getNoticeList(page).size(), is(greaterThanOrEqualTo(1)));
	}

	@Test
	public void testGetNoticeOne() throws Exception {
		int nNo = 1;
		assertThat(nSvc.getNoticeOne(nNo), is(notNullValue()));
	}

	@Test
	@Ignore
	public void testInsertNotice() throws Exception {
		/*NoticeVO nVo = new NoticeVO();
		nVo.setTitle("공지사항 테스트 제목");
		nVo.setContent("공지사항 테스트 내용");
		assertThat(nSvc.insertNotice(nVo), is(1));*/
	}

	@Test
	public void testUpdateNotice() throws Exception {
		NoticeVO nVo = new NoticeVO();
		nVo.setnNo(1);
		nVo.setTitle("공지사항 테스트 제목 수정");
		nVo.setContent("공지사항 테스트 내용 수정");
		assertThat(nSvc.updateNotice(nVo), is(1));
	}

	@Test
	public void testDeleteNotice() throws Exception {
		int nNo = 1;
		assertThat(nSvc.deleteNotice(nNo), is(1));
	}

}
