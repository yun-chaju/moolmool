package com.wappl.moolmool.address.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wappl.moolmool.address.dao.AddressDao;

@Service
public class AddressServiceImpl implements AddressService{
	
	@Autowired
	private AddressDao dao;

	@Override
	public List<String> getGugunList(String sido) {
		return dao.getGugunList(sido);
	}

	@Override
	public List<String> getEmdList(String gugun) {
		return dao.getEmdList(gugun);
	}

}
