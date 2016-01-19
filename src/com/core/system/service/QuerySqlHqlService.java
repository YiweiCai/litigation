package com.core.system.service;

import com.core.base.service.BaseService;
import com.core.system.entity.QuerySqlHql;

public interface QuerySqlHqlService extends BaseService<QuerySqlHql>{

	public void updateQueryTemplateInCache() throws Exception;
}
