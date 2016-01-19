/**
 * 
 */
package com.core.myCenter.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.core.base.annotation.LoginValidation;
import com.core.base.constants.Constants;
import com.core.base.constants.enums.YN;
import com.core.base.dao.cache.CacheConstants;
import com.core.base.dao.cache.EhCacheManager;
import com.core.base.dao.utils.builder.HqlBuilder;
import com.core.base.entity.Page;
import com.core.base.utils.DateUtils;
import com.core.base.utils.FastMap;
import com.core.base.utils.string.EncodeUtils;
import com.core.base.web.Servlets;
import com.core.base.web.Sessions;
import com.core.base.web.render.JsonResult;
import com.core.base.web.render.Renders;
import com.core.resource.service.ResourceService;
import com.core.system.entity.SysRole;
import com.core.system.entity.SysRuleSetting;
import com.core.system.entity.SysUser;
import com.core.system.entity.UserLoginLog;
import com.core.system.service.DeptService;
import com.core.system.service.UserLoginLogService;
import com.core.system.service.UserService;
import com.opensymphony.xwork2.ActionSupport;

/**
 * <li>项目名称: core</li> <li>功能描述: 个人中心Action</li> <li>版权: Copyright (c) 2015-2022 UniWin Co. Ltd.</li>
 * <li>公司: 中信联信息技术有限公司</li>
 * 
 * @author xcl
 * @version $Id: $
 */
@Scope("prototype")
@Controller("core.MyCenterAction")
public class MyCenterAction extends ActionSupport {

    private static final long serialVersionUID = 1L;

    private Page page = new Page(Constants.PAGE_SIZE);

    // 查询条件
    private String name;
    private String type;
    private String category;
    private String environment;

    private String roleIds;
    private String roleNames;
    private String deptId;
    private String userId;

    // 当前用户
    private SysUser user = Sessions.getSysUser();

    @Autowired
    private ResourceService resourceService;

    @Autowired
    private UserService userService;

    @Autowired
    private DeptService deptService;
    
    @Autowired
    private UserLoginLogService userLoginLogService;

    public String info() throws Exception {
        user = this.userService.get(user.getId());
        return "info";
    }

    public String changePwd() throws Exception {

        return "changePwd";
    }

    /**
     * 
     * <li>功能描述：修改个人信息</li>
     * 
     * @return
     * @throws Exception String
     * @author xcl
     */
    public String changeInfo() throws Exception {
        user = this.userService.get(user.getId());
        List<SysRole> roleList = user.getSysRoles();
        roleNames = "";
        roleIds = "";

        if (roleList != null && roleList.size() > 0) {
            for (SysRole role : roleList) {
                roleNames += "," + role.getRoleName();
                roleIds += "," + role.getId();
            }
            roleNames = roleNames.replaceFirst(",", "");
            roleIds = roleIds.replaceFirst(",", "");
        }

        return "changeInfo";
    }

    /**
     * 
     * <li>功能描述：注册</li>
     * 
     * @return
     * @throws Exception String
     * @author xcl
     */
    @LoginValidation(validate = YN.N)
    public String register() throws Exception {
        roleIds = Constants.DEFAULT_ROLE_IDS;
        deptId = Constants.DEFAULT_DEPART_ID;

        return "register";
    }
    
    @LoginValidation(validate = YN.N)
    public String layerreg() throws Exception {
        roleIds = Constants.LAWYER_ROLE_IDS;
        deptId = Constants.DEFAULT_DEPART_ID;

        return "layerreg";
    }
    
    @LoginValidation(validate = YN.N)
    public String daibiaoreg() throws Exception {
        roleIds = Constants.COMMISSIONER_ROLE_IDS;
        deptId = Constants.DEFAULT_DEPART_ID;

        return "daibiaoreg";
    }
    
    
    @LoginValidation(validate = YN.N)
    public String login() throws Exception {
        roleIds = Constants.DEFAULT_ROLE_IDS;
        deptId = Constants.DEFAULT_DEPART_ID;

        return "loginFront";
    }
    
