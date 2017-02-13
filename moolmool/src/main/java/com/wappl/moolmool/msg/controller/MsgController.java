package com.wappl.moolmool.msg.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.wappl.moolmool.common.util.MakeQueryUtil;
import com.wappl.moolmool.common.util.PagingUtil;
import com.wappl.moolmool.member.service.MemberService;
import com.wappl.moolmool.member.vo.MemberVO;
import com.wappl.moolmool.msg.service.MsgService;
import com.wappl.moolmool.msg.vo.MsgVO;

@Controller
public class MsgController {

	@Autowired
	private MsgService service;
	@Autowired
	private MemberService s;

	@RequestMapping(value = "mypage/list/receive")
	public String getMsgList(@RequestParam(value="page", defaultValue = "1") int page, 
									Model model, HttpSession session) throws Exception {
		MemberVO member = (MemberVO)session.getAttribute("loginUser");
		
		System.out.println("여기옴");
		
		Map<String, Object> map = new HashMap<>();
		map.put("no", member.getMemNo());
		map.put("page", page);
		map.put("mtype", "a");
		map.put("receive", "receive");
		map.put("send", "send");
		
		model.addAttribute("msgList", service.getMsgList(map))
		.addAttribute("count", service.getNotOpendMsgCount(member.getMemNo()))
		.addAttribute("pageInfo", new PagingUtil().getPageInfo(page, service.getMsgCount(map)))
		.addAttribute("queryInfo", new MakeQueryUtil())
		.addAttribute("check", member.getId());

		return "mypage/list";
	}
	
	@RequestMapping(value = "mypage/list/send")
	public String getMsgListByType(
						@RequestParam(value="page", defaultValue = "1") int page, Model model, HttpSession session ) throws Exception {
		MemberVO member = (MemberVO)session.getAttribute("loginUser");
		
		Map<String, Object> map = new HashMap<>();
		map.put("no", member.getMemNo());
		map.put("page", page);
		/*if (type.equals("send")) {*/
		map.put("mtype", "s");
		System.out.println(service.getMsgList(map));
		model.addAttribute("msgList", service.getMsgList(map))
		.addAttribute("count", service.getNotOpendMsgCount(member.getMemNo()))
		.addAttribute("pageInfo", new PagingUtil().getPageInfo(page, service.getMsgCount(map)))
		.addAttribute("queryInfo", new MakeQueryUtil());
		return "mypage/list";
	}
	
	@RequestMapping(value = {"mypage/{mno:[0-9]*}","mypage/list/{mno:[0-9]*}"})
	public String getMsgDetail(@PathVariable int mno, HttpSession session, Model model) throws Exception {
		MemberVO member = (MemberVO)session.getAttribute("loginUser");
		MsgVO vo = new MsgVO();
		vo.setMno(mno);
		MsgVO msg1  = service.getMsgDetail(vo);
		if(msg1.getSno() != member.getMemNo()){
			int result = service.updateOpen(vo);
			if(result > 0){
				MsgVO msg = service.getMsgDetail(vo);
				model.addAttribute("msg", msg)
				.addAttribute("check", member.getMemNo());
			}
		}
		model.addAttribute("msg", msg1)
		.addAttribute("check", member.getMemNo());
		
		
		return "mypage/detail";
	}

	@RequestMapping(value = "mypage/list/insert",method= RequestMethod.POST)
	public String insertMsg(MsgVO vo, HttpSession session, Model model, RedirectAttributes attr) throws Exception {
		MemberVO member = (MemberVO)session.getAttribute("loginUser");
		try {
			
			if ((s.getMsgUser(vo.getRnick()) != member.getMemNo()) && (s.getMsgUser(vo.getRnick()) > 0)) {
				vo.setSno(member.getMemNo());
				vo.setRno((s.getMsgUser(vo.getRnick())));
				service.insertMsg(vo);
				return "redirect:receive";
			} else { 
				attr.addFlashAttribute("msg","본인에게 메세지를 전송할 수 없습니다.");
				return "redirect:insert";
			}
		} catch (NullPointerException e) {
			attr.addFlashAttribute("msg","존재하지 않는 닉네임입니다.");
			return "redirect:insert";
		}
		//본인에게 보낼 경우
	}
	
