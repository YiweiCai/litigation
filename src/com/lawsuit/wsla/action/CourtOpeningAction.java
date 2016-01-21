package com.lawsuit.wsla.action;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.core.base.annotation.LoginValidation;
import com.core.base.constants.Constants;
import com.core.base.constants.enums.YN;
import com.core.base.dao.utils.builder.HqlBuilder;
import com.core.base.entity.Page;
import com.core.base.utils.DateUtils;
import com.core.base.utils.bean.ReflectionUtils;
import com.core.base.web.Servlets;
import com.core.base.web.Sessions;
import com.core.base.web.render.Renders;
import com.core.system.entity.SysUser;
import com.lawsuit.wsla.entity.CourtOpening;
import com.lawsuit.wsla.service.CourtOpeningService;

@Controller("CourtOpeningAction")
@Scope("prototype")
public class CourtOpeningAction{
	private String requestNameSpace = (String) Servlets.getSession().getAttribute("requestNameSpace");
	/**
     * 
     */
	private static final long serialVersionUID = 1755712981022129213L;
	@Autowired
	private CourtOpeningService courtOpeningService;

	private List<CourtOpening> listCo;
	private CourtOpening co;
	private String type;
	private Page page = new Page(Constants.PAGE_SIZE);

	public Page getPage() {
		return page;
	}

	public void setPage(Page page) {
		this.page = page;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public List<CourtOpening> getListCo() {
		return listCo;
	}

	public void setListCo(List<CourtOpening> listCo) {
		this.listCo = listCo;
	}

	public CourtOpening getCo() {
		return co;
	}

	public void setCo(CourtOpening co) {
		this.co = co;
	}

	public String list() throws Exception {
//		page = this.courtOpeningService.findPage(page, new HqlBuilder("from CourtOpening lo"));
		page = this.courtOpeningService.findPage(page, new HqlBuilder("from CourtOpening lo where lo.organization='"+requestNameSpace+"'"));

		return "list";

	}

	// 跳转上传视频页面
	public String uploadVideo() throws Exception {

		return "uploadVideo";
	}
	
	@LoginValidation(validate = YN.N)
	public String flist() throws Exception {
		page.setPageSize(9);
//		page = this.courtOpeningService.findPage(page, new HqlBuilder("from CourtOpening lo "));
		String requestNameSpace = (String) Servlets.getSession().getAttribute("requestNameSpace");
		page = this.courtOpeningService.findPage(page, new HqlBuilder("from CourtOpening lo where lo.organization='"+requestNameSpace+"'"));
		return "flist";

	}

	public String add() throws Exception {

		return "edit";

	}

	public String edit() throws Exception {
		String coid = Servlets.getStringParameter("coid", "");
		if (!"".equals(coid) && coid != null) {
			co = this.courtOpeningService.get(coid);
		}
		return "edit";

	}

	@LoginValidation(validate = YN.N)
	public String view() throws Exception {

		String coid = Servlets.getStringParameter("coid", "");
		if (!"".equals(coid) && coid != null) {
			co = this.courtOpeningService.get(coid);
		}
		return "view";

	}

	@LoginValidation(validate = YN.Y)
	public String save() throws Exception {
		String coid = Servlets.getStringParameter("coid", "");
		SysUser sysUser = new SysUser();
		sysUser = Sessions.getSysUser();
		if (!"".equals(coid) && coid != null) {
			co.setUpdateTime(DateUtils.getCurrentDate());
			co.setUpdateUserId(sysUser.getId());
			String hql = ReflectionUtils.setObjToHql(co, coid);
			

			this.courtOpeningService.batch(new HqlBuilder(hql));
		} else {
			co.setCreateUser(sysUser);
			co.setCreateTime(DateUtils.getCurrentDate());
			this.courtOpeningService.save(co);
		}
		Renders.renderJson(Renders.SAVE_SUCCESS);
		return null;

	}

	public String delete() throws Exception {
		return null;

	}

}
