package com.wappl.moolmool.address.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wappl.moolmool.address.service.AddressService;

@Controller
@RequestMapping("/address")
public class AddressController {
	
	@Autowired
	private AddressService svc;
	
	@RequestMapping("/gugun/{sido}")
	public @ResponseBody List<String> getGugunData(@PathVariable("sido") String sido) {
		return svc.getGugunList(sido);
	}
	
	@RequestMapping("/emd/{gugun}")
	public @ResponseBody List<String> getEmdData(@PathVariable("gugun") String gugun) {
		return svc.getEmdList(gugun);
	}
	
}
