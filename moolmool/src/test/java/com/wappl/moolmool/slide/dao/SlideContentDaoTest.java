package com.wappl.moolmool.slide.dao;

import static org.hamcrest.CoreMatchers.instanceOf;
import static org.hamcrest.CoreMatchers.is;
import static org.hamcrest.Matchers.greaterThanOrEqualTo;
import static org.junit.Assert.assertThat;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.wappl.moolmool.slide.vo.SlideContentVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/root-context.xml" })
@Transactional
public class SlideContentDaoTest {
	
	@Autowired
	private SlideContentDao dao;
	
	@Test
	public void testGetDaoInstance() throws Exception {
		assertThat(dao, instanceOf(SlideContentDao.class));
	}
	
	@Test
	@Ignore
	public void testInsertSlideContent() throws Exception {
		SlideContentVO vo = new SlideContentVO()
				.setSno(2)
				.setWriterNo(1)
				.setContent("하니돈까스<br>copyrightⓒ wappl");
		assertThat(dao.insertSlideContent(vo), is(1));
	}
	
	@Test
	public void testUpdateSlideContent() throws Exception {
		SlideContentVO vo = new SlideContentVO()
				.setSno(1)
				.setWriterNo(1)
				.setContent("금문도<br>copyrightⓒ wappl");
		assertThat(dao.updateSlideContent(vo), is(1));
	}
	
	@Test
	public void testGetSlideContentDetail() throws Exception {
		int sno = 1;
		assertThat(dao.getSlideContentDetail(sno), 
				instanceOf(SlideContentVO.class));
	}
	
	@Test
	public void testGetSlideContentList() throws Exception {
		assertThat(dao.getSlideContentList().size(), 
				is(greaterThanOrEqualTo(1)));
	}

}
