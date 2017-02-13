package com.wappl.moolmool.shop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wappl.moolmool.member.dao.MemberDao;
import com.wappl.moolmool.point.dao.PointDao;
import com.wappl.moolmool.point.vo.PointVO;
import com.wappl.moolmool.shop.dao.PersonaconDao;
import com.wappl.moolmool.shop.exception.NotEnoughPointException;
import com.wappl.moolmool.shop.vo.PersonaconOrderHistoryVO;
import com.wappl.moolmool.shop.vo.PersonaconVO;

@Service
public class PersonaconServiceImpl implements PersonaconService {
	
	@Autowired private PersonaconDao pDao;
	@Autowired private MemberDao mDao;
	@Autowired private PointDao ptDao;

	@Override
	public int insertPersonacon(PersonaconVO vo) {
		return pDao.insertPersonacon(vo);
	}

	@Override
	public int insertOrderPersonacon(PersonaconOrderHistoryVO vo) {
		int memberPoint = mDao.getMemberPoint(vo.getMemNo());
		int price = pDao.getPersonaconDetail(vo.getPscNo()).getPrice();
		if(memberPoint >= price) {
			PointVO pVo = new PointVO()
					.setMemNo(vo.getMemNo())
					.setLog("퍼스나콘 구매")
					.setPointChange(price)
					.setAddEli('e');
				ptDao.insertPoint(pVo);
				ptDao.updateMemberPoint(pVo);
			return pDao.insertOrderPersonacon(vo);
		} else {
			throw new NotEnoughPointException("포인트가 부족합니다.");
		}
	}

	@Override
	public List<PersonaconVO> getPersonaconList(int memNo, int page) {
		return pDao.getPersonaconList(memNo, page);
	}

	@Override
	public PersonaconVO getPersonaconDetail(int pscNo) {
		return pDao.getPersonaconDetail(pscNo);
	}

	@Override
	public int updatePersonacon(PersonaconVO vo) {
		return pDao.updatePersonacon(vo);
	}

	@Override
	public int deletePersonacon(int pscNo) {
		return pDao.deletePersonacon(pscNo);
	}

	@Override
	public int updateMemberPersonacon(int pscNo, int memNo) {
		return pDao.updateMemberPersonacon(pscNo, memNo);
	}

	@Override
	public int getPersonaconTotalCount() {
		return pDao.getPersonaconTotalCount();
	}

}
