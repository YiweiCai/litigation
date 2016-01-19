package com.core.system.service;

import java.util.List;

import com.core.base.entity.Page;
import com.core.base.service.BaseService;
import com.core.system.entity.SysDept;

public interface DeptService extends BaseService<SysDept>{
    
	public int getCountSubDeptNumByParentId(String parentId) throws Exception;

	public List<SysDept> findListByDeptLevel() throws Exception;

	public SysDept findDeptByDeptName(String deptName) throws Exception;

	public int saveDeptList(List<SysDept> deptList) throws Exception;

	public Page findPage(Page page, String id) throws Exception;
}
