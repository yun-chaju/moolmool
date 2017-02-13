package com.wappl.moolmool.point.service;

import java.util.List;

import com.wappl.moolmool.point.vo.PointVO;

public interface PointService {

	List<PointVO> getAllPointLog(PointVO vo) throws Exception;
	
	int insertPoint(PointVO vo) throws Exception;
	
	public int updateMemberPoint(PointVO vo);
	
	int deleteUserPointLog(PointVO vo) throws Exception;
	
}
