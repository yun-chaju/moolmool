package com.wappl.moolmool.qna.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.wappl.moolmool.member.vo.MemberVO;
import com.wappl.moolmool.qna.service.AnswerService;
import com.wappl.moolmool.qna.service.QuestionService;
import com.wappl.moolmool.qna.vo.AnswerVO;

@Controller
public class AnswerController {
	
	@Autowired
	private AnswerService answerService;
	
	@Autowired
	private QuestionService questionService;

	@RequestMapping(value="qna/{qno:[0-9]*}/answer", method=RequestMethod.GET)
	public String insertAnswerForm(@PathVariable int qno, Model model) throws Exception{
			model.addAttribute("qnaArticle", questionService.getQuestionDetail(qno));
		return "qna/answerInsert";
	}
	
	@RequestMapping(value="qna/{qno:[0-9]*}/answer", method=RequestMethod.POST)
	public String insertAnswer(@PathVariable int qno, @RequestParam String content, HttpSession session) throws Exception{
		AnswerVO vo = new AnswerVO();
		vo.setQno(qno);
		vo.setContent(content);
		vo.setAdminNo(((MemberVO)session.getAttribute("loginUser")).getMemNo());
		vo.setAdminNickname(((MemberVO)session.getAttribute("loginUser")).getNickName());
		answerService.insertAnswer(vo);
		questionService.updateQuestion(qno);
		return "redirect:/qna/{qno}";
	}
	
	@RequestMapping(value="qna/{qno:[0-9]*}/answer/edit", method=RequestMethod.GET)
	public String updateAnswerForm(@PathVariable int qno, Model model) throws Exception{
		model.addAttribute("answerVO", answerService.getAnswer(qno))
				.addAttribute("qnaArticle", questionService.getQuestionDetail(qno));
		return "qna/answerUpdate";
	}
	
	@RequestMapping(value="qna/{qno:[0-9]*}/answer/edit", method=RequestMethod.PUT)
	public String updateAnswer(@ModelAttribute("answerVO") AnswerVO vo, @PathVariable int qno) throws Exception{
		answerService.updateAnswer(vo);
		return "redirect:/qna/{qno}";
	}
	
}
