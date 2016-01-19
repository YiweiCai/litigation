package com.core.cms.service;

import java.util.List;

import com.core.base.service.BaseService;
import com.core.cms.entity.CmsTemplet;

public interface TempletService extends BaseService<CmsTemplet>{

	public List<CmsTemplet> findListExclude(String templeteName)throws Exception;

}
