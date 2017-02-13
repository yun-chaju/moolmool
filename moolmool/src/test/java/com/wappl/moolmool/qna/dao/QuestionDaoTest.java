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

import com.wappl.moolmool.common.util.SearchUtil;
import com.wappl.moolmool.qna.vo.QuestionVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/root-context.xml" })
@Transactional
public class QuestionDaoTest {

	@Autowired
	private QuestionDao questionDao;

	@Test
	public void testGetQuestionList() {
		int page = 1;
		SearchUtil searchInfo = null;
		assertThat(questionDao.getQuestionList(searchInfo, page), notNullValue());
	}

	@Test
	public void testGetQuestionDetail() {
		int qno = 1;
		
		assertThat(questionDao.getQuestionDetail(qno), notNullValue());
	}

	@Test
	public void testInsertQuestion() {
		QuestionVO vo = new QuestionVO();
		vo.setWriterNo(3);
		vo.setWriterNickname("관리자3");
		vo.setTitle("질문받는다3");
		vo.setContent("질문받았다3.");

		assertThat(1, is(questionDao.insertQuestion(vo)));

	}

	@Test
	public void testUpdateQuestion() {
		QuestionVO vo = new QuestionVO();
		vo.setQno(1);
		vo.setWriterNo(1);
		vo.setWriterNickname("채권희");
		vo.setTitle("질문 1번");
		vo.setContent("질문합니다.");
		vo.setIsPrivate('Y');

		assertThat(1, is(questionDao.updateQuestion(vo)));
	}

	@Test
	public void testDeleteQuestion() {
		int qno = 2;

		assertThat(1, is(questionDao.deleteQuestion(qno)));
	}

}
