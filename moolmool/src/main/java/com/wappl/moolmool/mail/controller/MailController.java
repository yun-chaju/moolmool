package com.wappl.moolmool.mail.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.wappl.moolmool.mail.vo.MailVO;
import com.wappl.moolmool.member.service.MemberService;

@Controller
@RequestMapping("admin/email")
public class MailController {
	@Autowired
	private EmailSender emailSender;
	@Autowired
	private MemberService ms;

	@RequestMapping("")
	public String emailForm(Model model) throws Exception {
		return "admin/emailForm";
	}

	@RequestMapping(value = "/part", method = RequestMethod.POST)
	public String sendEmailActionPart(Model model, MailVO vo) throws Exception {

		String[] list = vo.getMailList().split(", ");
		
		for (int i = 0; i < list.length; i++) {
			vo.setReciver(list[i]);
			emailSender.SendEmail(vo);
		}
		return "admin/emailForm";
	}

	@RequestMapping(value = "/all", method = RequestMethod.POST)
	public String sendEmailActionAll(Model model, MailVO vo) throws Exception {

		List<String> list = ms.getAllEmail();

		for (String a : list) {
			vo.setReciver(a);
			emailSender.SendEmail(vo);
		}
		return "/admin/emailForm";
	}
}
