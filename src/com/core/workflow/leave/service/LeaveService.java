package com.core.workflow.leave.service;

import com.core.base.entity.Page;
import com.core.base.service.BaseService;
import com.core.workflow.leave.entity.WfLeave;
import com.core.workflow.leave.entity.WfLeaveAudit;
/**
 * 请假流程service
 * @author yeshujun
 */
public interface LeaveService extends BaseService<WfLeave> {

	public int saveLeave(WfLeave leave, String nextExecutorId) throws Exception;

	public Page findPageTasks(Page page) throws Exception;

	public Page findPageAuditingTasks(Page page) throws Exception;

	public int saveAudit(WfLeave leave, WfLeaveAudit leaveAudit,String nextExecutorId,String processInstanceId) throws Exception;

	public Page findPageHistoryTasks(Page page) throws Exception;
}
