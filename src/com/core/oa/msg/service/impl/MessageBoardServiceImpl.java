package com.core.oa.msg.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.core.base.entity.Page;
import com.core.base.service.impl.BaseServiceImpl;
import com.core.oa.msg.entity.OaMessageBoard;
import com.core.oa.msg.service.MessageBoardService;

@Service
@Transactional
public class MessageBoardServiceImpl extends BaseServiceImpl<OaMessageBoard> implements MessageBoardService {
	
	public Page findPage(Page page) throws Exception{
		return findPage(page, "oa.findMessageBoards",null);
	}
}
