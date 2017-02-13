package com.wappl.moolmool.board.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.wappl.moolmool.board.service.BoardCommentService;
import com.wappl.moolmool.board.service.BoardEvaluateService;
import com.wappl.moolmool.board.service.BoardReportService;
import com.wappl.moolmool.board.service.BoardService;
import com.wappl.moolmool.board.service.BoardTypeService;
import com.wappl.moolmool.board.vo.BoardCommentVO;
import com.wappl.moolmool.board.vo.BoardEvaluateVO;
import com.wappl.moolmool.board.vo.BoardReportVO;
import com.wappl.moolmool.board.vo.BoardTypeVO;
import com.wappl.moolmool.board.vo.BoardVO;
import com.wappl.moolmool.common.util.MakeQueryUtil;
import com.wappl.moolmool.common.util.PagingUtil;
import com.wappl.moolmool.common.util.SearchUtil;
import com.wappl.moolmool.member.vo.MemberVO;


@Controller
@RequestMapping("/board")
@SessionAttributes("boardVO")
public class BoardController {

	@Autowired private BoardService bSvc;
	@Autowired private BoardTypeService tSvc;
	@Autowired private BoardCommentService cSvc;
	@Autowired private BoardReportService rSvc;
	@Autowired private BoardEvaluateService eSvc;
	
	@RequestMapping("")
	public String BoardMain(Model model) {
		List<BoardTypeVO> bList = tSvc.getBoardTypeList();
		List<BoardVO> boardList = bSvc.getBoardMainList(bList);
		bList.add(0, new BoardTypeVO()
				.setBtCode("new").setBtName("최신글").setDescription("최신글"));
		model.addAttribute("btypeList", bList)
				.addAttribute("boardList", boardList);
		return "board/index";
	}
	
	@RequestMapping(value="/{btCode}/{bno:[0-9]*}", method=RequestMethod.GET)
	public String getBoardDetail(@PathVariable int bno, Model model, 
				@RequestParam(value="cpage", defaultValue = "1") int cpage) {
		model.addAttribute("boardArticle", bSvc.getBoardDetail(bno))
				.addAttribute("prevNextInfo", bSvc.getPrevAndNextTitle(bno))
				.addAttribute("commentList", cSvc.getBoardCommentList(bno, cpage))
				.addAttribute("pageInfo", 
					new PagingUtil().getPageInfo(cpage, cSvc.getBoardCommentCount(bno)))
				.addAttribute("queryInfo", new MakeQueryUtil());
		return "board/detail";
	}
	
	@RequestMapping("/{btCode}")
	public String getBoardList(@PathVariable String btCode, SearchUtil searchInfo,
				@RequestParam(value="page", defaultValue = "1") int page, Model model) {
		model.addAttribute("btypeList", tSvc.getBoardTypeList())
				.addAttribute("boardList", bSvc.getBoardList(btCode, page, searchInfo))
				.addAttribute("pageInfo", 
					new PagingUtil().getPageInfo(page, bSvc.getBoardTotalCount(btCode, searchInfo)))
				.addAttribute("queryInfo", new MakeQueryUtil());
		return "board/list";
	}
	
	@RequestMapping(value="/{btCode}/{bno:[0-9]*}", method=RequestMethod.DELETE)
	public String deleteBoard(@PathVariable int bno, HttpSession session) {
		MemberVO loginMember = (MemberVO) session.getAttribute("loginUser");
		if(loginMember.getMemNo() == bSvc.getBoardDetail(bno).getWriterNo()) {
			bSvc.deleteBoard(bno, loginMember.getMemNo());
		}
		return "redirect:/board/{btCode}";
	}
	
	@RequestMapping(value="/{btCode}/new", method=RequestMethod.GET)
	public String insertBoardForm(Model model, @PathVariable String btCode, HttpSession session) {
		MemberVO loginMember = (MemberVO) session.getAttribute("loginUser");
		BoardVO vo = new BoardVO()
						.setBtCode(btCode)
						.setWriterNo(loginMember.getMemNo())
						.setWriterNickname(loginMember.getNickName());
		model.addAttribute("boardVO", vo)
				.addAttribute("queryInfo", new MakeQueryUtil());
		return "board/insert";
	}
	
	@RequestMapping(value="/{btCode}/new", method=RequestMethod.POST)
	public String insertBoard(@ModelAttribute("boardVO") @Valid BoardVO vo, 
												BindingResult result,
												SessionStatus sessionStatus) {
		if(result.hasErrors()) {
			return "board/insert";
		} else {
			bSvc.insertBoard(vo);
			sessionStatus.setComplete();
			return "redirect:/board/{btCode}?page=1";
		}
	}
	
	@RequestMapping(value="/{btCode}/{bno:[0-9]*}/edit", method=RequestMethod.GET)
	public String updateBoardForm(Model model, @PathVariable int bno) {
		model.addAttribute("boardVO", bSvc.getBoardDetail(bno));
		return "board/update";
	}
	
