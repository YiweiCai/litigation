package com.core.system.action;

import java.util.List;
import java.util.Map;
import java.util.Random;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.core.base.annotation.Menu;
import com.core.base.constants.Constants;
import com.core.base.entity.Page;
import com.core.base.utils.DateUtils;
import com.core.base.utils.FastMap;
import com.core.base.web.Servlets;
import com.core.base.web.Sessions;
import com.core.base.web.render.EasyUiResult;
import com.core.base.web.render.Renders;
import com.core.base.web.struts2.action.BaseCrudAction;
import com.core.cms.entity.CmsChannel;
import com.core.cms.entity.CmsRoleChannel;
import com.core.cms.service.ChannelService;
import com.core.system.entity.SysMenu;
import com.core.system.entity.SysRole;
import com.core.system.entity.SysRoleMenu;
import com.core.system.service.MenuService;
import com.core.system.service.RoleService;
import com.google.common.collect.Lists;
/**
 * 角色管理action
 * @author yeshujun
 *2009-03-28 晚
 */
@Controller("system.action.RoleAction")
@Scope("prototype")
public class RoleAction extends BaseCrudAction<SysRole>{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String id;
	
	private SysRole role;
	private SysRole sysRole;
	private List<SysRole> roleList;
	private List<SysMenu> menuList;
	private List<CmsChannel> channelList;
	
	private Page page = new Page(Constants.PAGE_SIZE);
	@Autowired
	private RoleService roleService;
	@Autowired
	private MenuService menuService;
	@Autowired
    private ChannelService channelService;
	
	private String checkIds;
	
	private String checkLmIds;
	
	private String rwAuths;

	public SysRole getModel() {
		return role;
	}
	@SuppressWarnings("unchecked")
	@Override
	public void prepareModel() throws Exception {
		//新增角色
		if(StringUtils.isBlank(id)){
			role = new SysRole();
			role.setCreateTime(DateUtils.getCurrentDate());
			role.setCreateUser(Sessions.getSysUser());
			if(StringUtils.isNotEmpty(sysRole.getId())){
				//新增非一级角色
				role.setSysRole(roleService.get(sysRole.getId()));
			}
		}
		//修改角色
		else{
			role = roleService.get(id);
			menuList = menuService.findList("system.findMenus",null);
			List<SysRoleMenu> roleMenuList = roleService.findSysRoleMenuByRoleId(role.getId());
			if(roleMenuList!=null && roleMenuList.size()>0){
				for(SysRoleMenu rm : roleMenuList){
					checkIds += (","+rm.getSysMenu().getId()+"|"+rm.getAuth());
				}
			}
			channelList = channelService.findList("cms.findChannels",new FastMap().newHashMap());
			List<CmsRoleChannel> roleChannelList = roleService.findSysCmsRoleChannelByRoleId(role.getId());
            if(roleChannelList!=null && roleChannelList.size()>0){
                for(CmsRoleChannel rc : roleChannelList){
                    checkLmIds += (","+rc.getCmsChannel().getId()+"|"+rc.getAuth());
                }
            }
			
		}
	}

	/**
	 * 角色门树
	 * @return
	 * @throws Exception
	 */
	@Menu
	public String tree() throws Exception {
		roleList = roleService.findRoles(null);
		return TREE;
	}
	public String update(){
		return UPDATE;
	}
	@SuppressWarnings("unchecked")
	public String add()throws Exception{
		try{
			sysRole = roleService.get(id);
			channelList = channelService.findList("cms.findChannels",new FastMap().newHashMap());
			//获得功功能集(菜单)
			menuList = menuService.findList("system.findMenus",null);
		}catch (Exception e) {
			addActionMessage("没有上级角色，请先选择上级角色");
		}
		return ADD;
	}
	@Override
	public String detail() throws Exception {
		return DETAIL;
	}
	
	@Override
	public String save() throws Exception {
		if(StringUtils.isEmpty(id)){
			//生成层级，层级末尾是个随机数
	    	SysRole parentRole = role.getSysRole();
	    	String parentRoleLevel = parentRole.getRoleLevel();
	    	int maxRoleLevel = roleService.getCountSubRoleNumByParentId(parentRole.getId())+1;
	    	role.setRoleLevel(parentRoleLevel+"_"+(maxRoleLevel+"")+"_"+Math.abs(new Random().nextInt()) % 100 + 1);
	    	
			roleService.saveOrUpdate(role,checkIds,rwAuths,checkLmIds);
			//Renders.renderText(role.getRoleName()+"  创建成功");
			Renders.renderJson(new EasyUiResult("0","保存成功",Lists.newArrayList(role.getId())));
		}else{
			roleService.saveOrUpdate(role,checkIds,rwAuths, checkLmIds);
			roleService.saveOrUpdateSysRoleMenu(role, checkIds,rwAuths);
			roleService.saveOrUpdateCmsRoleChannel(role, checkLmIds);
			Renders.renderJson(Renders.UPDATE_SUCCESS);
		}
		return NONE;
	}
	
	@SuppressWarnings("unchecked")
	public String list() throws Exception {
		try{
			setId(id);
			Map<String,String> paramMap = new FastMap().newHashMap().set("parentId", id);
			page = roleService.findPage(page,"system.findRoles",paramMap);
		}catch (Exception e) {
			addActionMessage("不能获得角色列表，请检查查询条件");
		}
		return SUCCESS;
	}
	public String delete() throws Exception {
		String ids = Servlets.getRequest().getParameter("ids");
		roleService.deleteByIds(ids.split(","));
		Renders.renderJson(Renders.DELETE_SUCCESS);
		return NONE;
	}
	
	//-----------------------以下是getter/setter方法----------------------------------
	public SysRole getRole() {
		return role;
	}
	public void setRole(SysRole role) {
		this.role = role;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	public SysRole getSysRole() {
		return sysRole;
	}
	public void setSysRole(SysRole sysRole) {
		this.sysRole = sysRole;
	}
	public Page getPage() {
		return page;
	}
	public void setPage(Page page) {
		this.page = page;
	}
	public List<SysRole> getRoleList() {
		return roleList;
	}
	public void setRoleList(List<SysRole> roleList) {
		this.roleList = roleList;
	}
	public List<SysMenu> getMenuList() {
		return menuList;
	}
	public void setMenuList(List<SysMenu> menuList) {
		this.menuList = menuList;
	}
	public String getCheckIds() {
		return checkIds;
	}
	public void setCheckIds(String checkIds) {
		this.checkIds = checkIds;
	}
	public String getRwAuths() {
		return rwAuths;
	}
	public void setRwAuths(String rwAuths) {
		this.rwAuths = rwAuths;
	}
    public List<CmsChannel> getChannelList()
    {
        return channelList;
    }
    public void setChannelList(List<CmsChannel> channelList)
    {
        this.channelList = channelList;
    }
    public String getCheckLmIds()
    {
        return checkLmIds;
    }
    public void setCheckLmIds(String checkLmIds)
    {
        this.checkLmIds = checkLmIds;
    }
	
    
    

}
