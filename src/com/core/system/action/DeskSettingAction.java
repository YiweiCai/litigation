package com.core.system.action;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.core.base.annotation.LoginValidation;
import com.core.base.constants.enums.YN;
import com.core.base.entity.Page;
import com.core.base.web.Sessions;
import com.core.base.web.struts2.action.BaseAuthAction;
import com.core.oa.article.service.OaArticleService;
import com.core.oa.msg.service.MessageBoardService;
import com.core.system.entity.SysUser;
import com.core.system.entity.Zmsz;
import com.core.system.service.UserService;
/**
 * 桌面设置action
 * @author yeshujun
 */ 
@Controller("system.action.DeskSettingAction")
@Scope("prototype")
public class DeskSettingAction extends BaseAuthAction{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private List<Zmsz> zmszs = new ArrayList<Zmsz>();
	private Page page = new Page(9);
	@Autowired
	private UserService userService;
	@Autowired
	private MessageBoardService messageBoardService;//留言板
	@Autowired
	private OaArticleService oaArticleService;
	
	@LoginValidation(validate=YN.N)
	public String execute() throws Exception {
		SysUser user =  userService.get(Sessions.getSysUser().getId());
		String myselfDesk =  user.getMyselfDesk();
		//如果用户没有设置桌面，则使用该用户所属角色的桌面
		if(StringUtils.isEmpty(myselfDesk)){
			myselfDesk = Sessions.getSysUser().getSysRole().getDeskSetting();
		}
		
		if(StringUtils.isNotBlank(myselfDesk)){
			String[] desks = myselfDesk.split(",");//1,2,3,4,5,6,7,8,9,10
			int zmszRow = new BigDecimal((float)desks.length/2).setScale(0, BigDecimal.ROUND_HALF_UP).intValue();//行数
			Zmsz zmsz = null;
			for(int i=0;i<zmszRow;i++){//i=0,1,2,3,4,5
				zmsz = new Zmsz();
				for(int k=0;k<2;k++){
					zmsz.setZmszCol1(desks[2*i].trim());//0,1;2,3;4,5;6,7
					if(desks.length!=2*i+1){
						zmsz.setZmszCol2(desks[2*i+1].trim());
					}
				}
				zmszs.add(zmsz);
			}
		}
		return "success";
	}

	//留言板
	@LoginValidation(validate=YN.N)
	public String msgboard()throws Exception{
		page = messageBoardService.findPage(page);
		return "msgboard";
	}
	
	@LoginValidation(validate=YN.N)
	public String news()throws Exception{//
		page = oaArticleService.findPage(page, "news","N");
		return "news";
	}
	
	@LoginValidation(validate=YN.N)
	public String gonggao()throws Exception{
		page = oaArticleService.findPage(page, "gonggao","N");
		return "gonggao";
	}
	
	@LoginValidation(validate=YN.N)
	public String peixun()throws Exception{
		page = oaArticleService.findPage(page, "peixun","N");
		return "peixun";
	}
	
	@LoginValidation(validate=YN.N)
	public String huodong()throws Exception{
		page = oaArticleService.findPage(page, "huodong","N");
		return "huodong";
	}
	
	@LoginValidation(validate=YN.N)
	public String xiance()throws Exception{
		page = oaArticleService.findPage(page, "xiance","N");
		return "xiance";
	}
	
	public List<Zmsz> getZmszs() {
		return zmszs;
	}
	public void setZmszs(List<Zmsz> zmszs) {
		this.zmszs = zmszs;
	}
	public Page getPage() {
		return page;
	}

	public void setPage(Page page) {
		this.page = page;
	}
}
