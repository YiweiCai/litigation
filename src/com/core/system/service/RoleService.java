package com.core.system.service;

import java.util.List;
import java.util.Map;

import com.core.base.constants.enums.Auth;
import com.core.base.service.BaseService;
import com.core.cms.entity.CmsRoleChannel;
import com.core.system.entity.SysRole;
import com.core.system.entity.SysRoleMenu;

public interface RoleService extends BaseService<SysRole>{

	public int saveOrUpdate(SysRole sysRole,String checkIds, String rwAuths, String checkLmIds) throws Exception;
	
	public int saveOrUpdateSysRoleMenu(SysRole role,String checkIds,String rwAuths) throws Exception;
	
	public int saveOrUpdateCmsRoleChannel(SysRole role,String checkIds) throws Exception;
	
	public int getCountSubRoleNumByParentId(String parentId) throws Exception;

	public List<SysRoleMenu> findSysRoleMenuByRoleId(String roleId) throws Exception;
	
	public List<CmsRoleChannel> findSysCmsRoleChannelByRoleId(String roleId) throws Exception;

	public Auth findAuthByRoleId(String roleId, String menuPath) throws Exception;

	public List<SysRole> findRoles(Map<String,?> paramMap) throws Exception;
}
