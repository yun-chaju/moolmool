package com.wappl.moolmool.msg.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wappl.moolmool.msg.dao.MsgDao;
import com.wappl.moolmool.msg.vo.MsgVO;

@Service("msgService")
public class MsgServiceImpl implements MsgService{
	
	@Autowired
	private MsgDao msgDao;
	
	@Override
	public List<MsgVO> getMsgList(Map<String, Object> map) throws Exception {
		return msgDao.getMsgList(map);
	}

	@Override
	public MsgVO getMsgDetail(MsgVO vo) throws Exception{
		return msgDao.getMsgDetail(vo);
	}
	
	@Override
	public int updateOpen(MsgVO vo) throws Exception {
		return msgDao.updateOpen(vo);
	}
	
	@Override
	public int insertMsg(MsgVO vo) throws Exception{
		return msgDao.insertMsg(vo);
	}
	
	@Override
	public int deleteMsg(MsgVO vo) throws Exception{
		return msgDao.deleteMsg(vo);
	}

	@Override
	public int getMsgCount(Map<String, Object> map) throws Exception{
		return msgDao.getMsgCount(map);
	}

	@Override
	public int getNotOpendMsgCount(int rno) throws Exception {
		return msgDao.getNotOpendMsgCount(rno);
	}

	@Override
	public int deleteMsg(Map<String,Object> map) throws Exception {
		return msgDao.deleteMsg(map);
	}

	@Override
	public int insertMessage(MsgVO vo) throws Exception {
		return msgDao.insertMessage(vo);
	}


	

	

}
