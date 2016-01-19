package com.lawsuit.wsla.service.impl;

import java.io.File;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.core.base.constants.enums.YN;
import com.core.base.dao.hibernate.BaseHibernateDao;
import com.core.base.dao.utils.Querys;
import com.core.base.dao.utils.builder.HqlBuilder;
import com.core.base.entity.Page;
import com.core.base.service.impl.BaseServiceImpl;
import com.core.base.utils.FastMap;
import com.core.base.web.Sessions;
import com.core.system.entity.SysDept;
import com.core.system.entity.SysUser;
import com.core.system.service.UserService;
import com.core.upload.service.UploadFileService;
import com.core.workflow.common.entity.WfExecutor;
import com.lawsuit.wsla.entity.LsLaxx;
import com.lawsuit.wsla.entity.LsYast;
import com.lawsuit.wsla.service.LaxxService;
import com.lawsuit.wsla.service.YastService;

import edu.emory.mathcs.backport.java.util.Arrays;


@Service
@Transactional
public class YastServiceImpl extends BaseServiceImpl<LsYast> implements YastService {

	
	@Autowired
	private UploadFileService uploadFileService;
	
	
	
}
