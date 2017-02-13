package com.wappl.moolmool.memo.service;

import com.wappl.moolmool.memo.vo.MemoVO;

public interface MemoService {
	
	public MemoVO getMemoDetail(MemoVO vo);

	public int insertMemo(MemoVO vo);

	public int updateMemo(MemoVO vo);

	public int deleteMemo(MemoVO vo);

}
