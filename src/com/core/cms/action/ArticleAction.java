package com.core.cms.action;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.core.base.annotation.FileUpload;
import com.core.base.annotation.LoginValidation;
import com.core.base.annotation.Menu;
import com.core.base.constants.Constants;
import com.core.base.constants.enums.YN;
import com.core.base.dao.hibernate.BaseHibernateDao;
import com.core.base.dao.utils.builder.HqlBuilder;
import com.core.base.entity.Page;
import com.core.base.utils.DateUtils;
import com.core.base.utils.FastMap;
import com.core.base.utils.LocaleUtils;
import com.core.base.utils.file.UploadUtils;
import com.core.base.web.Servlets;
import com.core.base.web.Sessions;
import com.core.base.web.render.JsonResult;
import com.core.base.web.render.Renders;
import com.core.base.web.struts2.action.BaseUploadFileAction;
import com.core.cms.entity.CmsArticle;
import com.core.cms.entity.CmsArticleAttr;
import com.core.cms.entity.CmsChannel;
import com.core.cms.entity.CmsRoleChannel;
import com.core.cms.service.ArticleService;
import com.core.cms.service.ChannelService;
import com.core.system.entity.SysRole;
import com.core.system.entity.SysUser;
import com.core.system.service.RoleService;
import com.core.upload.entity.UploadFile;
import com.lawsuit.wsla.action.CourtOpenInfoAction;

@Controller("cms.ArticleAction")
@Scope("prototype")
public class ArticleAction extends BaseUploadFileAction<CmsArticle>{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
//	private long articleId;
	private String articleId;
	private String channelId;
	private CmsArticle article;
	private CmsChannel channel;
	private List<CmsChannel> channelList;
	private List<CmsArticleAttr> articleAttrList;
	private Page page = new Page(Constants.PAGE_SIZE);
	
	//private String fckContent;
	//private String fckContentPath;
    //查询条件
    private String title;
    //private String isDraft;
    private String isReleased;
    
    // 当前用户
    private SysUser user=Sessions.getSysUser();
    
	@Autowired
	private ArticleService articleService;
	@Autowired
	private ChannelService channelService;
	@Autowired
    private RoleService roleService;
	@Autowired
    private BaseHibernateDao<CmsRoleChannel> cmsRoleChannelDao;
	//2015-11-20 开庭信息
	@Autowired
	private CourtOpenInfoAction courtOpenInfoAction;
	
	public CmsArticle getModel() {
		return article;
	}
	@Override
	public void prepareModel() throws Exception {
	    channel = channelService.get(channelId);
	    
//		if(articleId==0){
		if(StringUtils.isBlank(articleId)){
			article = new CmsArticle();
			//获取区域
			article.setOrganization(Sessions.getSysUser().getOrganization());
			article.setIsReleased("N");
			article.setCreateTime(DateUtils.getCurrentDate());
			article.setCreateUser(user);
			article.setCmsChannel(channel);
    		//临时设置发布时间
    		article.setReleaseDate(article.getCreateTime());
		}else{
			article = articleService.get(articleId);
			setUploadFileList(getUploadFileService().findByOwnerId(articleId + ""));
		}				
	}

    @Override
    @LoginValidation(validate = YN.N)
    public String detail() throws Exception {
        if (article != null) {
            article.setVisitTotal(article.getVisitTotal() + 1);
            this.articleService.update(article);
        }
        
        return DETAIL;
    }
    
    @LoginValidation(validate = YN.N)
    public String flist() throws Exception {
        channel = channelService.get(channelId);
        try {
            Map<String, String> paramMap = new HashMap<String, String>();

            paramMap.put("channelId", channelId);
            paramMap.put("isReleased", "Y");

            // 单页栏目
            if ("single".equals(channel.getChannelType())) {
                page.setPageSize(1);
            } else {
                page.setPageSize(Integer.parseInt(channel.getSecondPageNum()));
            }

            page = articleService.findPage(page, paramMap);
            
            // 如果是单页栏目，并且该栏目的文章存在，则查询该文章的附件信息，并更新浏览次数
            if ("single".equals(channel.getChannelType()) && page.getTotalRecords() > 0) {
                article = (CmsArticle)page.getList().get(0);
                setUploadFileList(getUploadFileService().findByOwnerId(article.getId() + ""));
                article.setVisitTotal(article.getVisitTotal() + 1);
            }
            channel = channelService.get(channelId);
        } catch (Exception e) {
            addActionMessage("文章系统尚未初始化");
        }

        return "flist";
    }
    
	public String update() throws Exception {
		 return ADD;
	}
   public String add() throws Exception {
       channel = channelService.get(channelId);
       return ADD;
    }
	