    @LoginValidation(validate = YN.N)
    public String readAgreement() throws Exception {
        // TODO Auto-generated method stub
        return "readAgreement";
    }
    @LoginValidation(validate = YN.N)
    public String address() throws Exception {
        
        return "address";
        
    }
    @LoginValidation(validate = YN.N)
    public String totallogin() throws Exception {
        
        return "totallogin";
        
    }
    @LoginValidation(validate = YN.N)
    public String totalreg() throws Exception {
        
        return "totalreg";
        
    }
    @LoginValidation(validate = YN.N)
    public String daibiaologin() throws Exception {
        
        return "daibiaologin";
        
    }
    @LoginValidation(validate = YN.N)
    public String layerlogin() throws Exception {
        
        return "layerlogin";
        
    }
    
    public String upload() throws Exception {

        return "upload";
    }

    /**
     * 
     * <li>功能描述：我上传的资源</li>
     * 
     * @return
     * @throws Exception String
     * @author xcl
     */
    public String uploads() throws Exception {
        try {
            Map<String, String> paramMap = new HashMap<String, String>();
            paramMap.put("userId", user.getId());
            if (StringUtils.isNotBlank(name)) {
                paramMap.put("name", "%" + name + "%");
            }
            if (StringUtils.isNotBlank(type)) {
                paramMap.put("type", type);
            }
            if (StringUtils.isNotBlank(category)) {
                paramMap.put("category", category);
            }
            if (StringUtils.isNotBlank(environment)) {
                paramMap.put("environment", "%" + environment + "%");
            }

            page = this.resourceService.findPage(page, "core.findResources", paramMap);
        } catch (Exception e) {
            addActionMessage("对不起，查询出错了");
        }

        return "uploads";
    }

    /**
     * 
     * <li>功能描述：我下载的资源</li>
     * 
     * @return
     * @throws Exception String
     * @author xcl
     */
    public String downloads() throws Exception {
        try {
            String hql = "select resource from ResourceDownloadHistory history, Resource resource "
                + "where history.resourceId = resource.id and history.createUser.id = '"
                + user.getId() + "'";

            page = this.resourceService.findPage(page, new HqlBuilder(hql));
        } catch (Exception e) {
            addActionMessage("对不起，查询出错了");
            e.printStackTrace();
        }

        return "downloads";
    }

    @LoginValidation(validate = YN.N)
    public String saveUser() throws Exception {
        if (StringUtils.isEmpty(userId)) {
            user = new SysUser();
            user.setLoginName(Servlets
                .getStringParameter("loginName", UUID.randomUUID().toString()));
        } else {
            user = this.userService.get(userId);
        }

        user.setUserName(Servlets.getStringParameter("userName", ""));
        user.setSex(Servlets.getStringParameter("sex", "M"));
        if (StringUtils.isNotEmpty(Servlets.getStringParameter("password", ""))) {
            user.setPassWord(EncodeUtils.encodeMd5(Servlets.getStringParameter("password", "")));
            System.out.println(user.getPassWord());
        }
        user.setMailbox(Servlets.getStringParameter("mailbox", ""));
        user.setMphone(Servlets.getStringParameter("mphone", ""));
        user.setWorkPlace(Servlets.getStringParameter("workPlace", ""));
        user.setIdcard(Servlets.getStringParameter("idcard", ""));
        
        user.setCreateTime(DateUtils.getCurrentDate());
        String[] roleIds = getRoleIds().split(",");
        List<SysRole> roleList = new ArrayList<SysRole>();
        SysRole role = null;
        for (String roleId : roleIds) {
            role = new SysRole();
            role.setId(roleId);
            roleList.add(role);
            if(Constants.COMMISSIONER_ROLE_IDS.equals(roleId))
                user.setCommissionerCode(Servlets
                    .getStringParameter("loginName", ""));
            else if(Constants.LAWYER_ROLE_IDS.equals(roleId))
                user.setPracticeCode(Servlets
                    .getStringParameter("loginName", ""));
        }
        if (roleList != null && roleList.size() > 0) {
            user.setSysRoles(roleList);
        }
        if (StringUtils.isBlank(userId)) {
            // 设置用户的主要部门和主要角色
            user.setSysDept(deptService.get(deptId));
            // user.setSysRole(roleService.get(roleId));
            userService.save(user);
            this.saveAfterLogin(user);
            Renders.renderJson(Renders.SAVE_SUCCESS);
        } else {
            user.setSysDept(deptService.get(deptId));
            userService.update(user);
            Renders.renderJson(Renders.UPDATE_SUCCESS);
        }
        return NONE;
    }
    
