package com.lawsuit.wsla.action;

import java.io.FileInputStream;
import java.io.IOException;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.core.base.web.Servlets;
import com.core.base.web.Sessions;
import com.core.system.entity.SysUser;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.core.base.annotation.LoginValidation;
import com.core.base.constants.Constants;
import com.core.base.constants.enums.YN;
import com.core.base.dao.hibernate.BaseHibernateDao;
import com.core.base.dao.utils.builder.HqlBuilder;
import com.core.base.entity.Page;
import com.core.cms.entity.CmsArticle;
import com.core.cms.entity.CmsArticleAttr;
import com.core.cms.entity.CmsChannel;
import com.core.cms.service.ChannelService;
import com.lawsuit.wsla.dao.CourtDao;
import com.lawsuit.wsla.entity.CourtOpenInfo;
import com.lawsuit.wsla.service.CourtOpenInfoService;
import com.opensymphony.xwork2.ActionSupport;

@Controller("com.lawsuit.wsla.action.CourtOpenInfoAction")
public class CourtOpenInfoAction extends ActionSupport{
	
	@Autowired
	private BaseHibernateDao baseHibernateDao;
	@Autowired
	private CourtDao courtDao;
	@Autowired
	private CourtOpenInfoService courtOpenInfoService;
	private List<CourtOpenInfo> courtOpenInfoList; //开庭信息列表
	private Page page = new Page(Constants.PAGE_SIZE);
	@Autowired
	private ChannelService channelService;
	/**
	 * 
	 * @param fileAbsolutePath
	 * @return  retCode: 0:成功；-1：sheet1为空；-2:异常
	 */
	public int executeMethod(String fileAbsolutePath){
		SysUser sysUser = Sessions.getSysUser();
		String organization = sysUser.getOrganization();
			try {
				int invokeTaskRetCode = courtOpenInfoService.invokeTask(fileAbsolutePath,organization);
				System.err.println("发布excel返回结果"+invokeTaskRetCode);
				return invokeTaskRetCode;
			} catch (Exception e) {
				// TODO Auto-generated catch block
				return -2;
				
			}
	}

	@LoginValidation(validate = YN.N)
	public String list(){
		page = courtOpenInfoService.findPage(page);
		System.out.println(page.getList().size());
//		courtOpenInfoList = courtOpenInfoService.getCourtOpenInfoList();
		return SUCCESS;
	}


	public List<CourtOpenInfo> getCourtOpenInfoList() {
		return courtOpenInfoList;
	}


	public void setCourtOpenInfoList(List<CourtOpenInfo> courtOpenInfoList) {
		this.courtOpenInfoList = courtOpenInfoList;
	}


	public Page getPage() {
		return page;
	}


	public void setPage(Page page) {
		this.page = page;
	}

	
	
	

}
