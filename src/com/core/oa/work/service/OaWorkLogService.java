package com.core.oa.work.service;

import com.core.base.entity.Page;
import com.core.base.service.BaseService;
import com.core.oa.work.entity.OaWorkLog;

public interface OaWorkLogService extends BaseService<OaWorkLog>{

	public Page findPage(Page page,String isLeaderRead)throws Exception;

}
