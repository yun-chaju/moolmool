 package com.wappl.moolmool.faq.service;

import java.util.List;

import com.wappl.moolmool.faq.vo.FaqTypeVO;
import com.wappl.moolmool.faq.vo.FaqVO;

public interface FaqService {

	List<FaqVO> getFaqAllList() throws Exception;
	
	List<FaqVO> getFaqList(String fname) throws Exception;

	FaqVO getFaqDetail(int vo) throws Exception;

	int insertFaq(FaqVO vo) throws Exception;

	int updateFaq(FaqVO vo) throws Exception;

	int deleteFaq(int fno) throws Exception;

	int updateFname(FaqTypeVO vo) throws Exception;

	int deleteFname(FaqTypeVO vo) throws Exception;
}
