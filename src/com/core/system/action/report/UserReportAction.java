package com.core.system.action.report;

import java.io.File;
import java.io.FileInputStream;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.apache.commons.lang.StringUtils;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.core.base.entity.Page;
import com.core.base.utils.file.UploadUtils;
import com.core.base.utils.report.ExcelUtils;
import com.core.base.utils.report.PdfUtils;
import com.core.base.utils.string.EncodeUtils;
import com.core.base.utils.string.StringEncodeUtils;
import com.core.base.web.Servlets;
import com.core.base.web.render.EasyUiResult;
import com.core.base.web.render.Renders;
import com.core.base.web.struts2.action.BaseAuthAction;
import com.core.system.entity.SysDept;
import com.core.system.entity.SysRole;
import com.core.system.entity.SysUser;
import com.core.system.service.DeptService;
import com.core.system.service.RoleService;
import com.core.system.service.UserService;

/**
 * 用户报表
 * @author yeshujun
 */
@Controller("system.action.report.UserReportAction")
@Scope("prototype")
public class UserReportAction extends BaseAuthAction{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String id;
	private SysUser user;
	//用户id
	private String userName;
	private String deptId;
	private String roleIds="";
	private String roleNames;
	
	private File upload; //附件
	
	@Autowired
	private UserService userService;
	@Autowired
	private DeptService deptService;
	@Autowired
	private RoleService roleService;
	
     /**
      * 通过excel导入用户	
      * @return
      */
	 public String toImportUser(){
		 return "toImportUser";
	 }
	/**
	 * 下载excel模板
	 * @return
	 * @throws Exception
	 */
	public String download()throws Exception{
		UploadUtils.download("用户模板.xls","/uploadfile/templete/user_templete.xlsx");
       return NONE;
	}
	
	/**
	 * 导出用户列表excel
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public String exportExcel()throws Exception{
	    Page page = new Page(10000);
		page = userService.findUsers(page, deptId,roleIds,userName,null);
		List<SysUser> list = page.getList();
		//对于不少来自数据库的、在getter/setter方法中设置的数据，调用getter/setter方法，刷新数据
		for(SysUser u : list){
			u.getSexTemp();
			u.getDeptNameTemp();
			u.getRoleNameTemp();
		}
		//excel模板
		Workbook wb = ExcelUtils.getWorkbook("/uploadfile/templete/user_templete.xlsx");
		Sheet sheet = wb.getSheetAt(0);
		
		//导出的列
		String[] propertyNames = {"userName","enUserName","birthday","sexTemp","ophone","mphone","mailbox","deptNameTemp","roleNameTemp"};
		ExcelUtils.toCellByList(sheet, 2, 0, list, propertyNames);
		Renders.renderExcel(wb, "用户列表.xlsx");
		return NONE;
		//return "exportExcel";
	}
	/**
	 * 导出一个用户详细信息到excel
	 * @return
	 * @throws Exception
	 */
	public String exportExcelDetail() throws Exception{
		user = userService.get(id);
		String roleNames = "";
		List<SysRole> roleList = user.getSysRoles();
		if(roleList!=null && roleList.size()>0){
			for(SysRole role : roleList){
				roleNames+=","+role.getRoleName();
			}
			roleNames = roleNames.replaceFirst(",", "");
		}

		Workbook wb = ExcelUtils.getWorkbook("/uploadfile/templete/user_detail_templete.xlsx");
		Sheet sheet = wb.getSheetAt(0);
		ExcelUtils.toCellByValue(sheet, 2,1,user.getLoginName());
		ExcelUtils.toCellByValue(sheet, 4,1,user.getUserName());
		ExcelUtils.toCellByValue(sheet, 4,3,user.getEnUserName());
		ExcelUtils.toCellByValue(sheet, 5,1,user.getBirthday());
		ExcelUtils.toCellByValue(sheet, 5,3,user.getSex().equals("F")?"女":"男");
		ExcelUtils.toCellByValue(sheet, 6,1,user.getSysDept().getDeptName());
		ExcelUtils.toCellByValue(sheet, 6,3,roleNames);
		ExcelUtils.toCellByValue(sheet, 7,1,user.getOphone());
		ExcelUtils.toCellByValue(sheet, 7,3,user.getMphone());
		ExcelUtils.toCellByValue(sheet, 8,1,user.getMailbox());
		ExcelUtils.toCellByValue(sheet, 8,3,user.getRegisterTime());
		ExcelUtils.toCellByValue(sheet, 9,1,user.getWorkPlace());

		Renders.renderExcel(wb, "用户详细信息.xlsx");
		return NONE;
	}
	