	@RequestMapping(value="/{btCode}/{bno:[0-9]*}/edit", method=RequestMethod.PUT)
	public String updateBoard(@Valid @ModelAttribute("boardVO") BoardVO vo,
			BindingResult result,
			SessionStatus sessionStatus,
			HttpServletRequest request) {
		if(result.hasErrors()) {
			return "board/update";
		} else {
			System.out.println(vo);
			bSvc.updateBoard(vo);
			sessionStatus.setComplete();
			return "redirect:/board/{btCode}/{bno}?" + request.getQueryString();
		}
	}
	
	@RequestMapping(value="/{btCode}/{bno:[0-9]*}", method=RequestMethod.PUT)
	public @ResponseBody void updateHit(@PathVariable("bno") int bno) {
		bSvc.updateHit(bno);
	}

	@RequestMapping("/{btCode}/{bno:[0-9]*}/reportChk")
	public @ResponseBody int getExistsReportBoard(@PathVariable("bno") int bno, HttpSession session) {
		MemberVO loginMember = (MemberVO) session.getAttribute("loginUser");
		BoardReportVO vo = new BoardReportVO()
				.setBno(bno)
				.setMemNo(loginMember.getMemNo());
		return rSvc.getExistsBoardReport(vo);
	}
	
	@RequestMapping("/{btCode}/{bno:[0-9]*}/report")
	public @ResponseBody String reportBoard(@PathVariable("bno") int bno, HttpSession session) {
		MemberVO loginMember = (MemberVO) session.getAttribute("loginUser");
		BoardReportVO vo = new BoardReportVO()
				.setBno(bno)
				.setMemNo(loginMember.getMemNo());
		int result = rSvc.insertBoardReport(vo);
		if(result > 0) {
			return "success";
		} else {
			return "failure";
		}
	}

	@RequestMapping("/{btCode}/{bno:[0-9]*}/evaluateChk")
	public @ResponseBody int getExistsEvaluateBoard(@PathVariable("bno") int bno, HttpSession session) {
		MemberVO loginMember = (MemberVO) session.getAttribute("loginUser");
		BoardEvaluateVO vo = new BoardEvaluateVO()
				.setBno(bno)
				.setMemNo(loginMember.getMemNo());
		return eSvc.getExistsBoardEvaluate(vo);
	}

	@RequestMapping("/{btCode}/{bno:[0-9]*}/evaluate")
	public @ResponseBody String evaluateBoard(@PathVariable("bno") int bno, HttpSession session,
			@RequestBody Map<String, String> param) {
		MemberVO loginMember = (MemberVO) session.getAttribute("loginUser");
		BoardEvaluateVO vo = new BoardEvaluateVO()
				.setBno(bno)
				.setMemNo(loginMember.getMemNo())
				.seteType(param.get("eType"));
		int result = eSvc.insertBoardEvaluate(vo);
		if(result > 0) {
			return "success";
		} else {
			return "failure";
		}
	}
	
	@RequestMapping(value="/{btCode}/{bno:[0-9]*}/cmt/new")
	public String insertComment(@PathVariable("bno") int bno,
						@RequestParam("content") String content,
						HttpServletRequest request, 
						HttpSession session) {
		MemberVO loginMember = (MemberVO) session.getAttribute("loginUser");
		BoardCommentVO vo = new BoardCommentVO();
		vo.setContent(content)
			.setBno(bno)
			.setWriterNo(loginMember.getMemNo())
			.setWriterNickname(loginMember.getNickName());
		cSvc.insertBoardComment(vo);
		return "redirect:/board/{btCode}/{bno}?" + request.getQueryString();
	}
	
	@RequestMapping(value="/{btCode}/{bno:[0-9]*}/cmt/{cno:[0-9]*}", method=RequestMethod.DELETE)
	public String deleteComment(@PathVariable("cno") int cno, 
							HttpSession session, HttpServletRequest request) {
		MemberVO loginMember = (MemberVO) session.getAttribute("loginUser");
		if(loginMember.getMemNo() == cSvc.getBoardCommentDetail(cno).getWriterNo()) {
			cSvc.deleteBoardComment(cno);
		}
		return "redirect:/board/{btCode}/{bno}?" + request.getQueryString();
	}
	
	@ResponseBody
	@RequestMapping(value="/{btCode}/{bno:[0-9]*}/cmt/{cno:[0-9]*}", method=RequestMethod.PUT)
	public String updateComment(@PathVariable("cno") int cno, HttpSession session, @RequestBody String content) {
		BoardCommentVO vo = new BoardCommentVO().setCno(cno).setContent(content);
		MemberVO loginMember = (MemberVO) session.getAttribute("loginUser");
		if(loginMember.getMemNo() == cSvc.getBoardCommentDetail(cno).getWriterNo()) {
			cSvc.updateBoardComment(vo);
			return "true";
		}
		return "false";
	}
	
}