package com.wappl.moolmool.faq.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.support.SessionStatus;

import com.wappl.moolmool.faq.service.FaqService;
import com.wappl.moolmool.faq.service.FaqTypeService;
import com.wappl.moolmool.faq.vo.FaqVO;

@Controller
@RequestMapping("/faq")
public class FaqController {

	@Autowired
	private FaqService faqService;
	@Autowired
	private FaqTypeService faqTypeService;

	@RequestMapping("")
	public String getFaqAllList(Model model) throws Exception {
		String fname = "전체보기";
		model.addAttribute("type", faqTypeService.getFaqTypeList())
				.addAttribute("vo",  faqService.getFaqAllList())
				.addAttribute("fname", fname);
		return "faq/FaqList";
	}
	
	@RequestMapping(value = "/{fname}", method = RequestMethod.GET)
	public String getFaqList(@PathVariable String fname, Model model) throws Exception {
		model.addAttribute("type", faqTypeService.getFaqTypeList())
				.addAttribute("vo", faqService.getFaqList(fname))
				.addAttribute("fname", fname);
		return "faq/FaqList";
	}

	@RequestMapping(value = "/{fname}/{fno:[0-9]*}", method = RequestMethod.GET)
	public String getFaqDetail(@PathVariable int fno, Model model) throws Exception {
		model.addAttribute("vo", faqService.getFaqDetail(fno));
		return "faq/FaqDetail";
	}

	@RequestMapping(value = "/{fname}/{fno:[0-9]*}/edit", method = RequestMethod.GET)
	public String updateForm(@PathVariable int fno, Model model) throws Exception {
		model.addAttribute("vo", faqService.getFaqDetail(fno));
		return "faq/FaqUpdate";
	}

	@RequestMapping(value = "/{fname}/{fno:[0-9]*}/edit", method = RequestMethod.PUT)
	public String updateFaq(@ModelAttribute("vo") FaqVO vo, @PathVariable int fno, SessionStatus sessionStatus,
			HttpServletRequest request) throws Exception {
		vo.setfNo(fno);
		faqService.updateFaq(vo);
		sessionStatus.isComplete();
		return "redirect:/faq/";
	}

	@RequestMapping(value = "/{fname}/new", method = RequestMethod.GET)
	public String insertForm(Model model) throws Exception {
		model.addAttribute("vo", faqTypeService.getFaqTypeList());
		return "faq/FaqForm";
	}

	@RequestMapping(value = "/{fname}/new", method = RequestMethod.POST)
	public String insertFaq(@PathVariable String fname, FaqVO vo) throws Exception {
		vo.setfName(fname);
		int faq = faqService.insertFaq(vo);
		if (faq >= 1) {
			return "redirect:/faq/{fname}";
		} else {
			return "redirect:/faq/{fname}";
		}
	}

	@RequestMapping(value = "/{fname}/{fno}", method = RequestMethod.GET)
	public String deleteFaq(@PathVariable int fno, Model model) throws Exception {
		int faq = faqService.deleteFaq(fno);
		if (faq >= 1) {
			return "redirect:/faq";
		} else {
			return "redirect:/faq";
		}
	}
}
