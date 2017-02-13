package com.wappl.moolmool.notice.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.wappl.moolmool.common.util.MakeQueryUtil;
import com.wappl.moolmool.common.util.PagingUtil;
import com.wappl.moolmool.member.vo.MemberVO;
import com.wappl.moolmool.notice.service.NoticeService;
import com.wappl.moolmool.notice.vo.NoticeVO;

@Controller
public class NoticeController {

	@Autowired
	private NoticeService nSvc;
	
	//더미 데이터 용
	@RequestMapping("/notice/testN")
	public String noticeDataTest() throws Exception{
		NoticeVO nVo = new NoticeVO();
		for(int i = 0; i < 1000; i++){
			nVo.setTitle("공지사항 테스트 제목" + i);
			nVo.setContent("공지사항 테스트 내용" + i);
			nVo.setCategory("공지");
			nVo.setIsDeleted('N');
			nSvc.insertNotice(nVo);
		}
		return "redirect:list";
	}
	
	@RequestMapping("/notice/list")
	public String getNoticeList(@RequestParam(value="page", defaultValue="1") int page, Model model) throws Exception {
		model.addAttribute("noticeItemList", nSvc.getNoticeList(page))
		.addAttribute("pageInfo", new PagingUtil().getPageInfo(page, nSvc.getNoticeTotalCount()))
		.addAttribute("queryInfo", new MakeQueryUtil());
		return "notice/noticeList";
	}

	@RequestMapping(value = "notice/new", method = RequestMethod.GET)
	public String insertNoticeForm() {
		return "notice/noticeInsert";
	}

	@RequestMapping(value = "notice/new", method = RequestMethod.POST)
	public String insertNotice(NoticeVO nVo, Model model, HttpSession session) throws Exception {
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		if (loginUser.getId().equals("admin")) {
			nSvc.insertNotice(nVo);
		} else {
			//TODO 접근권한이 없습니다 나중에 작성
		}
		return "redirect:list";
	}
	
	@RequestMapping(value="notice/{nNo}/edit", method=RequestMethod.GET)
	public String updateNoticeForm(@PathVariable int nNo, Model model) throws Exception{
		model.addAttribute("noticeDetail", nSvc.getNoticeOne(nNo));
		return "notice/noticeUpdate"; 
	}
	
	@RequestMapping(value="notice/{nNo}/edit", method=RequestMethod.PUT)
	public String updateNotice(@PathVariable int nNo, NoticeVO nVo) throws Exception{
		nVo.setnNo(nNo);
		nSvc.updateNotice(nVo);
		return "redirect:/notice/list";
	}
	
	@RequestMapping(value = "notice/{nNo}", method = RequestMethod.DELETE)
	public String deleteNotice(@PathVariable int nNo, Model model) throws Exception{
		nSvc.deleteNotice(nNo);
		return "redirect:/notice/list";
	}

}
