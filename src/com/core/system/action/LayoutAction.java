package com.core.system.action;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.core.base.dao.cache.CacheConstants;
import com.core.base.dao.cache.EhCacheManager;
import com.core.base.dao.utils.builder.HqlBuilder;
import com.core.base.entity.Page;
import com.core.base.web.Servlets;
import com.core.base.web.Sessions;
import com.core.base.web.render.EasyUiResult;
import com.core.base.web.render.JsonResult;
import com.core.base.web.render.Renders;
import com.core.system.entity.SysMenu;
import com.core.system.entity.SysRole;
import com.core.system.entity.SysUser;
import com.core.system.service.MenuService;
import com.core.system.service.RoleService;
import com.core.system.service.UserService;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.lawsuit.wsla.service.LaxxService;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.Preparable;

/**
 * 系统页面布局
 * 
 * @author yeshujun 2009-03-21 晚
 */
@Controller("system.action.LayoutAction")
@Scope("prototype")
public class LayoutAction extends ActionSupport implements Preparable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Page page = new Page(100);
	private SysUser user;
	private Set<SysMenu> menuSet;
	private List<SysMenu> menuList;
	private String changeRoleId;
	@Autowired
	private RoleService roleService;
	@Autowired
	private UserService userService;
	@Autowired
	private MenuService menuService;
	@Autowired
	private LaxxService laxxService;

	public void prepare() throws Exception {
		// 第一次登录从session中获得用户，登录以后的页面刷新不再重复从session中获得
		if (user == null) {
			user = Sessions.getSysUser();
		}
	}

	public String layout() throws Exception {
		SysRole role = new SysRole();
		if (StringUtils.isEmpty(changeRoleId)) {
			role = roleService.get(user.getRoleId());// user.getSysRoles().get(0);
		} else {// 切换角色
			role = roleService.get(changeRoleId);
		}

		// 获得菜单层级结构，下面的办法真的很烂
		menuSet = role.getSysMenus();
		List<String> menuPaths = new ArrayList<String>();

		if (menuSet != null && menuSet.size() > 0) {

			menuList = new ArrayList<SysMenu>();
			List<SysMenu> subList = null;

			for (SysMenu m : menuSet) {// 获得一级菜单
				if (m.getSysMenu() != null) {
					if ("1".equals(m.getSysMenu().getId())) {
						menuList.add(m);
					}
				}
				if (StringUtils.isNotBlank(m.getMenuPath())) {
					menuPaths.add(m.getMenuPath());
				}
			}
			if (menuList.size() > 0) {
				for (SysMenu m : menuList) {// 获得二级菜单
					subList = new ArrayList<SysMenu>();
					for (SysMenu m1 : menuSet) {
						if (m1.getSysMenu() != null) {
							if (m.getId().equals(m1.getSysMenu().getId())) {
								subList.add(m1);
							}
						}
					}
					m.setSubList(subList);
				}

				for (SysMenu m : menuList) {// 获得三级菜单
					for (SysMenu m2 : m.getSubList()) {
						subList = new ArrayList<SysMenu>();
						for (SysMenu m1 : menuSet) {
							if (m1.getSysMenu() != null) {
								if (m2.getId().equals(m1.getSysMenu().getId())) {
									subList.add(m1);
								}
							}
						}
						m2.setSubList(subList);
					}
				}
			}
		}

		user.setRoleId(role.getId());
		user.setSysRole(role);
		user.setMenuPaths(menuPaths);
		// 存放国际化
		// Servlets.getSession().put("LOCALE", getLocale());

		return "layout";

	}

	@SuppressWarnings("unchecked")
	public String daiBan() throws Exception {
		/*user = Sessions.getSysUser();
		List<String> menu = user.getMenuPaths();
		List<SysMenu> list = new ArrayList<SysMenu>();
		for (String m : menu) {
			String hql1 = "from SysMenu sm where sm.menuPath='" + m + "'";
			SysMenu sysm = menuService.findOne(new HqlBuilder(hql1));
			if (sysm.getId().equals("402881f14ee34f5d014ee3519d010000")
					|| sysm.getId().equals("2c928a40507ac98a01507ad1745f0000")
					|| sysm.getId().equals("2c928a40507ac98a01507ad4c9760062")
					|| sysm.getId().equals("2c928a40507ac98a01507ad591770063")) {
				list.add(sysm);
			}

		}
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("kao", list);
		Servlets.getRequest().setAttribute("gaga", map);
		System.out.println(list.size());*/
		SysRole role = new SysRole();
		//2015-01 ： 新增二级页之后，判断来源
		String requestNameSpace = (String) Servlets.getSession().getAttribute("requestNameSpace");
		
		if (StringUtils.isEmpty(changeRoleId)) {
			role = roleService.get(user.getRoleId());// user.getSysRoles().get(0);
		} else {// 切换角色
			role = roleService.get(changeRoleId);
		}
		menuSet = role.getSysMenus();
		
		Map<String, Object> map=new HashMap<String, Object>();
		
		for(SysMenu m: menuSet){
			Map<String, Object> o=new HashMap<String, Object>();
			String hql = "";
			int a=0;
			if("402881f14ee34f5d014ee3519d010000".equals(m.getId())){
//				hql="select count(*) from LsLaxx ls where ls.state=0";
				hql="select count(*) from LsLaxx ls where ls.state=0 and organization='"+requestNameSpace+"'";
				a = laxxService.findCount(new HqlBuilder(hql));
				o.put("num", a);
				o.put("mid", m.getId());
//				o.put("mpath", m.getMenuPath());
				o.put("mpath","/"+requestNameSpace+m.getMenuPath());
				map.put("yjsh", o);
			}
			if("2c928a40507ac98a01507ad1745f0000".equals(m.getId())){
//				hql="select count(*) from LsLaxx ls where ls.state=1";
				hql="select count(*) from LsLaxx ls where ls.state=1 and organization='"+requestNameSpace+"'";
				a = laxxService.findCount(new HqlBuilder(hql));
				o.put("num", a);
				o.put("mid", m.getId());
//				o.put("mpath", m.getMenuPath());
				o.put("mpath", "/"+requestNameSpace+m.getMenuPath());
				map.put("ejsh", o);
			}
			if("2c928a40507ac98a01507ad4c9760062".equals(m.getId())){
//				hql="select count(*) from LsLaxx ls where ls.state=2";
				hql="select count(*) from LsLaxx ls where ls.state=2  and organization='"+requestNameSpace+"'";
				a = laxxService.findCount(new HqlBuilder(hql));
				o.put("num", a);
				o.put("mid", m.getId());
//				o.put("mpath", m.getMenuPath());
				o.put("mpath","/"+requestNameSpace+m.getMenuPath());
				map.put("yyly", o);
			}
			if("2c928a40507ac98a01507ad591770063".equals(m.getId())){
//				hql="select count(*) from LsXf lx where lx.replyWay='0' or lx.replyWay is null ";
				hql="select count(*) from LsXf lx where lx.replyWay='0' or lx.replyWay is null and organization='"+requestNameSpace+"'";
				a = laxxService.findCount(new HqlBuilder(hql));
				o.put("num", a);
				o.put("mid", m.getId());
//				o.put("mpath", m.getMenuPath());
				o.put("mpath", "/"+requestNameSpace+m.getMenuPath());
				map.put("phdy", o);
			}
			
			
			
		}
		/*String hql2="select count(*) from LsLaxx ls where ls.state=0";
		String hql3="select count(*) from LsLaxx ls where ls.state=1";
		String hql4="select count(*) from LsLaxx ls where ls.state=2";
		String hql5="select count(*) from LsXf lx ";
		int a=laxxService.findCount(new HqlBuilder(hql2));
		int b=laxxService.findCount(new HqlBuilder(hql3));
		int c=laxxService.findCount(new HqlBuilder(hql4));
		int d=laxxService.findCount(new HqlBuilder(hql5));*/
		/*if(list.size()>0){
			System.out.println("一级审核："+a);
			System.out.println("二级审核："+b);
			System.out.println("预约来院时间："+c);
			System.out.println("判后答疑回复："+d);
		}*/
		Renders.renderJson(map);
		return NONE;
	}

	/**
	 * 在线用户
	 * 
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public String listOnlineUser() throws Exception {
		// 获得当前在线用户的id List
		List<String> userIdList = new ArrayList<String>();

		Map<String, SysUser> onlineUserMap = (Map<String, SysUser>) EhCacheManager
				.getAll(CacheConstants.HTTP_SESSION_CACHE);

		Collection<SysUser> users = onlineUserMap.values();
		Iterator<SysUser> iterator = users.iterator();
		while (iterator.hasNext()) {
			userIdList.add(iterator.next().getId());
		}

		page = userService.findUsers(page, "", "", "", userIdList);

		return "onlineUser";
	}

	/**
	 * 查询在线用户数量
	 * 
	 * @return
	 * @throws Exception
	 */
	public String getOnlineUserCount() throws Exception {
		Renders.renderHtml(EhCacheManager.getAll(
				CacheConstants.HTTP_SESSION_CACHE).size());
		return NONE;
	}

	/**
	 * 我要留言
	 * 
	 * @return
	 */
	public String leaveAMessage() {
		return "leaveAMessage";
	}

	/**
	 * 在线聊天
	 * 
	 * @return
	 */
	public String onlineChart() {
		return "onlineChart";
	}

	public SysUser getUser() {
		return user;
	}

	public void setUser(SysUser user) {
		this.user = user;
	}

	public Set<SysMenu> getMenuSet() {
		return menuSet;
	}

	public void setMenuSet(Set<SysMenu> menuSet) {
		this.menuSet = menuSet;
	}

	public List<SysMenu> getMenuList() {
		return menuList;
	}

	public void setMenuList(List<SysMenu> menuList) {
		this.menuList = menuList;
	}

	public String getChangeRoleId() {
		return changeRoleId;
	}

	public void setChangeRoleId(String changeRoleId) {
		this.changeRoleId = changeRoleId;
	}

	public Page getPage() {
		return page;
	}

	public void setPage(Page page) {
		this.page = page;
	}
}
