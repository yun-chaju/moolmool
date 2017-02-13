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

import com.wappl.moolmool.common.util.MakeQueryUtil;
import com.wappl.moolmool.common.util.PagingUtil;
import com.wappl.moolmool.common.util.SearchUtil;
import com.wappl.moolmool.member.vo.MemberVO;
import com.wappl.moolmool.qna.service.AnswerService;
import com.wappl.moolmool.qna.service.QuestionService;
import com.wappl.moolmool.qna.vo.QuestionVO;

@Controller
public class QuestionController {

	@Autowired
	private QuestionService questionService;
	@Autowired
	private AnswerService answerService;
	

	@RequestMapping("qna/list")
	public String getQuestionList(@RequestParam(value="page", defaultValue="1") int page, SearchUtil searchInfo, Model model) throws Exception{
		model.addAttribute("questionList", questionService.getQuestionList(searchInfo, page))
				.addAttribute("pageInfo", new PagingUtil().getPageInfo(page, questionService.getQuestionTotalCount(searchInfo)))
				.addAttribute("queryInfo", new MakeQueryUtil());
		return "qna/questionList";
	}
	
	@RequestMapping(value="qna/{qno:[0-9]*}", method=RequestMethod.GET)
	public String getQuestionDetail(@PathVariable int qno, Model model, HttpSession session) throws Exception{
		model.addAttribute("qnaArticle", questionService.getQuestionDetail(qno))
				.addAttribute("answerVO", answerService.getAnswer(qno))
				.addAttribute("loginUser", (MemberVO)session.getAttribute("loginUser"));
		return "qna/questionDetail";
	}
	
	@RequestMapping(value="qna/new", method=RequestMethod.GET)
	public String insertQuestionForm(){
		
		return "qna/questionInsert";
	}
	
	@RequestMapping(value="qna/new", method=RequestMethod.POST)
	public String insertQuestion(QuestionVO vo, Model model, HttpSession session) throws Exception{
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
		vo.setWriterNo(loginUser.getMemNo());
		vo.setWriterNickname(loginUser.getNickName());
		questionService.insertQuestion(vo);
		
		return "redirect:list";
	}
	
	@RequestMapping(value="qna/{qno:[0-9]*}", method=RequestMethod.DELETE)
	public String deleteQuestion(@PathVariable int qno, HttpSession session) throws Exception{
		MemberVO loginMember = (MemberVO) session.getAttribute("loginUser");
		if(loginMember.getMemNo() == questionService.getQuestionDetail(qno).getWriterNo())
			questionService.deleteQuestion(qno);
		return "redirect:list";
	}
	
	@RequestMapping(value="qna/{qno:[0-9]*}/edit", method=RequestMethod.GET)
	public String updateQuestionForm(@PathVariable int qno, Model model) throws Exception{
		model.addAttribute("questionVO", questionService.getQuestionDetail(qno));
		return "qna/questionUpdate";
	}
	
	@RequestMapping(value="qna/{qno:[0-9]*}/edit", method=RequestMethod.PUT)
	public String updateQuestion(@ModelAttribute("questionVO") QuestionVO vo) throws Exception{
		questionService.updateQuestion(vo);;
		return "redirect:/qna/{qno}";
	}
	
	
}
