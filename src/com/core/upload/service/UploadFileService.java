package com.core.upload.service;

import java.io.File;
import java.util.List;

import com.core.base.service.BaseService;
import com.core.upload.entity.UploadFile;

public interface UploadFileService extends BaseService<UploadFile>{

	public List<UploadFile> findByOwnerId(String ownerId) throws Exception;

	public int deleteById(String uploadFileId) throws Exception;
	
	public int deleteByOwnerId(String ownerId) throws Exception;

	public List<UploadFile> upload(String ownerId,String uploadPath, List<File> upload,List<String> uploadFileName,
			List<String> uploadContentType)throws Exception;
}
