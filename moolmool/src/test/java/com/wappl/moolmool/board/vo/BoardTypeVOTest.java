package com.wappl.moolmool.board.vo;

import static org.hamcrest.Matchers.is;
import static org.junit.Assert.*;

import java.util.Set;

import javax.validation.ConstraintViolation;
import javax.validation.Validation;
import javax.validation.Validator;
import javax.validation.ValidatorFactory;

import org.junit.BeforeClass;
import org.junit.Test;

public class BoardTypeVOTest {

	private static Validator validator;

	@BeforeClass
	public static void setUpValidator() {
		ValidatorFactory factory = Validation.buildDefaultValidatorFactory();
		validator = factory.getValidator();
	}
	
	@Test
	public void btNameIsBlank() throws Exception {
		BoardTypeVO vo = new BoardTypeVO();
		vo.setBtName("    ");
		Set<ConstraintViolation<BoardTypeVO>> constraintViolation =
				validator.validate(vo);
		assertThat(constraintViolation.size(), is(1));
	}

}
