package com.wappl.moolmool.shop.service;

import java.util.List;

import com.wappl.moolmool.shop.vo.PersonaconOrderHistoryVO;
import com.wappl.moolmool.shop.vo.PersonaconVO;

public interface PersonaconService {

	public int insertPersonacon(PersonaconVO vo);

	public int insertOrderPersonacon(PersonaconOrderHistoryVO vo);

	public List<PersonaconVO> getPersonaconList(int memNo, int page);

	public PersonaconVO getPersonaconDetail(int pscNo);

	public int updatePersonacon(PersonaconVO vo);

	public int deletePersonacon(int pscNo);
	
	public int updateMemberPersonacon(int pscNo, int memNo);
	
	public int getPersonaconTotalCount();
	
}
