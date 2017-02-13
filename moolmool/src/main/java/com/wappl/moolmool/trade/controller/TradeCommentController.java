package com.wappl.moolmool.trade.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.wappl.moolmool.member.vo.MemberVO;
import com.wappl.moolmool.trade.service.TradeCommentService;
import com.wappl.moolmool.trade.vo.TradeCommentVO;

@Controller
@RequestMapping("/tradeCmt")
public class TradeCommentController {
	
	@Autowired
	private TradeCommentService tcSvc;
	
	@RequestMapping("/new")
	public String insertTradeComment(TradeCommentVO vo, HttpSession session) {
		MemberVO loginMember = (MemberVO) session.getAttribute("loginUser");
		vo.setWriterUno(loginMember.getMemNo());
		vo.setWriterNickname(loginMember.getNickName());
		vo.setAlink("");
		tcSvc.insertTradeComment(vo);
		return "redirect:../trade/" + vo.getTno();
	}
	
	@RequestMapping(value="/{tcno:[0-9]*}", method=RequestMethod.DELETE)
	public String deleteTradeComment(@PathVariable int tcno, String tno) {
		tcSvc.deleteTradeComment(tcno);
		return "redirect:../trade/" + tno;
	}
	

}
