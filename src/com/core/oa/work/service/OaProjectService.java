package com.core.oa.work.service;

import java.io.File;
import java.util.List;

import com.core.base.service.BaseService;
import com.core.oa.work.entity.OaProject;

public interface OaProjectService extends BaseService<OaProject>{

	public void save(OaProject oaProject, String uploadPath, List<File> upload,List<String> uploadFileName, List<String> uploadContentType)throws Exception;
}
