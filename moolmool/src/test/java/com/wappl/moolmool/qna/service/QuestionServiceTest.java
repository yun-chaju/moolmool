package com.wappl.moolmool.qna.service;

import static org.hamcrest.CoreMatchers.is;
import static org.hamcrest.CoreMatchers.notNullValue;
import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.wappl.moolmool.common.util.SearchUtil;
import com.wappl.moolmool.qna.vo.QuestionVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/root-context.xml" })
@Transactional
public class QuestionServiceTest {

	@Autowired
	private QuestionService questionService;
	
	@Test
	public void testGetQuestionList() throws Exception {
		SearchUtil searchInfo = null;
		int page = 1;
		assertThat(questionService.getQuestionList(searchInfo, page), notNullValue());
	}

	@Test
	public void testGetQuestionDetail() throws Exception {
		int qno = 1;
		
		assertThat(questionService.getQuestionDetail(qno), notNullValue());
	}

	@Test
	public void testInsertQuestion() throws Exception {
		QuestionVO vo = new QuestionVO();
		vo.setWriterNo(3);
		vo.setWriterNickname("관리자3");
		vo.setTitle("질문받는다3");
		vo.setContent("질문받았다3.");

		assertThat(1, is(questionService.insertQuestion(vo)));
	}

	@Test
	public void testUpdateQuestion() throws Exception {
		QuestionVO vo = new QuestionVO();
		vo.setQno(1);
		vo.setWriterNo(1);
		vo.setWriterNickname("채권희");
		vo.setTitle("질문 1번");
		vo.setContent("질문합니다.");
		vo.setIsPrivate('Y');

		assertThat(1, is(questionService.updateQuestion(vo)));
	}

	@Test
	public void testDeleteQuestion() throws Exception {
		int qno = 2;

		assertThat(1, is(questionService.deleteQuestion(qno)));
	}

}
