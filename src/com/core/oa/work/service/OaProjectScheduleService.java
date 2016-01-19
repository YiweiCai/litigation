package com.core.oa.work.service;

import java.io.File;
import java.util.List;

import com.core.base.service.BaseService;
import com.core.oa.work.entity.OaProject;
import com.core.oa.work.entity.OaProjectSchedule;

public interface OaProjectScheduleService extends BaseService<OaProjectSchedule>{

	public int save(OaProject oaProject,
			OaProjectSchedule oaProjectSchedule, List<String> roleIds,
			List<String> userIds, List<String> startDts, List<String> endDts,
			List<String> descriptions, String uploadPath,List<File> upload,List<String> uploadFileName, List<String> uploadContentType)throws Exception;
}
