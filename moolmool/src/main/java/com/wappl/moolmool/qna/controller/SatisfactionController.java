package com.wappl.moolmool.qna.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.wappl.moolmool.member.vo.MemberVO;
import com.wappl.moolmool.qna.service.AnswerService;
import com.wappl.moolmool.qna.service.SatisfactionService;
import com.wappl.moolmool.qna.vo.SatisfactionVO;

@Controller
public class SatisfactionController {

	@Autowired
	private SatisfactionService satisfactionService;
	
	@Autowired
	private AnswerService answerService;
	
	@RequestMapping(value="qna/{qno:[0-9]*}/new", method=RequestMethod.POST)
	public String insertSatisfaction(@PathVariable int qno, SatisfactionVO vo, HttpSession session) throws Exception{
		vo.setWriterNo(((MemberVO)session.getAttribute("loginUser")).getMemNo());
		satisfactionService.insertSatisfaction(vo);
		answerService.updateIsEvaluated(vo.getAno());
		return "redirect:/qna/{qno}";
	}
}
