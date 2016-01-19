package com.core.base.web;

import javax.servlet.http.HttpSession;

import com.core.base.constants.Constants;
import com.core.system.entity.SysUser;
/**
 * 1、获得session id
 * 2、从session中获取当前用户
 * 3、存放新的用户信息到session
 * @author yeshujun
 */
public class Sessions {
	
	public Sessions() {
		
	}
	
	/**
	 * 获得sessionid
	 * @return session id
	 */
	public static String getSessionId(){
		return Servlets.getRequest().getSession().getId();
	}
	/**
	 * 从session中取到当前用户
	 */
	public static SysUser getSysUser(){
		SysUser sysUser = null;
		HttpSession session =  Servlets.getSession();
		if(session!=null){
			sysUser = (SysUser) session.getAttribute(Constants.USER_SESSION_KEY);
		}
		return sysUser;
	}
	/**
	 * 设置新的用户信息到session
	 * @param sysUser 新的用户
	 */
	public static SysUser setNewSysUser(SysUser sysUser){
		HttpSession session =  Servlets.getSession();
		if(session!=null){
			session.setAttribute(Constants.USER_SESSION_KEY, sysUser);
		}
		return sysUser;
	}
	
}
