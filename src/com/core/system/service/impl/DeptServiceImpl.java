package com.core.system.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.core.base.annotation.AccessLog;
import com.core.base.constants.enums.YN;
import com.core.base.entity.Page;
import com.core.base.service.impl.BaseServiceImpl;
import com.core.base.utils.FastMap;
import com.core.base.web.Sessions;
import com.core.system.entity.SysDept;
import com.core.system.entity.SysUser;
import com.core.system.service.DeptService;
@Service
@Transactional
@AccessLog
public class DeptServiceImpl extends BaseServiceImpl<SysDept> implements DeptService {

	/**
	 * 获得部门层级
	 * @throws Exception 
	 */
	@SuppressWarnings("unchecked")
	public int getCountSubDeptNumByParentId(String parentId) throws Exception{
		Map<String,String> paramMap = new FastMap().newHashMap().set("parentId", parentId);
		return findCount("system.getCountSubDeptNumByParentId",paramMap);
	}
	
	@SuppressWarnings("unchecked")
	public List<SysDept> findListByDeptLevel() throws Exception{
		SysUser user = Sessions.getSysUser();
		String parentDeptLevel = get(user.getSysDept().getId()).getDeptLevel();
		//超级管理员，可查看所有的部门，非超级管理员，只可查询本部门和下级部门
		Map<String,String> paramMap = new FastMap().newHashMap().set("deptLevel", user.getUserRoleType()==YN.N?parentDeptLevel+"%":null);
		return findList("system.findDepts", paramMap);
	}

	@SuppressWarnings("unchecked")
	public SysDept findDeptByDeptName(String deptName) throws Exception{
		return findOne("system.findDepts",new FastMap().newHashMap().set("deptName", deptName));
	}
	public int saveDeptList(List<SysDept> deptList) throws Exception{
		for(SysDept dept : deptList){
			save(dept);
		}
		return 1;
	}
	
	@SuppressWarnings("unchecked")
	public Page findPage(Page page, String parentId) throws Exception{
		SysUser user = Sessions.getSysUser();
		String parentDeptLevel = get(user.getSysDept().getId()).getDeptLevel();
		//超级管理员，可查看所有的部门，非超级管理员，只可查询本部门和下级部门
		Map<String,String> paramMap = new FastMap().newHashMap()
		.set("parentId", parentId)
		.set("deptLevel", user.getUserRoleType()==YN.N?parentDeptLevel+"%":null);
		return findPage(page, "system.findDepts",paramMap);
	}
}
