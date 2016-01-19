package com.core.oa.work.service.impl;

import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.core.base.dao.hibernate.BaseHibernateDao;
import com.core.base.entity.Page;
import com.core.base.service.impl.BaseServiceImpl;
import com.core.base.utils.FastMap;
import com.core.base.web.Sessions;
import com.core.oa.work.entity.OaWorkLog;
import com.core.oa.work.service.OaWorkLogService;
import com.core.system.entity.SysDept;

@Service
@Transactional
public class OaWorkLogServiceImpl extends BaseServiceImpl<OaWorkLog> implements OaWorkLogService {
	@Autowired
	private BaseHibernateDao<SysDept> deptDao;
	
	public Page findPage(Page page,String isLeaderRead) throws Exception{
		Map<String,String> paramMap = new FastMap<String, String>().newHashMap();
		if(StringUtils.isNotBlank(isLeaderRead)){
			String parentDeptLevel = deptDao.get(SysDept.class, Sessions.getSysUser().getSysDept().getId()).getDeptLevel();
			paramMap.put("parentDeptLevel", parentDeptLevel);
		}else{
			paramMap.put("userId", Sessions.getSysUser().getId());
		}
		return findPage(page, "oa.findWorkLogs",paramMap);
	}
}
