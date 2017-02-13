package com.wappl.moolmool.point.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wappl.moolmool.point.dao.PointDao;
import com.wappl.moolmool.point.vo.PointVO;

@Service
public class PointServiceImpl implements PointService{

	@Autowired
	private PointDao pd;
	
	@Override
	public List<PointVO> getAllPointLog(PointVO vo) throws Exception {
		return pd.getAllPointLog(vo);
	}

	@Override
	public int insertPoint(PointVO vo) throws Exception {
		return pd.insertPoint(vo);
	}
	
	@Override
	public int updateMemberPoint(PointVO vo) {
		return pd.updateMemberPoint(vo);
	}

	@Override
	public int deleteUserPointLog(PointVO vo) throws Exception {
		return pd.deleteUserPointLog(vo);
	}



}
