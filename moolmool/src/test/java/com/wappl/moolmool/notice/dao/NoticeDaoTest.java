package com.wappl.moolmool.notice.dao;

import static org.hamcrest.CoreMatchers.is;
import static org.hamcrest.CoreMatchers.notNullValue;
import static org.hamcrest.Matchers.greaterThanOrEqualTo;
import static org.junit.Assert.assertThat;

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
public class NoticeDaoTest {
	
	@Autowired
	private NoticeDao noticeDao;

	@Test
	public void testGetNoticeList() {
		int page = 1;
		assertThat(noticeDao.getNoticeList(page).size(), is(greaterThanOrEqualTo(1)));
	}

	@Test
	public void testGetNoticeOne() {
		int nNo = 1;
		assertThat(noticeDao.getNoticeOne(nNo), is(notNullValue()));
	}

	@Test
	public void testInsertNotice() {
		NoticeVO nVo = new NoticeVO();
		nVo.setTitle("공지사항 테스트 제목");
		nVo.setContent("공지사항 테스트 내용");
		nVo.setCategory("이벤트");
		assertThat(noticeDao.insertNotice(nVo), is(1));
	}

	@Test
	public void testUpdateNotice() {
		NoticeVO nVo = new NoticeVO();
		nVo.setnNo(1);
		nVo.setTitle("공지사항 테스트 제목 수정");
		nVo.setContent("공지사항 테스트 내용 수정");
		assertThat(noticeDao.updateNotice(nVo), is(1));
	}

	@Test
	public void testDeleteNotice() {
		int nNo = 1;
		assertThat(noticeDao.deleteNotice(nNo), is(1));
	}

}
