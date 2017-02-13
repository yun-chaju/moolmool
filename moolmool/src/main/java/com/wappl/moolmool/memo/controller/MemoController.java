package com.wappl.moolmool.memo.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.wappl.moolmool.member.vo.MemberVO;
import com.wappl.moolmool.memo.service.MemoService;
import com.wappl.moolmool.memo.vo.MemoVO;

@RestController
public class MemoController {
	
	@Autowired
	private MemoService svc;
	
	@RequestMapping(value="/memo/{targetNo:[0-9]*}", method=RequestMethod.GET)
	public MemoVO getMemoDetail(
			@PathVariable("targetNo") int targetNo,
			HttpSession session) {
		MemberVO loginMember = (MemberVO) session.getAttribute("loginUser");
		MemoVO vo = new MemoVO();
		vo.setWriterNo(loginMember.getMemNo())
			.setTargetNo(targetNo);
		return svc.getMemoDetail(vo);
	}
	
	@RequestMapping(value="/memo/{targetNo:[0-9]*}/new", method=RequestMethod.POST)
	public void insertMemo(
			@PathVariable("targetNo") int targetNo,
			HttpSession session,
			@RequestBody MemoVO vo) {
		MemberVO loginMember = (MemberVO) session.getAttribute("loginUser");
		vo.setWriterNo(loginMember.getMemNo())
			.setTargetNo(targetNo);
		svc.insertMemo(vo);
	}

	@RequestMapping(value="/memo/{targetNo:[0-9]*}", method=RequestMethod.PUT)
	public void updateMemo(
			@PathVariable("targetNo") int targetNo,
			HttpSession session,
			@RequestBody MemoVO vo) {
		MemberVO loginMember = (MemberVO) session.getAttribute("loginUser");
		vo.setWriterNo(loginMember.getMemNo())
			.setTargetNo(targetNo);
		svc.updateMemo(vo);
	}
	
	@RequestMapping(value="/memo/{targetNo:[0-9]*}", method=RequestMethod.DELETE)
	public void deleteMemo(
			@PathVariable("targetNo") int targetNo,
			HttpSession session) {
		MemberVO loginMember = (MemberVO) session.getAttribute("loginUser");
		MemoVO vo = new MemoVO();
		vo.setWriterNo(loginMember.getMemNo())
			.setTargetNo(targetNo);
		svc.deleteMemo(vo);
	}

}
