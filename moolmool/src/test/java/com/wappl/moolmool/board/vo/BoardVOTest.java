package com.wappl.moolmool.board.vo;

import static org.hamcrest.CoreMatchers.is;
import static org.junit.Assert.*;

import java.util.Set;

import javax.validation.ConstraintViolation;
import javax.validation.Validation;
import javax.validation.Validator;
import javax.validation.ValidatorFactory;

import org.junit.BeforeClass;
import org.junit.Test;

public class BoardVOTest {

	private static Validator validator;

	@BeforeClass
	public static void setUpValidator() {
		ValidatorFactory factory = Validation.buildDefaultValidatorFactory();
		validator = factory.getValidator();
	}
	
	@Test
	public void titleIsBlank() throws Exception {
		BoardVO vo = new BoardVO();
		vo.setTitle("          ");
		vo.setContent("내용");
		Set<ConstraintViolation<BoardVO>> constraintViolation =
				validator.validate(vo);
		assertThat(constraintViolation.size(), is(1));
	}
	
	@Test
	public void contentIsBlank() throws Exception {
		BoardVO vo = new BoardVO();
		vo.setTitle("   1      ");
		vo.setContent("");
		Set<ConstraintViolation<BoardVO>> constraintViolation =
				validator.validate(vo);
		assertThat(constraintViolation.size(), is(1));
	}

}
