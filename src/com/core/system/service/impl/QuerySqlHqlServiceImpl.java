package com.core.system.service.impl;

import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.core.base.dao.cache.CacheConstants;
import com.core.base.dao.cache.EhCacheManager;
import com.core.base.service.impl.BaseServiceImpl;
import com.core.system.entity.QuerySqlHql;
import com.core.system.service.QuerySqlHqlService;
@Service
@Transactional
public class QuerySqlHqlServiceImpl extends BaseServiceImpl<QuerySqlHql> implements QuerySqlHqlService {

	@SuppressWarnings("unchecked")
	public void updateQueryTemplateInCache() throws Exception{
		
		Map<String,String> map = (Map<String, String>) findMap("system.findQuerySqlHqls", "queryName", "sqlHql", null);
	
		EhCacheManager.remove(CacheConstants.CONSTANTS_DATE_CACHE, CacheConstants.QUERY_SQL_HQL_KEY);
    	EhCacheManager.put(CacheConstants.CONSTANTS_DATE_CACHE, CacheConstants.QUERY_SQL_HQL_KEY, map);
	}
}
