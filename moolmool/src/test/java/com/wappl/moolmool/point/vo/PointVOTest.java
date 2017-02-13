package com.wappl.moolmool.point.vo;

import static org.hamcrest.Matchers.is;
import static org.junit.Assert.*;

import java.util.Set;

import javax.validation.ConstraintViolation;
import javax.validation.Validation;
import javax.validation.Validator;
import javax.validation.ValidatorFactory;

import org.junit.BeforeClass;
import org.junit.Test;

import com.wappl.moolmool.board.vo.BoardCommentVO;

public class PointVOTest {

	private static Validator validator;

	@BeforeClass
	public static void setUpValidator() {
		ValidatorFactory factory = Validation.buildDefaultValidatorFactory();
		validator = factory.getValidator();
	}
	
	@Test
	public void contentIsBlank() throws Exception {
		BoardCommentVO vo = new BoardCommentVO();
		Set<ConstraintViolation<BoardCommentVO>> constraintViolation =
				validator.validate(vo);
		assertThat(constraintViolation.size(), is(1));
		//assertThat("", is(constraintViolation.iterator().next().getMessage()));
	}

}
