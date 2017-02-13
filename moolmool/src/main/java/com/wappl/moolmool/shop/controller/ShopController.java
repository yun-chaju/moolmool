package com.wappl.moolmool.shop.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wappl.moolmool.common.util.PagingUtil;
import com.wappl.moolmool.member.service.MemberService;
import com.wappl.moolmool.member.vo.MemberVO;
import com.wappl.moolmool.shop.service.PersonaconService;
import com.wappl.moolmool.shop.service.ShopItemService;
import com.wappl.moolmool.shop.vo.PersonaconOrderHistoryVO;

@Controller
@RequestMapping("/shop")
public class ShopController {
	
	@Autowired private PersonaconService pSvc;
	@Autowired private ShopItemService iSvc;
	@Autowired private MemberService mSvc;

	@RequestMapping("")
	public String index() {
		//return "shop/index";
		return "redirect:/shop/personacon";
	}
	
	@RequestMapping("/personacon")
	public String getPersonaconList(@RequestParam(value="page", defaultValue="1") int page, 
			Model model, HttpSession session) {
		MemberVO loginMember = (MemberVO) session.getAttribute("loginUser");
		if(loginMember != null) {
			model.addAttribute("pList", pSvc.getPersonaconList(loginMember.getMemNo(), page))
				.addAttribute("memberPoint", mSvc.getMemberPoint(loginMember.getMemNo()));
		} else {
			model.addAttribute("pList", pSvc.getPersonaconList(0, page));
		}
		model.addAttribute("pageInfo", new PagingUtil().setPerPage(12).getPageInfo(page, pSvc.getPersonaconTotalCount()));
		return "shop/personacon";
	}
	
	@RequestMapping("/item")
	public String getShopItemList(Model model, HttpSession session) {
		MemberVO loginMember = (MemberVO) session.getAttribute("loginUser");
		if(loginMember != null) {
			model.addAttribute("iList", iSvc.getShopItemList(loginMember.getMemNo()))
				.addAttribute("memberPoint", mSvc.getMemberPoint(loginMember.getMemNo()));
		} else {
			model.addAttribute("iList", iSvc.getShopItemList(0));
		}		
		return "shop/item";
	}
	
	@RequestMapping("/personacon/order/{pscNo:[0-9]*}")
	public String insertOrderPersonacon(@RequestParam(value="page", defaultValue="1") int page, @PathVariable("pscNo") int pscNo, HttpSession session) {
		MemberVO loginMember = (MemberVO) session.getAttribute("loginUser");
		PersonaconOrderHistoryVO vo = new PersonaconOrderHistoryVO()
				.setPscNo(pscNo)
				.setMemNo(loginMember.getMemNo());
		pSvc.insertOrderPersonacon(vo);
		return "redirect:/shop/personacon?page=" + page;
	}
	
	@RequestMapping("/personacon/use/{pscNo:[0-9]*}")
	public @ResponseBody void updateMemberPersonacon(@PathVariable("pscNo") int pscNo, HttpSession session) {
		MemberVO loginMember = (MemberVO) session.getAttribute("loginUser");
		int result = pSvc.updateMemberPersonacon(pscNo, loginMember.getMemNo());
		if(result > 0) {
			loginMember.setPscCode(pscNo);
			loginMember.setPscUrl(pSvc.getPersonaconDetail(pscNo).getHtmlTag());
		}
		session.setAttribute("loginUser", loginMember);
	}
	
	@RequestMapping("/item/order/{itemNo:[0-9]*}") // 수정 필요
	public String insertOrderItem(@PathVariable("itemNo") int itemNo, 
			String nickname, HttpSession session) {
		MemberVO loginMember = (MemberVO) session.getAttribute("loginUser");
		int result = 0;
		if(itemNo == 1) { //닉네임 교환권
			result = iSvc.updateMemberNickname(nickname, loginMember.getMemNo());
		}
		if(result > 0) {
			loginMember.setNickName(nickname);
		}
		return "redirect:/shop/item";
	}
	
	
}
