package com.core.system.service.impl;

import java.io.File;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.core.base.constants.enums.YN;
import com.core.base.dao.hibernate.BaseHibernateDao;
import com.core.base.dao.utils.Querys;
import com.core.base.entity.Page;
import com.core.base.service.impl.BaseServiceImpl;
import com.core.base.utils.FastMap;
import com.core.base.web.Sessions;
import com.core.system.entity.SysDept;
import com.core.system.entity.SysUser;
import com.core.system.service.UserService;
import com.core.upload.service.UploadFileService;
import com.core.workflow.common.entity.WfExecutor;

/**
 * 用户基本信息管理类
 * @author yeshujun
 *
 */
@Service
@Transactional
public class UserServiceImpl extends BaseServiceImpl<SysUser> implements UserService {
	@Autowired
	private BaseHibernateDao<SysDept> deptDao;
	
	@Autowired
	private UploadFileService uploadFileService;
	
	@SuppressWarnings("unchecked")
	public Page findUsers(Page page,String deptId,String roleId,String userName,List<String> userIdList) throws Exception {
		SysUser user = Sessions.getSysUser();
		String parentDeptLevel = deptDao.get(SysDept.class, user.getSysDept().getId()).getDeptLevel();
		
		Map<String,String> paramMap = new FastMap().newHashMap()
		.set(Querys.PREFIX+"roleId", roleId)
		.set("deptId", deptId)
		.set("roleId", roleId)
		.set("userName", "%"+userName+"%")
		.set("userIdList", userIdList)//userIdList !=null 时，是查看在线用户
        .set("organization",user.getOrganization())//当前用户的归属机构
		.set("parentDeptLevel", (userIdList==null && user.getUserRoleType()==YN.N)?parentDeptLevel+"%":null);
		return this.findPage(page,"system.findUsers",paramMap);
	}

	/**
	 * 查询流程执行人
	 * @throws Exception 
	 */
	@SuppressWarnings("unchecked")
	public List<WfExecutor> findWfExecutor(String roleId,String wfCat,String operateType) throws Exception{
		Map<String,String> paramMap = new FastMap().newHashMap().set("roleId", roleId).set("wfCat", wfCat).set("operateType", operateType);
		return this.findList("workflow.findWfExecutor",paramMap);
	}
	
	@Transactional(propagation=Propagation.REQUIRED)
	public int saveUserList(List<SysUser> userList) throws Exception{
		for(SysUser user : userList){
			this.save(user);
		}
		return 1;
	}

	@Transactional(propagation=Propagation.REQUIRED)
	public void update(SysUser user, String uploadPath, List<File> upload,
			List<String> uploadFileName, List<String> uploadContentType)
			throws Exception {
		
		//更新用户
		update(user);
		
		//上传用户图片到磁盘、保存图片信息到数据库
		uploadFileService.upload(user.getId(), uploadPath, upload, uploadFileName, uploadContentType);
	}
}
