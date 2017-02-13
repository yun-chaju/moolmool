package com.wappl.moolmool.qna.service;

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
public class AnswerServiceTest {
	
	@Autowired
	private AnswerService answerService;

	@Test
	public void testGetAnswer() throws Exception {
		int qno = 1;

		assertThat(answerService.getAnswer(qno), notNullValue());
	}

	@Test
	public void testInsertAnswer() throws Exception {
		AnswerVO vo = new AnswerVO();
		vo.setAno(2);
		vo.setQno(2);
		vo.setContent("답글 입력했습니다2.");
		
		assertThat(1, is(answerService.insertAnswer(vo)));
	}

	@Test
	public void testUpdateAnswer() throws Exception {
		AnswerVO vo = new AnswerVO();
		vo.setAno(1);
		vo.setQno(1);
		vo.setContent("답글 입력했습니다.");
		
		assertThat(1, is(answerService.updateAnswer(vo)));
	}

}