    public void saveAfterLogin(SysUser sysUser) throws Exception{ 
        
        try {   
            
            HttpSession session =  Servlets.getSession();
            String authCode = (String) session.getAttribute("authCode");
            
            /*if(authCode == null || yzm == null || !authCode.equals(yzm)){
                
                Renders.renderJson(new JsonResult("验证码不正确"));
                return NONE;
            }*/
            
            
            
            session.removeAttribute(Constants.USER_SESSION_KEY); 
            Map<String,String> paramMap = new HashMap<String, String>();
            
           //非cookie登录
           paramMap = new FastMap().newHashMap().set("loginName",sysUser.getLoginName()).set("passWord",sysUser.getPassWord());
           sysUser = userService.findOne("system.findUsers",paramMap); 
           if(sysUser!=null){
               sysUser.setSysRole(sysUser.getSysRoles().get(0));
               sysUser.setRoleId(sysUser.getSysRoles().get(0).getId());
               sysUser.setDepeId(sysUser.getSysDept().getId());
               sysUser.setLoginTime(DateUtils.getCurrentDate());
                     
               session.setAttribute(Constants.USER_SESSION_KEY, sysUser);
           }      
                
        }catch (Exception e){   
            e.printStackTrace();
        }   
    }   
    /**
     * 获取page
     * 
     * @return page page
     */
    public Page getPage() {
        return page;
    }

    /**
     * 设置page
     * 
     * @param page page
     */
    public void setPage(Page page) {
        this.page = page;
    }

    /**
     * 获取user
     * 
     * @return user user
     */
    public SysUser getUser() {
        return user;
    }

    /**
     * 设置user
     * 
     * @param user user
     */
    public void setUser(SysUser user) {
        this.user = user;
    }

    /**
     * 获取name
     * 
     * @return name name
     */
    public String getName() {
        return name;
    }

    /**
     * 设置name
     * 
     * @param name name
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * 获取type
     * 
     * @return type type
     */
    public String getType() {
        return type;
    }

    /**
     * 设置type
     * 
     * @param type type
     */
    public void setType(String type) {
        this.type = type;
    }

    /**
     * 获取category
     * 
     * @return category category
     */
    public String getCategory() {
        return category;
    }

    /**
     * 设置category
     * 
     * @param category category
     */
    public void setCategory(String category) {
        this.category = category;
    }

    /**
     * 获取environment
     * 
     * @return environment environment
     */
    public String getEnvironment() {
        return environment;
    }

    /**
     * 设置environment
     * 
     * @param environment environment
     */
    public void setEnvironment(String environment) {
        this.environment = environment;
    }

    /**
     * 获取roleIds
     * 
     * @return roleIds roleIds
     */
    public String getRoleIds() {
        return roleIds;
    }

    /**
     * 设置roleIds
     * 
     * @param roleIds roleIds
     */
    public void setRoleIds(String roleIds) {
        this.roleIds = roleIds;
    }

    /**
     * 获取roleNames
     * 
     * @return roleNames roleNames
     */
    public String getRoleNames() {
        return roleNames;
    }

    /**
     * 设置roleNames
     * 
     * @param roleNames roleNames
     */
    public void setRoleNames(String roleNames) {
        this.roleNames = roleNames;
    }

    /**
     * 获取deptId
     * 
     * @return deptId deptId
     */
    public String getDeptId() {
        return deptId;
    }

    /**
     * 设置deptId
     * 
     * @param deptId deptId
     */
    public void setDeptId(String deptId) {
        this.deptId = deptId;
    }

    /**
     * 获取userId
     * 
     * @return userId userId
     */
    public String getUserId() {
        return userId;
    }

    /**
     * 设置userId
     * 
     * @param userId userId
     */
    public void setUserId(String userId) {
        this.userId = userId;
    }
}
