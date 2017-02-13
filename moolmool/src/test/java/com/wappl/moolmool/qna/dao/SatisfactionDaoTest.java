package com.wappl.moolmool.qna.dao;

import static org.hamcrest.CoreMatchers.is;
import static org.hamcrest.CoreMatchers.notNullValue;
import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.wappl.moolmool.qna.vo.AnswerVO;
import com.wappl.moolmool.qna.vo.SatisfactionVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/root-context.xml" })
@Transactional
public class SatisfactionDaoTest {

	@Autowired
	private SatisfactionDao satisfactionDao;
	
	@Test
	public void testGetSatisfaction() {
		AnswerVO vo = new AnswerVO();
		vo.setAno(4);
		
		assertThat(satisfactionDao.getSatisfaction(vo), notNullValue());
	}

	@Test
	public void testInsertSatisfaction() {
		SatisfactionVO vo = new SatisfactionVO();
		vo.setAno(2);
		vo.setWriterNo(2);
		vo.setRate(3.0);
		vo.setOpinion("평가 좋음 ㅎㅎㅎ");
		
		assertThat(1, is(satisfactionDao.insertSatisfaction(vo)));
	}

}
