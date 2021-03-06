package com.core.oa.work.service.impl;

import java.io.File;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.core.base.service.impl.BaseServiceImpl;
import com.core.oa.work.entity.OaProject;
import com.core.oa.work.service.OaProjectService;
import com.core.upload.service.UploadFileService;

@Service
@Transactional
public class OaProjectServiceImpl extends BaseServiceImpl<OaProject> implements OaProjectService {
	
	@Autowired
	private UploadFileService uploadFileService;
	
	@Transactional(propagation=Propagation.REQUIRED)
	public void save(OaProject oaProject, String uploadPath, List<File> upload,List<String> uploadFileName, List<String> uploadContentType)throws Exception{
		if(StringUtils.isBlank(oaProject.getId())){
			save(oaProject);
		}else{
			update(oaProject);
		}
		uploadFileService.upload(oaProject.getId(), uploadPath, upload, uploadFileName, uploadContentType);
	}
}