	/**
	 * 导入用户
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
    public String importExcel() throws Exception {
		String msg = "导入成功";
		
        Workbook wb = ExcelUtils.getWorkbook(new FileInputStream(upload));
		Sheet sheet = wb.getSheetAt(0);
		
	    String[] propertyNames = {"userName","enUserName","birthday","sex","ophone","mphone","mailbox","deptNameTemp","roleNameTemp"};
	    List<SysUser> userListTemp = ExcelUtils.toBeanList(sheet, 2, 0, SysUser.class, propertyNames);
		List<String> errorMsgList = ExcelUtils.errorMsgList;
		List<SysUser> userList = new ArrayList<SysUser>();
		
	    Map<String,SysDept> deptMap = (Map<String, SysDept>) deptService.findMap("system.findDepts","deptName",SysDept.class, null);
	    Map<String,SysRole> roleMap = (Map<String, SysRole>) roleService.findMap("system.findRoles","roleName",SysRole.class, null);
	    
		int i=2;
		for(SysUser u : userListTemp){
			i++;
			SysDept dept = deptMap.get(u.getDeptNameTemp().trim());
        	if(dept==null){
        		msg = "第"+i+"行，部门："+u.getDeptNameTemp()+"在数据库中不存在\n";
        		errorMsgList.add(msg);
        	}
        	
        	List<SysRole> roles = new ArrayList<SysRole>();
        	String[] roleNameArr = u.getRoleNameTemp().split(",");
        	SysRole role = null;
        	for(String rn : roleNameArr){
        		role = roleMap.get(rn.trim());
        		if(role==null){
        			msg = "第"+i+"行，角色："+rn+"在数据库中不存在\n";
        			errorMsgList.add(msg);
        		}
        		roles.add(role);
        	}
        	
        	u.setSysDept(dept);
        	u.setSysRoles(roles);
        	u.setPassWord(EncodeUtils.encodeMd5(u.getPassWord()));
        	userList.add(u);
        	
		}
		if(errorMsgList.size()==0){
			userService.saveUserList(userList);
			Renders.renderJson(new EasyUiResult(msg));
		}else{
			throw new Exception(errorMsgList+"");
			//Renders.renderJson(new EasyUiResult("1",errorMsgList));
		}
        return NONE;
	}
	
	
	
	/**
	 * 导出word
	 * @return
	 * @throws Exception 
	 */
	public String exportWord() throws Exception{
		Page page = new Page(10000);
		page = userService.findUsers(page, deptId,roleIds,userName,null);
		return "exportWord";
	}

	public String exportWordDetail() throws Exception{
		user = userService.get(id);
		List<SysRole> roleList = user.getSysRoles();
		if(roleList!=null && roleList.size()>0){
			for(SysRole role : roleList){
				roleNames+=","+role.getRoleName();
			}
			roleNames = roleNames.replaceFirst(",", "");
		}
		return "exportWordDetail";
	}
	
	
	/**
	 * 导出pdf
	 * @return
	 * @throws Exception 
	 */
	public String exportPdf() throws Exception{
		
		Map<String,String> paramMap = new HashMap<String,String>();
		paramMap.put("userName", userName);
		paramMap.put("deptId", deptId);
		paramMap.put("roleIds", roleIds);
		
		String targetPath = "/pdffile/user/"+UUID.randomUUID().toString()+"/";
		String pdfFileName = "用户信息列表.pdf";
		//生成pdf
		PdfUtils.createPdf(Servlets.genUrl("userreport_renderPdf.do", paramMap), targetPath, pdfFileName);
		//输出到客户端
		UploadUtils.download(pdfFileName, targetPath+pdfFileName);
		return NONE;
	}
	
	
	public String renderPdf() throws Exception{
		if(StringUtils.isNotBlank(userName)){
			userName = StringEncodeUtils.iso88591ToUtf8(URLDecoder.decode(userName,"UTF-8"));
		}
		Page page = new Page(10000);
		page = userService.findUsers(page, deptId,roleIds,userName,null);
		return "renderPdf";
	}
	public String exportPdfDetail() throws Exception{
		
		Map<String,String> paramMap = new HashMap<String,String>();
		paramMap.put("id", id);
		
		String targetPath = "/pdffile/user/"+UUID.randomUUID().toString()+"/";
		String pdfFileName = "用户信息.pdf";
		//生成pdf
		PdfUtils.createPdf(Servlets.genUrl("userreport_renderPdfDetail.do", paramMap), targetPath, pdfFileName);
		//输出到客户端
		UploadUtils.download(pdfFileName, targetPath+pdfFileName);
		return NONE;
	}
	
	public String renderPdfDetail() throws Exception{
		user = userService.get(id);
		//setUploadFileList(getUploadFileService().findByOwnerId(id));
		List<SysRole> roleList = user.getSysRoles();
		if(roleList!=null && roleList.size()>0){
			for(SysRole role : roleList){
				roleNames+=","+role.getRoleName();
			}
			roleNames = roleNames.replaceFirst(",", "");
		}
		return "renderPdfDetail";
	}
	
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getDeptId() {
		return deptId;
	}
	public void setDeptId(String deptId) {
		this.deptId = deptId;
	}
	public String getRoleIds() {
		return roleIds;
	}
	public void setRoleIds(String roleIds) {
		this.roleIds = roleIds;
	}
	public File getUpload() {
		return upload;
	}
	public void setUpload(File upload) {
		this.upload = upload;
	}
	public String getRoleNames() {
		return roleNames;
	}
	public void setRoleNames(String roleNames) {
		this.roleNames = roleNames;
	}
}
