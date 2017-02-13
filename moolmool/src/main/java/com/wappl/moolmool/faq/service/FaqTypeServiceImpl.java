package com.wappl.moolmool.faq.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wappl.moolmool.faq.dao.FaqTypeDao;
import com.wappl.moolmool.faq.vo.FaqTypeVO;

@Service
public class FaqTypeServiceImpl implements FaqTypeService {

	@Autowired
	private FaqTypeDao faqTypeDao;

	@Override
	public List<FaqTypeVO> getFaqTypeList() throws Exception {
		return faqTypeDao.getFaqTypeList();
	}

	@Override
	public FaqTypeVO getFaqTypeDetail(String vo) throws Exception {
		return faqTypeDao.getFaqTypeDetail(vo);
	}

	@Override
	public int insertFaqType(FaqTypeVO vo) throws Exception {
		return faqTypeDao.insertFaqType(vo);
	}

	@Override
	public int updateFaqType(FaqTypeVO vo) throws Exception {
		return faqTypeDao.updateFaqType(vo);
	}

	@Override
	public int deleteFaqType(FaqTypeVO vo) throws Exception {
		return faqTypeDao.deleteFaqType(vo);
	}
}