	@RequestMapping("message/insert")
	public String insertMessageForm(HttpSession session, Model model, String nickname) throws Exception {
		MemberVO member = (MemberVO)session.getAttribute("loginUser");
		model.addAttribute("sender", member.getNickName());
		model.addAttribute("formType", "message");
		model.addAttribute("receiver", nickname);
		return "message/form";
	}
	
	@RequestMapping(value="message/insert", method= RequestMethod.POST)
	public @ResponseBody String insertMessage(String no, MsgVO vo, HttpSession session, Model model, RedirectAttributes attr) throws Exception {
		MemberVO member = (MemberVO)session.getAttribute("loginUser");
		vo.setSno(member.getMemNo());
		vo.setRno(Integer.parseInt(no));
		System.out.println(vo);
		service.insertMessage(vo);
		return "<script>window.close();</script>";
	}
	
	@RequestMapping(value = "mypage/list/insert")
	public String insertMsgForm(HttpSession session, Model model) throws Exception {
		MemberVO member = (MemberVO)session.getAttribute("loginUser");
		model.addAttribute("sender", member.getNickName());
		model.addAttribute("formType", "message");
		
		return "mypage/form";
	}
	
	@RequestMapping(value="mypage/list/{mno:[0-9]*}/reply/{snick}")
	public String insertReplyForm(@PathVariable String snick,
			@PathVariable int mno, Model model) throws Exception {
		model.addAttribute("receiver", snick);
		model.addAttribute("formType", "reply");
		
		return "mypage/form";
	}
	
	@RequestMapping(value="mypage/list/{mno:[0-9]*}/reply", method= RequestMethod.POST)
	public String insertReply(@PathVariable int mno,  HttpServletRequest request,
		MsgVO vo, HttpSession session) throws Exception {
		MemberVO member = (MemberVO)session.getAttribute("loginUser");
		vo.setMno(mno);
		vo.setSno(member.getMemNo());
		vo.setRno(s.getMsgUser(vo.getRnick()));
		service.insertMsg(vo);
		
		return "redirect:/mypage/list/{mno}";
	}
	
	@RequestMapping(value="mypage/list/{mno:[0-9]*}", method=RequestMethod.DELETE)
	public String deleteBoard(@PathVariable int mno, HttpSession session) throws Exception {
		MemberVO member = (MemberVO)session.getAttribute("loginUser");
		MsgVO vo = new MsgVO();
		vo.setMno(mno);
		MsgVO check = service.getMsgDetail(vo);
		System.out.println(check.toString());
		System.out.println(vo.toString());
		if(member.getMemNo()!=check.getSno()){	// 2 1
			vo.setRno(check.getRno());
		} else {
			vo.setSno(check.getSno()); // 2 2
		}
		service.deleteMsg(vo);
		return "redirect:receive";
	}
	
	@RequestMapping(value="mypage/list/delete")
	public String deleteChecked(@RequestParam(value="array[]") List<Integer> list, HttpSession session) throws Exception {
		MemberVO member = (MemberVO)session.getAttribute("loginUser");
		Map<String, Integer> nos = new HashMap<>();
		for(int i = 0 ; i < list.size() ; i++){
			MsgVO vo = new MsgVO();
			vo.setMno(list.get(i));
			MsgVO check = service.getMsgDetail(vo);
			if(member.getMemNo()!=check.getSno()){
				nos.put("rno", check.getRno());
			} else {
				nos.put("rno", 0);
			}
		}
		System.out.println("list : " + list);
		System.out.println("nos : "+ nos);
		Map<String, Object> map = new HashMap<>(); 
		map.put("list", list);
		map.put("nos", nos);
				
		service.deleteMsg(map);
		return "redirect:receive";
	}
		
}
