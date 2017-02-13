package com.wappl.moolmool.trade.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.HttpClientBuilder;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.wappl.moolmool.common.util.MakeQueryUtil;
import com.wappl.moolmool.common.util.PagingUtil;
import com.wappl.moolmool.member.vo.MemberVO;
import com.wappl.moolmool.trade.service.TradeCategoryService;
import com.wappl.moolmool.trade.service.TradeCommentService;
import com.wappl.moolmool.trade.service.TradeService;
import com.wappl.moolmool.trade.vo.TradeCategoryVO;
import com.wappl.moolmool.trade.vo.TradeVO;

@Controller
@RequestMapping("/trade")
@SessionAttributes("tradeVO")
public class TradeController {

	@Autowired private TradeService tradeSvc;
	@Autowired private TradeCategoryService categorySvc;
	@Autowired private TradeCommentService commentSvc;
	
	/*@RequestMapping("")
	public String index() {
		return "trade/index";
	}*/
	
	@RequestMapping("/{tno:[0-9]*}")
	public String getTradeDetail(@PathVariable int tno, 
			Model model, 
			@RequestParam(value="cpage", defaultValue = "1") int cpage, HttpSession session) {
			model.addAttribute("article", tradeSvc.getTradeDetail(tno))
				.addAttribute("cmtList", commentSvc.getTradeCommentList(tno));
		return "trade/detail";
	}
	
	@RequestMapping("/{tradeType:[a-zA-Z]*}")
	public String getTradeList(Model model, @PathVariable("tradeType") String tradeType,
			@RequestParam(value="page", defaultValue = "1") int page) {
		model.addAttribute("list", tradeSvc.getTradeList(page, tradeType))
			.addAttribute("pageInfo", new PagingUtil().getPageInfo(page, tradeSvc.getTradeAllCount(tradeType)))
			.addAttribute("queryInfo", new MakeQueryUtil());
		return "trade/list";
	}
	
	@RequestMapping(value="/new", method=RequestMethod.GET)
	public String insertTradeForm(Model model, HttpSession session) {
		MemberVO loginMember = (MemberVO) session.getAttribute("loginUser");
		TradeVO vo = new TradeVO()
				.setWriterUno(loginMember.getMemNo())
				.setWriterNickname(loginMember.getNickName());
		
		model.addAttribute("tradeVO", vo);
		return "trade/insert";
	}
	
	@RequestMapping(value="/new", method=RequestMethod.POST)
	public String insertTrade(TradeVO vo, SessionStatus sessionStatus) {
		tradeSvc.insertTrade(vo);
		sessionStatus.setComplete();
		if(vo.getTradeType() == 'S'){
			return "redirect:/trade/swap?page=1";
		}else if (vo.getTradeType() == 'F'){
			return "redirect:/trade/free?page=1";
		}else if (vo.getTradeType() == 'W'){
			return "redirect:/trade/wanted?page=1";
		}
		return "redirect:/trade/all?page=1";
		
	}
	
	@RequestMapping(value="/{tno:[0-9]*}/edit", method=RequestMethod.GET)
	public String updateTradeForm(Model model, @PathVariable int tno) {
		model.addAttribute("tradeVO", tradeSvc.getTradeDetail(tno));
		return "trade/update";
	}
	
	@RequestMapping(value="/{tno:[0-9]*}/edit", method=RequestMethod.PUT)
	public String updateTrade(TradeVO vo, SessionStatus sessionStatus) {
		tradeSvc.updateTrade(vo);
		sessionStatus.setComplete();
		return "redirect:/trade/{tno}";
	}
	
	@RequestMapping(value="/{tno:[0-9]*}", method=RequestMethod.DELETE)
	public String deleteTrade(@PathVariable int tno, HttpSession session) {
		MemberVO loginMember = (MemberVO) session.getAttribute("loginUser");
		if(loginMember.getMemNo() == tradeSvc.getTradeDetail(tno).getWriterUno()) {
			tradeSvc.deleteTrade(tno);
		}
		return "redirect:/trade/list";
	}

	@ResponseBody
	@RequestMapping("/category/list")
	public List<TradeCategoryVO> getTradeCategoryList() {
		return categorySvc.getTradeCategoryList();
	}
	
	@ResponseBody
	@RequestMapping("/subcategory/list/{category}")
	public List<TradeCategoryVO> getTradeSubCategoryList(@PathVariable String category) {
		System.out.println(category);
		return categorySvc.getTradeSubCategoryList(category);
	}
	
	@RequestMapping("/map/addr")
	public @ResponseBody JSONObject getAddress(@RequestBody HashMap<String, Object> latlng) {
		JSONObject job = null;
		
		try {
			StringBuilder html = new StringBuilder();
			String url = "https://openapi.naver.com/v1/map/reversegeocode?query=" + latlng.get("latlng");
			String clientId = "Ml2NLFK53C_BTMBkFqeD";
			String clientSecret = "Ap1OnQg2sM";

			HttpClient client = HttpClientBuilder.create().build();
			HttpGet req = new HttpGet(url);
			req.addHeader("X-Naver-Client-Id", clientId);
			req.addHeader("X-Naver-Client-Secret", clientSecret);

			HttpResponse resp = client.execute(req);
			BufferedReader reader = new BufferedReader(new InputStreamReader(resp.getEntity().getContent(), "UTF-8"));

			String current = "";
			while ((current = reader.readLine()) != null) {
				html.append(current);
			}
			
			JSONParser parser = new JSONParser();
			job = (JSONObject) parser.parse(html.toString());
			reader.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return job;
	}

}