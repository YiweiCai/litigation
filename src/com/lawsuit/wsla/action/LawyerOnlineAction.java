package com.lawsuit.wsla.action;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.core.base.annotation.LoginValidation;
import com.core.base.annotation.Validation;
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
import com.lawsuit.wsla.entity.LawyerOnline;
import com.lawsuit.wsla.service.LawyerOnlineService;
import com.opensymphony.xwork2.ActionSupport;


@Controller("LawyerOnlineAction")
@Scope("prototype")
public class LawyerOnlineAction extends ActionSupport
{

    /**
     * 
     */
    private static final long serialVersionUID = 1755712981022129213L;
    @Autowired
    private LawyerOnlineService lawyerOnlineService;
    
    
    
    private List<LawyerOnline> listLo;
    private LawyerOnline lo;
    private String type;
    private Page page = new Page(Constants.PAGE_SIZE);
    
    
    
    public Page getPage()
    {
        return page;
    }



    public void setPage(Page page)
    {
        this.page = page;
    }



    public String getType()
    {
        return type;
    }



    public void setType(String type)
    {
        this.type = type;
    }



    public List<LawyerOnline> getListLo()
    {
        return listLo;
    }



    public void setListLo(List<LawyerOnline> listLo)
    {
        this.listLo = listLo;
    }

    

    public LawyerOnline getLo()
    {
        return lo;
    }



    public void setLo(LawyerOnline lo)
    {
        this.lo = lo;
    }



    public String list() throws Exception{
        SysUser sysUser = new SysUser();
        sysUser = Sessions.getSysUser();
        String hql="from LawyerOnline lo where 1=1 ";
        String status = Servlets.getStringParameter("status", "");
        if(!StringUtils.isEmpty(type)){
            hql+=" and lo.type='"+type+"' ";
        }
        
        if("1".equals(status)){
            hql+=" and lo.status='"+status+"' and lo.replyUserId='"+sysUser.getId()+"' ";
        }else if("0".equals(status)){
            hql+=" and (lo.status='0' or lo.status is null ) ";
        }
        
        page = this.lawyerOnlineService.findPage(page,new HqlBuilder(hql));
        
        return "list";
        
        
    }
    public String flist() throws Exception{
        page.setPageSize(3);
        SysUser sysUser = Sessions.getSysUser();
        page = this.lawyerOnlineService.findPage(page,new HqlBuilder("from LawyerOnline lo where type='"+type+"' and lo.createUser.id='"+sysUser.getId()+"'"));
        
        return "flist";
        
        
    }
    
    public String add() throws Exception{
        
        return "add";
        
    }
    public String edit() throws Exception{
        String loid = Servlets.getStringParameter("loid", "");
        if(!"".equals(loid)&&loid!=null){
            lo = this.lawyerOnlineService.get(loid);
        }
        return "edit";
        
    }
    public String view() throws Exception{
        
        String loid = Servlets.getStringParameter("loid", "");
        if(!"".equals(loid)&&loid!=null){
            lo = this.lawyerOnlineService.get(loid);
        }
        return "view";
        
        
    }
    @LoginValidation(validate = YN.Y)
    public String save() throws Exception{
        String loid = Servlets.getStringParameter("loid", "");
        SysUser sysUser = new SysUser();
        sysUser = Sessions.getSysUser();
        if(!"".equals(loid)&&loid!=null){
            lo.setReplyTime(DateUtils.getCurrentDate());
            lo.setReplyUserId(sysUser.getId());
            lo.setReplyUserName(sysUser.getUserName());
            String hql = ReflectionUtils.setObjToHql(lo, loid);;
            
            this.lawyerOnlineService.batch(new HqlBuilder(hql));
        }else{
            lo.setStatus("0");
            lo.setCreateUser(sysUser);
            lo.setCreateTime(DateUtils.getCurrentDate());
            this.lawyerOnlineService.save(lo);
        }
        Renders.renderJson(Renders.SAVE_SUCCESS);
        return null;
        
    }
    
    public String delete() throws Exception{
        return null;
        
    }
    
}
