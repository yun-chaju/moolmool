package com.wappl.moolmool.shop.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wappl.moolmool.shop.vo.ShopItemVO;

@Repository
public class ShopItemDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public List<ShopItemVO> getShopItemList(int memNo) {
		return sqlSession.selectList("getShopItemList", memNo);
	}
	
	

}
