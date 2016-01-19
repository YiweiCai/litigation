package com.core.cms.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.core.base.dao.utils.builder.HqlBuilder;
import com.core.base.service.impl.BaseServiceImpl;
import com.core.cms.entity.CmsTemplet;
import com.core.cms.service.TempletService;

@Service
@Transactional
public class TempletServiceImpl extends BaseServiceImpl<CmsTemplet> implements TempletService {
	
	@SuppressWarnings("unchecked")
	public List<CmsTemplet> findListExclude(String templeteName) throws Exception{
		HqlBuilder hqlBuilder = new HqlBuilder("select templete from CmsTemplet templete ")
		.append("where templete.cmsTemplet.id ='1' ")
		.append("and templete.templetName !=:templeteName ").setParam("templeteName", templeteName)
		.append("order by templete.createTime asc");
		return this.findList(hqlBuilder);
	}
}