    @FileUpload(filePath = "uploadfile/cms/article/picture", isRecordToDB = true)
    public String save() throws Exception {
    	JsonResult jr = null;
//        if (articleId == 0) {
        if (StringUtils.isBlank(articleId)) {
            this.articleService.save(article);
            jr = Renders.SAVE_SUCCESS;
        } else {
            article.setIsReleased("N");// 编辑后发布状态改为未发布
            // TODO: 这里应该重新生成静态页面
            this.articleService.update(article);
            jr = Renders.UPDATE_SUCCESS;
        }
        
        Renders.renderJson(jr);
        return NONE;
	}
   
   /**
    * 
    */
	public String delete() throws Exception {
		String[] strids = Servlets.getRequest().getParameter("ids").split(",");
		articleService.deleteAndUpdatePage(strids);
		Renders.renderJson(Renders.DELETE_SUCCESS);
		return NONE;
	}
	/**
	 * 删除图片
	 * @return
	 * @throws Exception
	 */
	public String deleteUploadFile() throws Exception {
		article = articleService.get(articleId);
		String contentImg = article.getContentImg();
		File file = new File(Servlets.getServletContext().getRealPath("")+"/"+contentImg);   
		file.delete();
		
		article.setContentImg("");
		articleService.update(article);
		Renders.renderJson(Renders.DELETE_SUCCESS);
        return NONE;
	}
	
	@Override
	public String list() throws Exception {
		try {
			Map<String,String> paramMap = new HashMap<String, String>();
			if(!"1".equals(channelId)){
				paramMap.put("channelId", channelId);
				paramMap.put("title", title);
				paramMap.put("isReleased", isReleased);
			}
			page = articleService.findPage(page,paramMap);
			channel = channelService.get(channelId);
		} catch (Exception e) {
			addActionMessage("文章系统尚未初始化");
		}
		return LIST;
	}
    
    /**
     * 
     *<li>功能描述：全站静态化页</li>
     * @return
     * @throws Exception
     * String 
     * @author xcl
     */
    public String staticize() throws Exception {
        return "staticize";
    }
    
    /**
     * 
     *<li>功能描述：前台搜索</li>
     * @return
     * @throws Exception
     * String 
     * @author xcl
     */
    @LoginValidation(validate = YN.N)
    public String search() throws Exception {
        try {
            Map<String,String> paramMap = new HashMap<String, String>();
            paramMap.put("title", title);
            paramMap.put("isReleased", "Y");
            
            page = articleService.findPage(page,paramMap);
        } catch (Exception e) {
            
        }
        
        return "result";
    }

    /**
     * 
     * <li>功能描述：全站静态化，Ajax提交</li>
     * 
     * @return
     * @throws Exception String
     * @author xcl
     */
    @Menu
    public String siteStaticize() throws Exception {
        try {
            this.articleService.siteStaticize();
            Renders.renderJson(new JsonResult(LocaleUtils.getLocaleText("全站静态化成功",
                "Static Site Success")));
        } catch (Exception e) {
            Renders.renderJson(new JsonResult("1", LocaleUtils.getLocaleText(
                "全站静态化失败" + e.getMessage(), "Static Site Failure")));
        }

        return NONE;
    }
    
    /**
     * 下载附件
     */
    @LoginValidation(validate = YN.N)
    public String download()throws Exception{
        return super.download();
    }
    
    /**
     * 根据文章ID下载附件
     */
    @LoginValidation(validate = YN.N)
    public String downloadAtricleFile()throws Exception{
        List<UploadFile> uploadFiles = this.getUploadFileService().findByOwnerId(articleId + "");
        if (uploadFiles != null && uploadFiles.size() > 0) {
            UploadFile uploadFile = uploadFiles.get(0);
            UploadUtils.download(uploadFile.getUploadFileName(), uploadFile.getUploadFilePath());
        }
        return NONE;
    }
	
