package com.core.oa.msg.service;

import com.core.base.entity.Page;
import com.core.base.service.BaseService;
import com.core.oa.msg.entity.OaMessageBoard;

public interface MessageBoardService extends BaseService<OaMessageBoard>{

	public Page findPage(Page page)throws Exception;
}
