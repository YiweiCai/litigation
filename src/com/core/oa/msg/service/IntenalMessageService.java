package com.core.oa.msg.service;

import java.io.File;
import java.util.List;
import java.util.Map;

import com.core.base.entity.Page;
import com.core.base.service.BaseService;
import com.core.oa.msg.entity.OaIntenalMessage;

public interface IntenalMessageService extends BaseService<OaIntenalMessage>{

	//发送信息
	public void save(List<OaIntenalMessage> iMsgList,String uploadPath,
			List<File> upload,List<String> uploadFileName, List<String> uploadContentType)throws Exception;

	public Page findPage(Page page,Map<String,String> paramMap)throws Exception;

	public int batchUpdateOrDelete(String[] ids)throws Exception;

	public List<OaIntenalMessage> findList(Map<String, String> paramMap)throws Exception;

	public void update(OaIntenalMessage intenalMessage, String uploadPath,
			List<File> upload, List<String> uploadFileName,
			List<String> uploadContentType) throws Exception;
}