    /**
     * 
     * <li>功能描述：发布或取消发布文章，（取消发布功能尚不完善，建议直接使用删除）</li>
     * 
     * @return
     * @throws Exception String
     * @author xcl
     */
	public String release() throws Exception {
		String[] ids = Servlets.getRequest().getParameter("ids").split(",");
		String isReleased = Servlets.getRequest().getParameter("isReleased");
		boolean firstPubCourtOpen = true;
		for(String id : ids){
//			article = articleService.get(Long.parseLong(id));
			article = articleService.get(id);
			// 如果文章为首次发布，更新发布时间。重新发布（重新生成静态页）的发布时间不变
			if (article.getIsReleased().equals("N")) {
                article.setIsReleased(isReleased);
                if(firstPubCourtOpen){
                    if("402881fb5098c0fa015098d54e550006".equals(article.getCmsChannel().getId())){
                        UploadFile uf = this.getUploadFileService().findOne(new HqlBuilder("select uf from UploadFile uf where uf.ownerId='"+article.getId()+"' and uf.uploadContentType like '%excel%' order by uf.createTime desc"));
                        if(uf!=null){
                            String path = Servlets.getRequest().getRealPath(uf.getUploadFilePath());
                            int retCode = courtOpenInfoAction.executeMethod(path);
                            if(retCode==0){
                                firstPubCourtOpen=false;
                            }
                        }
                    }
                }
            }
			
            // 如果发布文章，设置发布时间和附件或图片路径
            if ("Y".equals(isReleased)) {
                
                article.setReleaseDate(DateUtils.getCurrentDate());

                // 设置附件或图片路径
                List<UploadFile> uploadFiles = this.getUploadFileService().findByOwnerId(id);
                if (uploadFiles != null && uploadFiles.size() > 0) {
                    article.setContentImg(uploadFiles.get(0).getUploadFilePath());
                }
                
            }
			
			articleService.update(article);
			
			// 如果发布文章，生成静态页面
			if ("Y".equals(isReleased)) {
				articleService.createStaticPage(article, article.getId());
			}
		}
		if ("Y".equals(isReleased)) {
			//发布开庭信息
//			String [] idArray = Servlets.getRequest().getParameter("ids").split(",");
//			for(String id : idArray){
//				this.getUploadFileService().findByOwnerId(id);
//			}
		    
			Renders.renderJson(new JsonResult("发布成功"));
//			Renders.renderJson(new JsonResult("发布成功"));
		}else {
			Renders.renderJson(new JsonResult("取消发布成功"));
		}
		return NONE;
	}
	
	@SuppressWarnings("unchecked")
	@Menu
	public String tree() throws Exception {
	    SysUser user = Sessions.getSysUser();
        SysRole role = new SysRole();
        role = this.roleService.get(user.getRoleId());
	    channelList = new ArrayList<CmsChannel>();
        List<CmsRoleChannel> roleChannelList = cmsRoleChannelDao.findList("system.findRoleChannels",new FastMap().newHashMap().set("roleId", role.getId()).set("isDynamicUrl", "0"));
        if(roleChannelList!=null && roleChannelList.size()>0){
            for(int i=0;i<roleChannelList.size();i++){
                channelList.add(roleChannelList.get(i).getCmsChannel());
            }
        }
        /* 
        Map queryMap = new HashMap();
        queryMap.put("isDynamicUrl", "0");
        queryMap.put("roleid", role.getId());

	    
		channelList = channelService.findList("cms.findChannels",queryMap);*/
		return TREE;
	}

	@SuppressWarnings("unchecked")
	public String generateChannelTree() throws Exception {
		channelList = channelService.findList("cms.findChannels",null);
		return "left";
	}
	
	/**
	 * 首页管理
	 * @return
	 */
	public String managerHomePage(){
		return "managerHomePage";
	}
	//----------------------getter/setter方法------------------------------
	public String getChannelId() {
		return channelId;
	}

	public String getArticleId() {
		return articleId;
	}
	public void setArticleId(String articleId) {
		this.articleId = articleId;
	}
	public void setChannelId(String channelId) {
		this.channelId = channelId;
	}
	public List<CmsChannel> getChannelList() {
		return channelList;
	}
	public void setChannelList(List<CmsChannel> channelList) {
		this.channelList = channelList;
	}
	public List<CmsArticleAttr> getArticleAttrList() {
		return articleAttrList;
	}
	public void setArticleAttrList(List<CmsArticleAttr> articleAttrList) {
		this.articleAttrList = articleAttrList;
	}
	public Page getPage() {
		return page;
	}
	public void setPage(Page page) {
		this.page = page;
	}
	public void setArticleService(ArticleService articleService) {
		this.articleService = articleService;
	}
	public void setChannelService(ChannelService channelService) {
		this.channelService = channelService;
	}
	/*public void setChannelModelService(ChannelModelService channelModelService) {
		this.channelModelService = channelModelService;
	}*/
	public CmsChannel getChannel() {
		return channel;
	}
	public void setChannel(CmsChannel channel) {
		this.channel = channel;
	}
	/*public String getFckContent() {
		return fckContent;
	}
	public void setFckContent(String fckContent) {
		this.fckContent = fckContent;
	}
	public String getFckContentPath() {
		return fckContentPath;
	}
	public void setFckContentPath(String fckContentPath) {
		this.fckContentPath = fckContentPath;
	}
    */
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
//	public String getIsDraft() {
//		return isDraft;
//	}
//	public void setIsDraft(String isDraft) {
//		this.isDraft = isDraft;
//	}
	public String getIsReleased() {
		return isReleased;
	}
	public void setIsReleased(String isReleased) {
		this.isReleased = isReleased;
	}
	public void setUser(SysUser user) {
		this.user = user;
	}
	public SysUser getUser() {
		return user;
	}
	
}
