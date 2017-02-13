package com.wappl.moolmool.shop.service;

import java.util.List;

import com.wappl.moolmool.shop.vo.ShopItemVO;

public interface ShopItemService {
	
	public List<ShopItemVO> getShopItemList(int memNo);
	
	public int updateMemberNickname(String nickname, int memNo);
	
}
