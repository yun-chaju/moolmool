package com.wappl.moolmool.address.service;

import java.util.List;

public interface AddressService {
	
	public List<String> getGugunList(String sido);
	
	public List<String> getEmdList(String gugun);

}
