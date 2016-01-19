package com.core.system.service;

import com.core.base.entity.Page;
import com.core.base.service.BaseService;
import com.core.system.entity.SysAccessLog;

public interface AccessLogService extends BaseService<SysAccessLog> {

	Page findPage(Page page, String accessUserId, String accessUserName,
			String startAccessTime, String endAccessTime) throws Exception;

}
