package com.lawsuit.wsla.action;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.core.base.annotation.Menu;
import com.core.base.constants.Constants;
import com.core.base.dao.utils.builder.HqlBuilder;
import com.core.base.entity.Page;
import com.core.base.utils.DateUtils;
import com.core.base.web.Sessions;
import com.core.base.web.render.Renders;
import com.core.base.web.struts2.action.BaseCrudAction;
import com.core.system.entity.SysUser;
import com.core.system.service.UserService;
import com.lawsuit.wsla.entity.LsXf;
import com.lawsuit.wsla.service.XfService;

@Controller("XfAction")
@Scope("prototype")
public class XfAction extends BaseCrudAction<LsXf>{

	/**
	 * 
	 */
	private static final long serialVersionUID = -6932883307633505820L;
	
	private LsXf lsXf;
	private String id;
	private String username;
	
	private Page page = new Page(Constants.PAGE_SIZE);
	 // 当前用户
    private SysUser user=Sessions.getSysUser();
    
    
	@Autowired
	private XfService xfService;
	@Autowired
	private UserService userServiece;

	@Override
	public String add() throws Exception {
		
		return ADD;
	}

	@Override
	public String delete() throws Exception {
		// TODO Auto-generated method stub
		
		return null;
	}

	@Override
	@Menu
	public String detail() throws Exception {
		
		lsXf = xfService.get(id);
		SysUser replyUser= userServiece.get(lsXf.getReplyUserId());
        if(replyUser!=null){
            username = replyUser.getUserName();
        }
		return DETAIL;
	}
	public String fdetail() throws Exception {
		
		lsXf = xfService.get(id);
		SysUser replyUser= this.userServiece.findOne(new HqlBuilder("from SysUser u where u.id='"+lsXf.getReplyUserId()+"'"));
		if(replyUser!=null){
		    username = replyUser.getUserName();
		}
		
		return "fdetail";
	}
	@Menu
	public String showReply() throws Exception {
		
		lsXf = xfService.get(id);
		return "replyXf";
	}

	@Override
	@Menu
	public String list() throws Exception {
		String hql = "select xf from LsXf xf where 1=1 ";
		if(lsXf != null && StringUtils.isNotBlank(lsXf.getReplyWay())){
			hql += " and xf.replyWay ='"+lsXf.getReplyWay()+"'";
		}
		//hql += " order by xf.createTime";
		HqlBuilder hqlBuilder = new HqlBuilder(hql);
		page = xfService.findPage(page, hqlBuilder);
		return LIST;
	}
	
	public String flist() throws Exception {
		
		if(user == null){
			return "flist";
		}
		String hql = "select xf from LsXf xf where 1=1 ";
		
		hql += " and xf.createUser.id ='"+user.getId()+"'";
		
		//hql += " order by xf.createTime";
		HqlBuilder hqlBuilder = new HqlBuilder(hql);
		page = xfService.findPage(page, hqlBuilder);
		return "flist";
	}

	@Override
	public void prepareModel() throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public String save() throws Exception {
		lsXf.setCreateTime(DateUtils.getCurrentDate());
		lsXf.setCreateUser(user);
		lsXf.setReplyWay("3");
		xfService.save(lsXf);
		
		 Renders.renderJson(Renders.SAVE_SUCCESS);
	        
	    return NONE;
	}

	//信访回复
	@Override
	public String update() throws Exception {
		LsXf alsXf = xfService.get(lsXf.getId());
		alsXf.setReplyTime(DateUtils.getCurrentDate());
		alsXf.setReplyUserId(user.getId());
		alsXf.setReplyWay(lsXf.getReplyWay());
		alsXf.setBz(lsXf.getBz());
		if(StringUtils.isNotBlank(lsXf.getReplyContent()) ){
			alsXf.setReplyWay("4"); //留言回复
		}
		alsXf.setReplyContent(lsXf.getReplyContent());
		
		this.xfService.update(alsXf);
        Renders.renderJson(Renders.UPDATE_SUCCESS);
		return null;
	}

	@Override
	public LsXf getModel() {
		// TODO Auto-generated method stub
		return null;
	}

	public void setLsXf(LsXf lsXf) {
		this.lsXf = lsXf;
	}

	public LsXf getLsXf() {
		return lsXf;
	}

	public void setPage(Page page) {
		this.page = page;
	}

	public Page getPage() {
		return page;
	}

	public SysUser getUser() {
		return user;
	}

	public void setUser(SysUser user) {
		this.user = user;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getId() {
		return id;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getUsername() {
		return username;
	}

}
