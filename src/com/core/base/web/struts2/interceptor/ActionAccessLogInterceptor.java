package com.core.base.web.struts2.interceptor;

import java.lang.reflect.Method;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.core.base.constants.enums.YN;
import com.core.base.dao.cache.CacheConstants;
import com.core.base.dao.cache.EhCacheManager;
import com.core.base.web.Servlets;
import com.core.base.web.Sessions;
import com.core.base.web.struts2.action.BaseAuthAction;
import com.core.system.entity.SysUser;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
/**
 * 记录用户访问的action及参数，到日志文件
 * @author yeshujun
 */
public class ActionAccessLogInterceptor extends AbstractInterceptor{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	//记录日志文件到${catalina.base}/logs/core/AccessRecordFile.log
	private static Log log = LogFactory.getLog("accessRecordLog");
	
	@SuppressWarnings("unchecked")
	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		
		 Object action = invocation.getAction();
		 Map<String, YN> ruleSettingMap = (Map<String, YN>) EhCacheManager.get(CacheConstants.CONSTANTS_DATE_CACHE, CacheConstants.SYS_RULE_SETTING_KEY);
		 if(Sessions.getSysUser()!=null && action instanceof BaseAuthAction && ruleSettingMap.get("accessLog")==YN.Y){
	    	 SysUser user = Sessions.getSysUser();
	    	 Class<?> actionClass = action.getClass();
	    	 String methodName = invocation.getProxy().getMethod();
		     Method method = actionClass.getMethod(methodName);
		     log.info("本次请求访问的方法有：");
		     log.info("ip:"+Servlets.getClientIp()+",user:"+user.getUserName()+"|"+user.getId());
		     log.info("action:"+(actionClass+"."+method.getName()).substring(6));
		     Map<String,Object> params = (Map<String, Object>) Servlets.getParameters("page");
		     if(params!=null && params.size()>0){
		    	 log.info("parameter："+params.toString());
		     }
		     
		     String result = invocation.invoke();
		     
		     log.info("本次请求结束\n");
		    
		     return result;
	     }
	    
	     return invocation.invoke();
	}
}
