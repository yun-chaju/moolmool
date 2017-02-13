package com.wappl.moolmool.map.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wappl.moolmool.common.util.MakeQueryUtil;
import com.wappl.moolmool.common.util.PagingUtil;
import com.wappl.moolmool.map.service.MapService;
import com.wappl.moolmool.map.vo.MapVO;
import com.wappl.moolmool.trade.vo.TradeVO;

@Controller
public class MapController {

	@Autowired
	private MapService service;
	
	@RequestMapping("/map")
	public String mapMain() {
		// 지도 보고싶으신 분들은 서버 포트번호 8998로 수정하셔야 합니다!
		return "map/map";
	}

			
	@RequestMapping(value="/map/list")
	public @ResponseBody Map<String, Object> resultList(@RequestBody MapVO vo){
		Map<String, Object> map = new HashMap<>();
		List<TradeVO> list = service.getMapList(vo);
		if(list.isEmpty()==false){
		map.put("list", service.getMapList(vo));
		map.put("paging", new PagingUtil().getPageInfo(vo.getPage(), service.getMapListCount(vo)));
		} else {
			map.put("msg", "물물 조건 검색결과가 없습니다.");
		}
		return map;
	}
	@RequestMapping(value="/map/search")
	public String resultList(@RequestParam(value="page", defaultValue="1") int page, 
																MapVO vo, Model model){
		
			vo.setPage(page);
			model.addAttribute("list", service.getMapList(vo));
			model.addAttribute("pageInfo", new PagingUtil().getPageInfo(page, service.getMapListCount(vo)));
			model.addAttribute("queryInfo", new MakeQueryUtil());
			return "map/search";
				
	}
	
		
}
