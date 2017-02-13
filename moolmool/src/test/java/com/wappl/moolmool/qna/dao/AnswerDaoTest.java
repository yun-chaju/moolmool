package com.wappl.moolmool.qna.dao;

import static org.hamcrest.CoreMatchers.is;
import static org.hamcrest.CoreMatchers.notNullValue;
import static org.junit.Assert.assertThat;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.wappl.moolmool.qna.vo.AnswerVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/root-context.xml" })
@Transactional
public class AnswerDaoTest {

	@Autowired
	private AnswerDao answerDao;
	
	@Test
	public void testGetAnswer() {
		int qno = 1;
		assertThat(answerDao.getAnswer(qno), notNullValue());
	}

	@Test
	public void testInsertAnswer() {
		AnswerVO vo = new AnswerVO();
		vo.setAno(2);
		vo.setQno(2);
		vo.setContent("답글 입력했습니다2.");
		
		assertThat(1, is(answerDao.insertAnswer(vo)));
	}

	@Test
	public void testUpdateAnswer() {
		AnswerVO vo = new AnswerVO();
		vo.setAno(1);
		vo.setQno(1);
		vo.setContent("답글 입력했습니다.");
		
		assertThat(1, is(answerDao.updateAnswer(vo)));
	}

}
