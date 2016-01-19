package com.lawsuit.wsla.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.core.base.annotation.FileUpload;
import com.core.base.annotation.LoginValidation;
import com.core.base.annotation.Menu;
import com.core.base.constants.Constants;
import com.core.base.constants.enums.YN;
import com.core.base.dao.utils.Querys;
import com.core.base.dao.utils.builder.HqlBuilder;
import com.core.base.entity.Page;
import com.core.base.utils.DateUtils;
import com.core.base.utils.FastMap;
import com.core.base.utils.string.EncodeUtils;
import com.core.base.web.Servlets;
import com.core.base.web.Sessions;
import com.core.base.web.render.EasyUiResult;
import com.core.base.web.render.JsonResult;
import com.core.base.web.render.Renders;
import com.core.base.web.struts2.action.BaseUploadFileAction;
import com.core.system.entity.SysDept;
import com.core.system.entity.SysRole;
import com.core.system.entity.SysUser;
import com.core.system.service.DeptService;
import com.core.system.service.RoleService;
import com.core.system.service.UserService;
import com.lawsuit.wsla.entity.LsHistory;
import com.lawsuit.wsla.entity.LsLaxx;
import com.lawsuit.wsla.entity.LsYast;
import com.lawsuit.wsla.service.LaxxHistoryService;
import com.lawsuit.wsla.service.LaxxService;
import com.lawsuit.wsla.service.YastService;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.RandomStringUtils;
import org.apache.struts2.ServletActionContext;

