package com.wappl.moolmool.faq.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wappl.moolmool.faq.dao.FaqDao;
import com.wappl.moolmool.faq.vo.FaqTypeVO;
import com.wappl.moolmool.faq.vo.FaqVO;

@Service
public class FaqServiceImpl implements FaqService{

	@Autowired
	private FaqDao faqDao;

	@Override
	public List<FaqVO> getFaqList(String fname) throws Exception {
		return faqDao.getFaqList(fname);
	}

	@Override
	public FaqVO getFaqDetail(int vo) throws Exception {
		return faqDao.getFaqDetail(vo);
	}

	@Override
	public int insertFaq(FaqVO vo) throws Exception {
		return faqDao.insertFaq(vo);
	}

	@Override
	public int updateFaq(FaqVO vo) throws Exception {
		return faqDao.updateFaq(vo);
	}

	@Override
	public int deleteFaq(int vo) throws Exception {
		return faqDao.deleteFaq(vo);
	}

	@Override
	public List<FaqVO> getFaqAllList() throws Exception {
		return faqDao.getFaqAllList();
	}

	@Override
	public int updateFname(FaqTypeVO vo) throws Exception {
		return faqDao.updateFname(vo);
	}

	@Override
	public int deleteFname(FaqTypeVO vo) throws Exception {
		return faqDao.deleteFname(vo);
	}
}
