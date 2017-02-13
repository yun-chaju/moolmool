package com.wappl.moolmool.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wappl.moolmool.admin.service.AdminService;
import com.wappl.moolmool.board.service.BoardCommentService;
import com.wappl.moolmool.board.service.BoardService;
import com.wappl.moolmool.board.service.BoardTypeService;
import com.wappl.moolmool.board.vo.BoardTypeVO;
import com.wappl.moolmool.board.vo.BoardVO;
import com.wappl.moolmool.common.util.MakeQueryUtil;
import com.wappl.moolmool.common.util.PagingUtil;
import com.wappl.moolmool.common.util.SearchUtil;
import com.wappl.moolmool.member.vo.MemberVO;
import com.wappl.moolmool.trade.service.TradeService;

@RequestMapping("/admin")
@Controller
public class AdminController {
	
	@Autowired private AdminService adminService;
	@Autowired private BoardTypeService boardTypeService;
	@Autowired private BoardService boardService;
	@Autowired private BoardCommentService boardCommentService;
	@Autowired private TradeService tradeService;

	@RequestMapping("")
	public String index(Model model) throws Exception {
		model.addAttribute("totalMember", adminService.getMemberCount())
			.addAttribute("totalComplete", adminService.getTradeCompleteCount())
			.addAttribute("totalStay", adminService.getTradeStayCount())
			.addAttribute("totalProcessing", adminService.getTradeProcessingCount());
		return "admin/index";
	}
	
	@RequestMapping(value="/members", method=RequestMethod.GET)
	public String getMemberList(Model model, @RequestParam(value="page", defaultValue = "1") int page,
			SearchUtil searchInfo) throws Exception {
		model.addAttribute("memberList", adminService.getMemberList(page, searchInfo))
				.addAttribute("pageInfo", new PagingUtil().getPageInfo(page, adminService.getMemberAllCount()))
				.addAttribute("queryInfo", new MakeQueryUtil());
		return "admin/members";
	}
	
	@RequestMapping(value="/members/{memNo:[0-9]*}", method=RequestMethod.PUT)
	public String updateMember(@ModelAttribute("memberVO") MemberVO vo) throws Exception {
		adminService.updateMember(vo);
		return "admin/index";
	}
	
	@RequestMapping(value="/members/{memNo:[0-9]*}", method=RequestMethod.DELETE)
	public String deleteMember(@PathVariable int memNo) throws Exception{
		adminService.deleteMember(memNo);
		return "redirect:/admin/members";
	}
	
	@RequestMapping(value="/boards", method=RequestMethod.GET)
	public String getBoardList(Model model) throws Exception {
		return "admin/boards";
	}
	
	@ResponseBody
	@RequestMapping("/boards/btype")
	public List<BoardTypeVO> getBoardTypeList() throws Exception {
		return boardTypeService.getBoardTypeList();
	}
	
	@ResponseBody
	@RequestMapping("/boards/{btCode}")
	public Map<String, Object> getBoardList(@PathVariable String btCode, @RequestParam(value="page", defaultValue = "1") int page,
		SearchUtil searchInfo) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		if(btCode.equals("all")){
			map.put("pageInfo", new PagingUtil().getPageInfo(page, adminService.getBoardTotalCount(searchInfo)));
			map.put("boardList", adminService.getBoardAllList(page, searchInfo));
			return map;
		} else {
			map.put("pageInfo", new PagingUtil().getPageInfo(page, boardService.getBoardTotalCount(btCode, searchInfo)));
			map.put("boardList", boardService.getBoardList(btCode, page, searchInfo));
			return map;			
		}
	}
	
	@RequestMapping(value="/boards/{btCode}/{bno:[0-9]*}", method=RequestMethod.GET)
	public String getBoardDetail(@PathVariable int bno, Model model, @RequestParam(value="cpage", defaultValue = "1") int cpage) throws Exception {
		BoardVO board = adminService.getBoardDetail(bno);
		List<BoardTypeVO> bList = boardTypeService.getBoardTypeList();
		String bTypeName = "";
		for(BoardTypeVO btype : bList){
			if(btype.getBtCode().equals(board.getBtCode()))
				bTypeName = btype.getBtName();
		}
		model.addAttribute("boardArticle", adminService.getBoardDetail(bno))
			.addAttribute("bTypeName", bTypeName)
			.addAttribute("prevNextInfo", boardService.getPrevAndNextTitle(bno))
			.addAttribute("commentList", boardCommentService.getBoardCommentList(bno, cpage))
			.addAttribute("pageInfo", 
				new PagingUtil().getPageInfo(cpage, boardCommentService.getBoardCommentCount(bno)))
			.addAttribute("queryInfo", new MakeQueryUtil());
		return "admin/boardDetail";
	}
	
	@RequestMapping(value="boards/{btCode}/{bno:[0-9]*}", method=RequestMethod.DELETE)
	public String deleteBoard(@PathVariable int bno) throws Exception {
		adminService.deleteBoard(bno);
		return "redirect:/admin/boards";
	}
	
	@RequestMapping(value="/members/update/{memNo:[0-9]*}", method=RequestMethod.GET)
	public String updateMemberForm(@PathVariable int memNo, Model model) throws Exception {
		model.addAttribute("memberVO", adminService.getMember(memNo));
		return "admin/memberUpdate";
	}
	
}
