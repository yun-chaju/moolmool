package com.wappl.moolmool.mypage.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wappl.moolmool.board.service.BoardTypeService;
import com.wappl.moolmool.board.vo.BoardTypeVO;
import com.wappl.moolmool.common.util.PagingUtil;
import com.wappl.moolmool.common.util.SearchUtil;
import com.wappl.moolmool.member.vo.MemberVO;
import com.wappl.moolmool.mypage.service.MypageService;

@Controller
public class MypageController {
	
	@Autowired
	private MypageService ms;
	@Autowired
	private BoardTypeService bt;

	@RequestMapping("/mypage")
	public String index(Model model, HttpSession se) {
		MemberVO vo = (MemberVO) se.getAttribute("loginUser");
		model.addAttribute("log", ms.getPointLog(vo.getMemNo()));
		return "mypage/index";
	}
	
	@RequestMapping("/mypage/myBoard")
	public String myBoard() {
		return "mypage/myBoard";
	}
	
	@ResponseBody
	@RequestMapping("/mypage/btype")
	public List<BoardTypeVO> getBoardTypeList() throws Exception {
		return bt.getBoardTypeList();
	}
	
	@ResponseBody
	@RequestMapping("/mypage/{btCode}/{memNo}")
	public Map<String, Object> getBoardList(@PathVariable String btCode, @RequestParam(value="page", defaultValue = "1") int page,
		SearchUtil searchInfo, @PathVariable int memNo) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		if(btCode.equals("all")){
			map.put("pageInfo", new PagingUtil().getPageInfo(page, ms.getBoardTotalCount(searchInfo, memNo)));
			map.put("boardList", ms.getBoardAllList(page, searchInfo, memNo));
			System.out.println(map.toString());
			return map;
		} else {
			map.put("pageInfo", new PagingUtil().getPageInfo(page, ms.getBoardTotalCount(btCode, searchInfo, memNo)));
			map.put("boardList", ms.getBoardList(btCode, page, searchInfo, memNo));
			return map;			
		}
	}
	
	/*@RequestMapping("/mypage/{memNo}")
	public String getPointLog(@PathVariable int memNo, Model model){
		System.out.println(memNo);
		model.addAttribute("log", ms.getPointLog(memNo));
		return "mypage/index";	
	}*/

}
