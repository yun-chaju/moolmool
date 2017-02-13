package com.wappl.moolmool.faq.service;

import java.util.List;

import com.wappl.moolmool.faq.vo.FaqTypeVO;

public interface FaqTypeService {
	List<FaqTypeVO> getFaqTypeList() throws Exception;

	FaqTypeVO getFaqTypeDetail(String vo) throws Exception;

	int insertFaqType(FaqTypeVO vo) throws Exception;

	int updateFaqType(FaqTypeVO vo) throws Exception;

	int deleteFaqType(FaqTypeVO vo) throws Exception;
}