@Controller("LaxxAction")
@Scope("prototype")
public class LaxxAction extends BaseUploadFileAction<LsLaxx> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private LsLaxx lsLaxx;
	private LsYast lsYast;
	private List<LsYast> yastList;
	private String id;
	private String state;
	private String shResult;
	private List<LsHistory> listHis;
	private String yyrq; // 预约日期
	// 当前用户
	private SysUser user = Sessions.getSysUser();

	@Autowired
	private LaxxService laxxService;

	@Autowired
	private YastService yastService;
	@Autowired
	private LaxxHistoryService laxxHistoryService;

	private Page page = new Page(Constants.PAGE_SIZE);

	public LsLaxx getModel() {
		return lsLaxx;
	}

	@SuppressWarnings("unchecked")
	public void prepareModel() throws Exception {

	}

	public String showYyly() {
		return "addYyly";
	}

	// 预约来院
	public String yyly() throws Exception {
		lsLaxx = laxxService.get(id);
		lsLaxx.setState("3");
		lsLaxx.setYyrq(yyrq);
		this.laxxService.update(lsLaxx);
		String remark = Servlets.getStringParameter("remark", "");

		LsHistory lsHistory = new LsHistory();
		lsHistory.setCreateTime(DateUtils.getCurrentDate());
		lsHistory.setCreateUserId(user.getId());
		lsHistory.setCreateUserName(user.getUserName());
		lsHistory.setLaxxId(lsLaxx.getId());
		lsHistory.setLaxxStatus(lsLaxx.getState());
		lsHistory.setOpinion("已预约来院时间");
		lsHistory.setRemark(remark);
		this.laxxHistoryService.save(lsHistory);
		Renders.renderJson(new EasyUiResult("0", "提交成功"));
		return null;
	}

	@SuppressWarnings("unchecked")
	@Menu
	public String list() throws Exception {
		String hql = "select laxx from LsLaxx laxx where 1=1 ";
		if (lsLaxx != null && StringUtils.isNotBlank(lsLaxx.getAjlx())) {
			hql += " and laxx.ajlx ='" + lsLaxx.getAjlx() + "'";
		}
		if (lsLaxx != null && StringUtils.isNotBlank(lsLaxx.getState())) {
			hql += " and laxx.state ='" + lsLaxx.getState() + "'";
		}

		HqlBuilder hqlBuilder = new HqlBuilder(hql);
		page = laxxService.findPage(page, hqlBuilder);
		return LIST;
	}

	@LoginValidation(validate = YN.N)
	public String showSearch() {

		return "searchLaxx";
	}

	@LoginValidation(validate = YN.Y)
	public String caseProceed() throws Exception {
		// 按身份证号、手机号查
		/*
		 * HttpServletRequest request = ServletActionContext.getRequest();
		 * HttpSession session = request.getSession(); String authCode =
		 * (String) session.getAttribute("authCode");
		 * 
		 * if(authCode == null || yzm == null || !authCode.equals(yzm)){
		 * 
		 * Renders.renderJson(new JsonResult("验证码不正确")); return NONE; }
		 * 
		 * 
		 * String hql =
		 * "select laxx from LsLaxx as laxx where exists (select 1 from LsYast as yast where yast.laxxId = laxx.id "
		 * ;
		 * 
		 * if(lsYast == null ){
		 * 
		 * return "flist"; } if(lsYast.getSjhm() != null &&
		 * !"".equals(lsYast.getSjhm())){ hql +=
		 * " and yast.sjhm = '"+lsYast.getSjhm()+"'"; } if(lsYast.getSfz() !=
		 * null && !"".equals(lsYast.getSfz())){ hql +=
		 * " and yast.sfz = '"+lsYast.getSfz()+"'"; } hql += " )";
		 * 
		 * 
		 * 
		 * HqlBuilder hqlBuilder = new HqlBuilder(hql); page =
		 * laxxService.findPage(page, hqlBuilder);
		 */

		if (user == null) {
			return "caseProceed";
		}
		String hql = "select laxx from LsLaxx as laxx where createUser.id='"
				+ user.getId() + "' and laxx.dqjd=4";
		HqlBuilder hqlBuilder = new HqlBuilder(hql);
		page = laxxService.findPage(page, hqlBuilder);

		return "caseProceed";

	}

	// 审核
	@SuppressWarnings("unchecked")
	@Menu
	public String shenhe() throws Exception {
		lsLaxx = laxxService.get(id);
		HqlBuilder hqlBuilder = new HqlBuilder(
				"from LsYast as yast where yast.laxxId = '" + lsLaxx.getId()
						+ "'");
		yastList = yastService.findList(hqlBuilder);
		setUploadFileList(getUploadFileService().findByOwnerId(id));
		listHis = this.laxxHistoryService.findList(new HqlBuilder(
				"from LsHistory h where h.laxxId = '" + lsLaxx.getId()
						+ "' order by h.createTime asc"));
		// HqlBuilder hqlBuilder = new
		// HqlBuilder("select laxx from LsLaxx laxx,LsYast yast where laxx.id=yast.lsLaxx.id and laxx.id="+id);
		// page = laxxService.findPage(page, hqlBuilder);
		return "shenhe";
	}

	/**
	 * 下载附件
	 */
	@LoginValidation(validate = YN.N)
	public String download() throws Exception {
		return super.download();
	}

	public String myCase() throws Exception {
		// TODO Auto-generated method stub
		String op = Servlets.getStringParameter("op", "");
		Servlets.getRequest().setAttribute("op", op);
		return "myCase";
	}

	@LoginValidation(validate = YN.Y)
	public String add() throws Exception {
		// TODO Auto-generated method stub
		return ADD;
	}

	@Override
	public String delete() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	// 删除未完成的诉讼请求
	public void deleteWWC() throws Exception {
		// TODO Auto-generated method stub
		String id = Servlets.getRequest().getParameter("id");

		String hql = "delete LsYast ly where ly.laxxId='" + id + "'";
		this.yastService.batch(new HqlBuilder(hql));
		this.laxxService.deleteById(id);
		weiTiJiao();
	}

	@Override
	@SuppressWarnings("unchecked")
	@Menu
	@LoginValidation(validate = YN.Y)
	public String detail() throws Exception {
		lsLaxx = laxxService.get(id);
		HqlBuilder hqlBuilder = new HqlBuilder(
				"from LsYast as yast where yast.laxxId = '" + lsLaxx.getId()
						+ "'");
		yastList = yastService.findList(hqlBuilder);
		listHis = this.laxxHistoryService.findList(new HqlBuilder(
				"from LsHistory h where h.laxxId = '" + lsLaxx.getId()
						+ "' order by h.createTime asc"));
		setUploadFileList(getUploadFileService().findByOwnerId(id));
		return "detail";
	}

	@Override
	// 第一步保存
	// @FileUpload(filePath = "uploadfile/lawsuit/laxx", isRecordToDB = true)
	public String save() throws Exception {
		String coid = Servlets.getRequest().getParameter("coid");
		LsLaxx result = new LsLaxx();
		lsLaxx.setCreateTime(DateUtils.getCurrentDate());
		lsLaxx.setCreateUser(user);
		lsLaxx.setState("0");
		lsLaxx.setShResult("1");
		lsLaxx.setDqjd("1");
		lsLaxx.setOrganization((String)Servlets.getSession().getAttribute("requestNameSpace"));
		// 如果有主表id 那么更新主表信息
		if (coid != null && !coid.equals("")) {
			lsLaxx.setId(coid);
			result = this.laxxService.update(lsLaxx);

		} else {
			result = this.laxxService.save(lsLaxx);
			LsHistory lsHistory = new LsHistory();
			lsHistory.setCreateTime(DateUtils.getCurrentDate());
			lsHistory.setCreateUserId(user.getId());
			lsHistory.setCreateUserName(user.getUserName());
			lsHistory.setLaxxId(lsLaxx.getId());
			lsHistory.setLaxxStatus(lsLaxx.getState());
			lsHistory.setOpinion("立案申请");
			this.laxxHistoryService.save(lsHistory);

		}
		if (yastList != null && yastList.size() > 0) {
			for (LsYast yast : yastList) {
				yast.setLaxxId(result.getId());
				// 如果有id 则表示修改结果提交 否则是新建
				if (yast.getId() != null && !yast.getId().equals("")) {
					yastService.update(yast);
				} else {
					yastService.save(yast);
				}
			}
		}

		Servlets.getRequest().setAttribute("coid", result.getId());
		Servlets.getRequest().setAttribute("dqjd", "");
		return "beiGao";
	}

	// 第二部保存被告信息
	public String saveBG() throws Exception {
		String coid = Servlets.getRequest().getParameter("coid");
		Servlets.getRequest().setAttribute("coid", coid);
		lsLaxx.setId(coid);
		lsLaxx.setCreateTime(DateUtils.getCurrentDate());
		lsLaxx.setCreateUser(user);
		lsLaxx.setState("0");
		lsLaxx.setShResult("1");
		lsLaxx.setDqjd("2");
		lsLaxx.setOrganization((String)Servlets.getSession().getAttribute("requestNameSpace"));
		this.laxxService.update(lsLaxx);
		if (yastList != null && yastList.size() > 0) {
			for (LsYast yast : yastList) {
				yast.setLaxxId(coid);
				if (yast.getId() != null && !yast.getId().equals("")) {
					yastService.update(yast);
				} else {
					yastService.save(yast);
				}
			}
		}
		return "SSQQ";
	}

	// 第三部保存诉讼请求
	public String saveSSQQ() throws Exception {
		String coid = Servlets.getRequest().getParameter("coid");
		Servlets.getRequest().setAttribute("coid", coid);
		lsLaxx.setCreateTime(DateUtils.getCurrentDate());
		lsLaxx.setId(coid);
		lsLaxx.setCreateUser(user);
		lsLaxx.setState("0");
		lsLaxx.setShResult("1");
		lsLaxx.setDqjd("3");
        lsLaxx.setOrganization((String)Servlets.getSession().getAttribute("requestNameSpace"));
		// lsLaxx.setLsYasts(yastList);
		this.laxxService.update(lsLaxx);
		return "laxx4";
	}

	@FileUpload(filePath = "uploadfile/lawsuit/laxx", isRecordToDB = true)
	public String save4() throws Exception {
		String coid = Servlets.getRequest().getParameter("coid");
		Servlets.getRequest().setAttribute("coid", coid);
		String hql = "from LsLaxx ls where ls.id='" + coid + "'";
		lsLaxx = this.laxxService.findOne(new HqlBuilder(hql));
		lsLaxx.setDqjd("4");
        lsLaxx.setOrganization((String)Servlets.getSession().getAttribute("requestNameSpace"));
		this.laxxService.update(lsLaxx);
		Renders.renderJson(Renders.SAVE_SUCCESS);
		return null;
	}

	// 返回上一步
	public String goBack() throws Exception {
		// goTo代表去第几步
		String goTo = Servlets.getRequest().getParameter("goTo");
		String coid = Servlets.getRequest().getParameter("coid");
		Servlets.getRequest().setAttribute("coid", coid);

		String hql = "from LsLaxx ls where ls.id='" + coid + "'";
		lsLaxx = this.laxxService.findOne(new HqlBuilder(hql));
		if (goTo.equals("1")) {
			// 如果是去第一步
			String hqlOne = "from LsYast ly where ly.laxxId='" + coid
					+ "' and ly.ssdw=0";
			page = this.yastService.findPage(page, new HqlBuilder(hqlOne));
			return "addLaxx";
		} else if (goTo.equals("2")) {
			String hqlTwo = "from LsYast ly where ly.laxxId='" + coid
					+ "' and ly.ssdw=1";
			page = this.yastService.findPage(page, new HqlBuilder(hqlTwo));
			Servlets.getRequest().setAttribute("dqjd", 2);
			return "beiGao";
		} else if (goTo.equals("3")) {

			return "SSQQ";
		} else {

			return null;
		}
	}

	public String weiTiJiao() throws Exception {
		String id = user.getId();

		String hql = "from LsLaxx ls where ls.createUser='" + id
				+ "' and ls.dqjd !=4";
		page = laxxService.findPage(page, new HqlBuilder(hql));
		return "weiTiJiao";
	}

	// 审核
	@Override
	@Menu
	public String update() throws Exception {
		lsLaxx = laxxService.get(id);
		lsLaxx.setState(state);
		lsLaxx.setShResult(shResult);
		lsLaxx.setHandleTime(DateUtils.getCurrentDate());
		lsLaxx.setHandleUserId(user.getId());
		this.laxxService.update(lsLaxx);
		String remark = Servlets.getStringParameter("remark", "");
		LsHistory lsHistory = new LsHistory();
		lsHistory.setCreateTime(DateUtils.getCurrentDate());
		lsHistory.setCreateUserId(user.getId());
		lsHistory.setCreateUserName(user.getUserName());
		lsHistory.setLaxxId(lsLaxx.getId());
		lsHistory.setLaxxStatus(lsLaxx.getState());
		lsHistory.setRemark(remark);
		if ("1".equals(shResult)) {
			lsHistory.setOpinion("审核通过");
		} else {
			lsHistory.setOpinion("审核不通过");
		}

		this.laxxHistoryService.save(lsHistory);

		Renders.renderJson(Renders.UPDATE_SUCCESS);
		return null;
	}

	public LsLaxx getLsLaxx() {
		return lsLaxx;
	}

	public void setLsLaxx(LsLaxx lsLaxx) {
		this.lsLaxx = lsLaxx;
	}

	public Page getPage() {
		return page;
	}

	public void setPage(Page page) {
		this.page = page;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public void setUser(SysUser user) {
		this.user = user;
	}

	public SysUser getUser() {
		return user;
	}

	public void setYastList(List<LsYast> yastList) {
		this.yastList = yastList;
	}

	public List<LsYast> getYastList() {
		return yastList;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getState() {
		return state;
	}

	public LsYast getLsYast() {
		return lsYast;
	}

	public void setLsYast(LsYast lsYast) {
		this.lsYast = lsYast;
	}

	public void setYyrq(String yyrq) {
		this.yyrq = yyrq;
	}

	public String getYyrq() {
		return yyrq;
	}

	public List<LsHistory> getListHis() {
		return listHis;
	}

	public void setListHis(List<LsHistory> listHis) {
		this.listHis = listHis;
	}

	public String getShResult() {
		return shResult;
	}

	public void setShResult(String shResult) {
		this.shResult = shResult;
	}

}
