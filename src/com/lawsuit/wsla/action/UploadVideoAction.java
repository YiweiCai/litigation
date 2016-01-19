package com.lawsuit.wsla.action;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.core.base.annotation.FileUpload;
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
import com.core.base.web.struts2.action.BaseUploadFileAction;
import com.core.system.entity.SysUser;
import com.core.upload.entity.UploadFile;
import com.core.upload.service.UploadFileService;
import com.lawsuit.wsla.entity.UploadVideo;
import com.lawsuit.wsla.service.UploadVideService;
import com.opensymphony.xwork2.ActionSupport;

@Controller("UploadVideoAction")
@Scope("prototype")
/*
 * 姜昊
 */
public class UploadVideoAction extends BaseUploadFileAction<UploadVideo> {

	private static final long serialVersionUID = -6941950001496220183L;
	@Autowired
	private UploadVideService uploadVideService;
	private UploadVideo uv;
	private Page page = new Page(Constants.PAGE_SIZE);
	@Autowired
	private UploadFileService uploadFileService;
	private UploadFile uf;

	public Page getPage() {
		return page;
	}

	public void setPage(Page page) {
		this.page = page;
	}
	

	public UploadFile getUf() {
		return uf;
	}

	public void setUf(UploadFile uf) {
		this.uf = uf;
	}

	public String edit() throws Exception {
		String coid = Servlets.getStringParameter("coid", "");
		if (!coid.equals("") && coid != null) {
			String hql="from UploadFile uf where uf.ownerId='"+coid+"' and uf.uploadContentType='image/jpeg'";
			uf = this.uploadFileService.findOne(new HqlBuilder(hql));
			uv = this.uploadVideService.get(coid);
		}
		return "edit";
	}

	public String listVideo() throws Exception {
		String hql = "from UploadVideo uv";
		page = this.uploadVideService.findPage(page, new HqlBuilder(hql));
		return "list";
	}

	@LoginValidation(validate = YN.N)
	// 免登陆验证
	public String flistVideo() throws Exception {
		String hql = "select uv,uf.uploadFilePath from UploadVideo uv,UploadFile uf where uf.ownerId = uv.id and uf.uploadContentType like '%image%' ";
		page = this.uploadVideService.findPage(page, new HqlBuilder(hql));

		return "flist";
	}

	@LoginValidation(validate = YN.N)
	public String view() throws Exception {
		String coid = Servlets.getStringParameter("coid", "");
		if (!"".equals(coid) && coid != null) {
			uv = this.uploadVideService.get(coid);

		}

		return "view";
	}

	// ----------------------------------------------------------------------------------------
	@Override
	public UploadVideo getModel() {
		// TODO Auto-generated method stub
		return uv;
	}

	@SuppressWarnings("unchecked")
	public void prepareModel() throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public String add() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String update() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String detail() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String list() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String delete() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	// 上传视频缩略图
	@Override
	@FileUpload(filePath = "uploadfile/cms/video/picture", isRecordToDB = true)
	public String save() throws Exception {

		String coid = Servlets.getStringParameter("coid", "");
		SysUser sysUser = new SysUser();
		sysUser = Sessions.getSysUser();
		
		if (!coid.equals("") && coid != null) {
			String hql = ReflectionUtils.setObjToHql(uv, coid);
			this.uploadVideService.batch(new HqlBuilder(hql));
		} else {
			uv.setCreateUser(sysUser);
			uv.setCreateTime(DateUtils.getCurrentDate());
			this.uploadVideService.save(uv);

		}
		Renders.renderJson(Renders.SAVE_SUCCESS);

		return null;
	}

	public UploadVideo getUv() {
		return uv;
	}

	public void setUv(UploadVideo uv) {
		this.uv = uv;
	}

}
