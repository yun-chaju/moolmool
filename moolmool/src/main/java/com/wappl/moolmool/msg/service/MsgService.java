package com.wappl.moolmool.msg.service;

import java.util.List;
import java.util.Map;

import com.wappl.moolmool.msg.vo.MsgVO;


public interface MsgService {

	List<MsgVO> getMsgList(Map<String, Object> map) throws Exception;
	
	MsgVO getMsgDetail(MsgVO vo) throws Exception;
	
	int insertMsg(MsgVO vo) throws Exception;
	
	int deleteMsg(MsgVO vo) throws Exception;

	int updateOpen(MsgVO vo) throws Exception;
	
	int getMsgCount(Map<String, Object> map) throws Exception;
	
	int getNotOpendMsgCount(int rno) throws Exception;

	int deleteMsg(Map<String,Object> map) throws Exception;
	
	int insertMessage(MsgVO vo) throws Exception;
}
