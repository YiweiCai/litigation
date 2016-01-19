package com.core.workflow.common.service;

import java.util.List;

import com.core.base.service.BaseService;
import com.core.workflow.common.entity.WfExecuteSetting;

public interface WorkFlowSettingService extends BaseService<WfExecuteSetting> {

	public List<WfExecuteSetting> findListByWfCat(String wfCat) throws Exception;

	public int save(String wfCat, List<String> curExecutorRoles,
			List<String> nextExecutorRoles,
			List<String> transitions,
			List<String> variableNames,
			List<String> operateTypes) throws Exception;
}
