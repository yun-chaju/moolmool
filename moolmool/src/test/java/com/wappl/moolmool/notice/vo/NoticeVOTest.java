package com.wappl.moolmool.notice.vo;

import static org.hamcrest.CoreMatchers.is;
import static org.junit.Assert.*;

import java.util.Set;

import javax.validation.ConstraintViolation;
import javax.validation.Validation;
import javax.validation.Validator;
import javax.validation.ValidatorFactory;

import org.junit.BeforeClass;
import org.junit.Test;

public class NoticeVOTest {

	private static Validator validator;

	@BeforeClass
	public static void setUpValidator() {
		ValidatorFactory factory = Validation.buildDefaultValidatorFactory();
		validator = factory.getValidator();
	}
	
	@Test
	public void titleIsBlank(){
		NoticeVO nVo = new NoticeVO();
		nVo.setTitle("          ");
		nVo.setContent("테스트");
		nVo.setCategory("공지");
		Set<ConstraintViolation<NoticeVO>> constraintViolation =
				validator.validate(nVo);
		assertThat(constraintViolation.size(), is(1));
	}
	
	@Test
	public void contentIsBlank(){
		NoticeVO nVo = new NoticeVO();
		nVo.setTitle("테스트");
		nVo.setContent("          ");
		nVo.setCategory("공지");
		Set<ConstraintViolation<NoticeVO>> constraintViolation =
				validator.validate(nVo);
		assertThat(constraintViolation.size(), is(1));
	}
	
	@Test
	public void categoryIsBlank(){
		NoticeVO nVo = new NoticeVO();
		nVo.setTitle("테스트");
		nVo.setContent("내용");
		nVo.setCategory("          ");
		Set<ConstraintViolation<NoticeVO>> constraintViolation =
				validator.validate(nVo);
		assertThat(constraintViolation.size(), is(1));
	}

}
