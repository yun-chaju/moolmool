package com.wappl.moolmool.faq.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.wappl.moolmool.faq.service.FaqService;
import com.wappl.moolmool.faq.service.FaqTypeService;
import com.wappl.moolmool.faq.vo.FaqTypeVO;

@Controller
@RequestMapping("/admin/ftype")
public class FaqTypeController {

	@Autowired
	private FaqTypeService faqTypeService;
	@Autowired
	private FaqService faqService;

	@RequestMapping("")
	public String getFaqList(Model model) throws Exception {
		model.addAttribute("vo", faqTypeService.getFaqTypeList());
		return "admin/ftype";
	}

	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String insertFaq(FaqTypeVO vo) throws Exception {
		int faq = faqTypeService.insertFaqType(vo);
		if (faq >= 1) {
			return "redirect:/admin/ftype";
		} else {
			return "redirect:/admin/ftype";
		}
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String updateFaqType(FaqTypeVO vo) throws Exception {
		int ftype = faqTypeService.updateFaqType(vo);
		int faq = faqService.updateFname(vo);
		if (faq >= 1 && ftype >= 1) {
			return "redirect:/admin/ftype";
		} else {
			return "redirect:/admin/ftype";
		}
	}

	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String deleteFaqType(FaqTypeVO vo) throws Exception {
		int ftype = faqTypeService.deleteFaqType(vo);
		int faq = faqService.deleteFname(vo);
		if (faq >= 1 && ftype >= 1) {
			return "redirect:/admin/ftype";
		} else {
			return "redirect:/admin/ftype";
		}
	}
}
