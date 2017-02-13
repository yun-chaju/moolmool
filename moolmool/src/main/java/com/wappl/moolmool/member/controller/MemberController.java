package com.wappl.moolmool.member.controller;

import java.util.Random;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.wappl.moolmool.mail.controller.EmailSender;
import com.wappl.moolmool.mail.vo.MailVO;
import com.wappl.moolmool.member.service.MemberService;
import com.wappl.moolmool.member.vo.MemberVO;

@Controller
public class MemberController {

	@Autowired
	private MemberService ms;
	
	@Autowired
	private EmailSender emailSender;
	
	@RequestMapping(value="member/memberLogin", method=RequestMethod.GET)
	public String loginForm(MemberVO vo,@CookieValue(value="REMEMBER",required=false) Cookie rCookie) {
		return "member/memberLogin";
	}
	
	@RequestMapping(value="member/memberLogin", method=RequestMethod.POST)
	public String loginCheck(MemberVO mvo, HttpSession session, RedirectAttributes rattr,HttpServletResponse response) {
		
		MemberVO member = ms.loginCheck(mvo);
		
		if(member != null) {
			session.setAttribute("loginUser", member);
			
			Cookie rememberCookie = new Cookie("REMEMBER", mvo.getId());
			rememberCookie.setPath("/");
			if(mvo.isRememberId()){
				rememberCookie.setMaxAge(60*60*24*30);
			}else{
				rememberCookie.setMaxAge(0);
			}
			response.addCookie(rememberCookie);
			
			return "redirect:/";
			
		} else {
			
			rattr.addFlashAttribute("msg", "로그인 실패");
			return "redirect:memberLogin";
		}
	}
	
	@RequestMapping(value="member/logout", method=RequestMethod.GET)
	public String logout(HttpSession session){
		if(session != null) {
			session.invalidate();
		}
		return "redirect:/";
	}
	
	@RequestMapping(value="member/join", method=RequestMethod.GET)
	public String insertMemberForm(@ModelAttribute("memberVO") MemberVO vo){
		return "member/memberJoin";
	}
	
	@RequestMapping(value="member/join", method=RequestMethod.POST)
	public String insertMember(@Valid @ModelAttribute("memberVO") MemberVO vo,
			BindingResult bindingResult){
		if(bindingResult.hasErrors()){
			return "member/memberJoin";
		}
		ms.insertMember(vo);
		return "redirect:/";
	}
	
	@RequestMapping(value="member/leave", method=RequestMethod.GET)
	public String deleteMemberForm(){
		return "member/memberLeave";
	}
	
	@RequestMapping(value="member/leave", method=RequestMethod.POST)
	public String deleteMember(@ModelAttribute MemberVO vo){
		MemberVO member = ms.loginCheck(vo);
		if(member != null){
			ms.deleteMember(member);
			return "redirect:logout";
		} else {
			return "redirect:leave";
		}
	}
	
	@RequestMapping(value="member/update", method=RequestMethod.GET)
	public String updateMemberForm(Model model, HttpSession session) {
		model.addAttribute("memberVO",session.getAttribute("loginUser"));
		return "member/memberUpdate";
	}
	
	@RequestMapping(value="member/update", method=RequestMethod.POST)
	public String updateMember(@Valid @ModelAttribute("memberVO") MemberVO mvo,
			BindingResult bindingResult,
			HttpSession session, Model model){
		if(bindingResult.hasErrors()) {
			return "member/memberUpdate";
		} else {
			MemberVO loginMember =(MemberVO)session.getAttribute("loginUser");
			mvo.setMemNo(loginMember.getMemNo())
			   .setRoleCode(loginMember.getRoleCode())
			   .setRegdate(loginMember.getRegdate());
			ms.updateMember(mvo);
			session.setAttribute("loginUser", mvo);
			return "redirect:/";
		}
	}
	
	@RequestMapping(value="member/find", method=RequestMethod.GET)
	public String memberFindForm(){
		return "member/memberFind";
	}
	
	@ResponseBody
	@RequestMapping(value="member/authMailId", method=RequestMethod.POST, produces = "application/text; charset=utf8")
	public String authMailId(@RequestParam("name") String name,
			@RequestParam("email") String email) throws Exception{
		Random random = new Random();
	
		if(name.equals(ms.getName(email)))
		{   	
			int result = random.nextInt(1000000)+100000;
			 
			if(result>1000000)
			    result = result - 100000;
		
			ms.updateAuthNo(result,email);
			
			MailVO mail = new MailVO();
			mail.setContent("인증번호는 "+result+" 입니다.");
			mail.setReciver(email);
			mail.setSubject(name+"님 비밀번호 찾기 메일입니다.");
	        emailSender.SendEmail(mail);
	        
	        return "이메일을 확인하세요.";
		}else{
			return "이름과 이메일이 일치하지 않거나 이메일 형식이 이상합니다.";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="member/authMailPwd", method=RequestMethod.POST, produces = "application/text; charset=utf8")
	public String authMailPwd(@RequestParam("name") String name,
			@RequestParam("email") String email,
			@RequestParam("id") String id) throws Exception{
		Random random = new Random();
		int count = 1;
	
		if(name.equals(ms.getName(email)) && count==ms.idCheck(id))
		{   	
			int result = random.nextInt(1000000)+100000;
			 
			if(result>1000000)
			    result = result - 100000;
		
			ms.updateAuthNo(result,email);
			
			MailVO mail = new MailVO();
			mail.setContent("인증번호는 "+result+" 입니다.");
			mail.setReciver(email);
			mail.setSubject(name+"님 비밀번호 찾기 메일입니다.");
	        emailSender.SendEmail(mail);
	        
	        return "이메일을 확인하세요.";
		}else{
			return "이름과 이메일이 일치하지 않거나 이메일 형식이 이상합니다.";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="member/authCheckId", method=RequestMethod.POST, produces = "application/text; charset=utf8")
	public String authCheckId(@RequestParam("authNo") int authNo){
		MemberVO mvo = ms.authCheck(authNo);
	
		if(mvo!=null){
				return "아이디 : "+mvo.getId();
		}else{
			return "인증번호가 다릅니다.";
		}
	}

	@ResponseBody
	@RequestMapping(value="member/authCheckPwd", method=RequestMethod.POST, produces = "application/text; charset=utf8")
	public String authCheckPwd(@RequestParam("authNo") int authNo){
		MemberVO mvo = ms.authCheck(authNo);
		if(mvo!=null){
			return "암호 : "+mvo.getPassword();
		}else{
			return "인증번호가 다릅니다.";
		}
	}

	@ResponseBody
	@RequestMapping(value="member/idCheck", method=RequestMethod.POST)
	public String idCheck(@RequestParam String id){
		int count = ms.idCheck(id.toLowerCase());
		if(count==1){
			return "false";
		}else{
			return "true";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="member/nickNameCheck", method=RequestMethod.POST)
	public String nickNameCheck(@RequestParam String nickName){
		int count = ms.nickNameCheck(nickName);
		if(count==1){
			return "false";
		}else{
			return "true";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="member/emailCheck", method=RequestMethod.POST)
	public String emailCheck(@RequestParam String email){
		int count = ms.emailCheck(email);
		if(count==1){
			return "false";
		}else{
			return "true";
		}
	}
}