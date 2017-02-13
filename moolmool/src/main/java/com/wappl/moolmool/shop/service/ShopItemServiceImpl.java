package com.wappl.moolmool.shop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wappl.moolmool.member.dao.MemberDao;
import com.wappl.moolmool.point.dao.PointDao;
import com.wappl.moolmool.point.vo.PointVO;
import com.wappl.moolmool.shop.dao.ShopItemDao;
import com.wappl.moolmool.shop.exception.NotEnoughPointException;
import com.wappl.moolmool.shop.vo.ShopItemVO;

@Service
public class ShopItemServiceImpl implements ShopItemService{
	
	@Autowired private ShopItemDao sDao;
	@Autowired private MemberDao mDao;
	@Autowired private PointDao ptDao;

	@Override
	public List<ShopItemVO> getShopItemList(int memNo) {
		return sDao.getShopItemList(memNo);
	}

	@Override
	public int updateMemberNickname(String nickname, int memNo) {
		int memberPoint = mDao.getMemberPoint(memNo);
		int price = 100; // ㅠㅠ;
		if(memberPoint >= price) {
			PointVO pVo = new PointVO()
					.setMemNo(memNo)
					.setLog("퍼스나콘 구매")
					.setPointChange(price)
					.setAddEli('e');
				ptDao.insertPoint(pVo);
				ptDao.updateMemberPoint(pVo);
			return mDao.updateMemberNickname(nickname, memNo);
		} else {
			throw new NotEnoughPointException("포인트가 부족합니다.");
		}
	}

}
