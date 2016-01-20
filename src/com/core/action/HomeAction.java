/**
 * 
 */
package com.core.action;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.core.base.annotation.LoginValidation;
import com.core.base.constants.Constants;
import com.core.base.constants.enums.YN;
import com.core.base.dao.utils.builder.HqlBuilder;
import com.core.base.entity.Page;
import com.core.base.web.Servlets;
import com.core.base.web.Sessions;
import com.core.cms.entity.CmsArticle;
import com.core.cms.service.ArticleService;
import com.core.resource.entity.Resource;
import com.core.resource.service.ResourceService;
import com.core.system.entity.SysUser;
import com.lawsuit.wsla.entity.CourtOpening;
import com.lawsuit.wsla.service.CourtOpeningService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

/**
 * <li>项目名称: core</li> <li>功能描述: 首页Action类</li>
 * 
 * @author xcl
 * @version $Id: $
 */
@Scope("prototype")
@Controller("core.HomeAction")
public class HomeAction extends ActionSupport {

    private static final long serialVersionUID = 1L;

    private Page page = new Page(Constants.PAGE_SIZE);

    /**
     * 新闻资讯
     */
    List<CmsArticle> articleNews;
    /**
     * 通知公告
     */
    List<CmsArticle> articleNotice;
    /**
     * 流程指南
     */
    List<CmsArticle> articleProcedure;
    /**
     * 裁判文书
     */
    List<CmsArticle> articleJudgment;
    /**
     * 减刑假释
     */
    List<CmsArticle> articleParole;
    /**
     * 经典案例
     */
    List<CmsArticle> articleTypicalCases;
    /**
     * 法官风采
     */
    List<CmsArticle> articleJudge;
    /**
     * 
     * 庭审直播
     */
    List<CourtOpening> courtOpening;
    
    /**
     * 平台介绍
     */
    CmsArticle articleIntro;

    /**
     * 精品推荐
     */
    List<Resource> qualityResources;

    /**
     * 资源分类信息
     */
    List<?> categories;

    // 当前用户
    private SysUser user = Sessions.getSysUser();

    @Autowired
    ResourceService resourceService;

    @Autowired
    ArticleService articleService;
    
    @Autowired
    CourtOpeningService courtOpeningService;
    /**
     * 
     * <li>功能描述：首页</li>
     * 
     * @return
     * @throws Exception String
     * @author xcl
     */
    @LoginValidation(validate = YN.N)
    public String index() throws Exception {
    	String requestNameSpace = (String) Servlets.getSession().getAttribute("requestNameSpace");
    	
//        // 查询新闻资讯
//        findArticleNews();
//
//        // 查询平台介绍
//        findArticleIntro();
//
//        // 查询精品资源
//        findQualityResources();
//
//        // 查询资源分类统计信息
//        findCategories();
        findArticleNotice(requestNameSpace);
        findArticleProcedure(requestNameSpace);
        findArticleJudgment(requestNameSpace);
        findArticleParole(requestNameSpace);
        
        findArticleTypicalCases(requestNameSpace);
        findArticleJudge(requestNameSpace);
        findCourt(requestNameSpace);
        if(requestNameSpace.indexOf("fy")==-1){
        	Servlets.getSession().putValue("requestNameSpace", "zzfy");
        }
        return "index";
    }
    /**
     * <li>功能描述：查询通知公告</li>
     * 
     * @throws Exception void
     * @author xcl
     */
    @SuppressWarnings("unchecked")
    private void findArticleNotice(String requestNameSpace) throws Exception {
        page.setPageSize(5);
//        String hql = "from CmsArticle article where article.isReleased='Y' and article.cmsChannel.id='402881f7508813af0150886dcc4e0000' order by article.createTime desc";
        String hql = "from CmsArticle article where article.isReleased='Y' and article.organization='"+requestNameSpace+"' and article.cmsChannel.id='402881f7508813af0150886dcc4e0000' order by article.createTime desc";
        articleNotice = articleService.findPage(page, new HqlBuilder(hql)).getList();
    }
    /**
     * <li>功能描述：查询流程指南</li>
     * 
     * @throws Exception void
     * @author xcl
     */
    @SuppressWarnings("unchecked")
    private void findArticleProcedure(String requestNameSpace) throws Exception {
        page.setPageSize(8);
        String hql = "from CmsArticle article where article.isReleased='Y' and article.organization='"+requestNameSpace+"' and article.organization='"+requestNameSpace+"' and article.cmsChannel.id='402881f7508813af0150887e28e60003' order by article.createTime desc";
        articleProcedure = articleService.findPage(page, new HqlBuilder(hql)).getList();
    }
    /**
     * <li>功能描述：查询裁判文书</li>
     * 
     * @throws Exception void
     * @author xcl
     */
    @SuppressWarnings("unchecked")
    private void findArticleJudgment(String requestNameSpace) throws Exception {
        page.setPageSize(5);
        String hql = "from CmsArticle article where article.isReleased='Y' and article.organization='"+requestNameSpace+"' and article.cmsChannel.id='4028e3484d676c2a014d6784a4990000' order by article.createTime desc";
        articleJudgment = articleService.findPage(page, new HqlBuilder(hql)).getList();
    }
    
    /**
     * <li>功能描述：查询减刑假释</li>
     * 
     * @throws Exception void
     * @author xcl
     */
    @SuppressWarnings("unchecked")
    private void findArticleParole(String requestNameSpace) throws Exception {
        page.setPageSize(5);
        String hql = "from CmsArticle article where article.isReleased='Y' and article.organization='"+requestNameSpace+"' and article.cmsChannel.id='402881f7508813af0150887fd0700004' order by article.createTime desc";
        articleParole = articleService.findPage(page, new HqlBuilder(hql)).getList();
    }
    
    /**
     * <li>功能描述：查询精典案例</li>
     * 
     * @throws Exception void
     * @author xcl
     */
    @SuppressWarnings("unchecked")
    private void findArticleTypicalCases(String requestNameSpace) throws Exception {
        page.setPageSize(5);
        String hql = "from CmsArticle article where article.isReleased='Y' and article.organization='"+requestNameSpace+"' and article.cmsChannel.id='402881f7508813af0150887c99020002' order by article.createTime desc";
        articleTypicalCases = articleService.findPage(page, new HqlBuilder(hql)).getList();
    }
    
    /**
     * <li>功能描述：查询法官风采</li>
     * 
     * @throws Exception void
     * @author xcl
     */
    @SuppressWarnings("unchecked")
    private void findArticleJudge(String requestNameSpace) throws Exception {
        page.setPageSize(5);
        String hql = "from CmsArticle article where article.isReleased='Y' and article.organization='"+requestNameSpace+"' and article.cmsChannel.id='402881fb5093521c0150936401890007' order by article.createTime desc";
        articleJudge = articleService.findPage(page, new HqlBuilder(hql)).getList();
    }
    /**
     * <li>功能描述：查询庭审直播信息</li>
     * 
     * @throws Exception void
     * @author xcl
     */
    @SuppressWarnings("unchecked")
    private void findCourt(String requestNameSpace) throws Exception {
        page.setPageSize(4);
        String hql = "from CourtOpening co where co.organization='"+requestNameSpace+"' order by co.courtName asc";
        courtOpening = this.courtOpeningService.findPage(page, new HqlBuilder(hql)).getList();
    }
    
    /**
     * <li>功能描述：查询新闻资讯</li>
     * 
     * @throws Exception void
     * @author xcl
     */
    @SuppressWarnings("unchecked")
    private void findArticleNews() throws Exception {
        page.setPageSize(4);
        String hql = "from CmsArticle article where article.isReleased='Y' and article.cmsChannel.cmsChannel.id='4028e30a4d5a9ef3014d5abe758a0001' order by article.createTime desc";
        articleNews = articleService.findPage(page, new HqlBuilder(hql)).getList();
    }

    /**
     * <li>功能描述：查询平台介绍</li>
     * 
     * @throws Exception void
     * @author xcl
     */
    private void findArticleIntro() throws Exception {
        page = new Page(1);
        String hql = "from CmsArticle article where article.cmsChannel.id='4028e30a4d5a9ef3014d5ab165b00000'";
        page = articleService.findPage(page, new HqlBuilder(hql));
        if (page.getTotalRecords() > 0) {
            articleIntro = (CmsArticle) page.getList().get(0);
        }
    }

    /**
     * 
     * <li>功能描述：查询精品资源</li>
     * 
     * @throws Exception void
     * @author xcl
     */
    private void findQualityResources() throws Exception {
        page = new Page(6);
        String hql = "from Resource where state=1 order by visitCount desc";
        page = this.resourceService.findPage(page, new HqlBuilder(hql));
    }

    /**
     * <li>功能描述：查询资源分类统计信息</li>
     * 
     * @throws Exception void
     * @author xcl
     */
    private void findCategories() throws Exception {
        String hql = "select item.category, count(*) from Resource item "
            + "where item.state=1 group by item.category order by item.category";
        categories = this.resourceService.findList(new HqlBuilder(hql));
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
     * 获取新闻资讯
     * 
     * @return articleNews 新闻资讯
     */
    public List<CmsArticle> getArticleNews() {
        return articleNews;
    }

    /**
     * 设置新闻资讯
     * 
     * @param articleNews 新闻资讯
     */
    public void setArticleNews(List<CmsArticle> articleNews) {
        this.articleNews = articleNews;
    }

    /**
     * 获取平台介绍
     * 
     * @return articleIntro 平台介绍
     */
    public CmsArticle getArticleIntro() {
        return articleIntro;
    }

    /**
     * 设置平台介绍
     * 
     * @param articleIntro 平台介绍
     */
    public void setArticleIntro(CmsArticle articleIntro) {
        this.articleIntro = articleIntro;
    }

    /**
     * 获取精品推荐
     * 
     * @return qualityResources 精品推荐
     */
    public List<Resource> getQualityResources() {
        return qualityResources;
    }

    /**
     * 设置精品推荐
     * 
     * @param qualityResources 精品推荐
     */
    public void setQualityResources(List<Resource> qualityResources) {
        this.qualityResources = qualityResources;
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
     * 获取资源分类信息
     * 
     * @return categories 资源分类信息
     */
    public List<?> getCategories() {
        return categories;
    }

    /**
     * 设置资源分类信息
     * 
     * @param categories 资源分类信息
     */
    public void setCategories(List<?> categories) {
        this.categories = categories;
    }
    public List<CmsArticle> getArticleNotice()
    {
        return articleNotice;
    }
    public void setArticleNotice(List<CmsArticle> articleNotice)
    {
        this.articleNotice = articleNotice;
    }
    public List<CmsArticle> getArticleProcedure()
    {
        return articleProcedure;
    }
    public void setArticleProcedure(List<CmsArticle> articleProcedure)
    {
        this.articleProcedure = articleProcedure;
    }
    public List<CmsArticle> getArticleJudgment()
    {
        return articleJudgment;
    }
    public void setArticleJudgment(List<CmsArticle> articleJudgment)
    {
        this.articleJudgment = articleJudgment;
    }
    public List<CmsArticle> getArticleParole()
    {
        return articleParole;
    }
    public void setArticleParole(List<CmsArticle> articleParole)
    {
        this.articleParole = articleParole;
    }
    public List<CmsArticle> getArticleTypicalCases()
    {
        return articleTypicalCases;
    }
    public void setArticleTypicalCases(List<CmsArticle> articleTypicalCases)
    {
        this.articleTypicalCases = articleTypicalCases;
    }
    public List<CmsArticle> getArticleJudge()
    {
        return articleJudge;
    }
    public void setArticleJudge(List<CmsArticle> articleJudge)
    {
        this.articleJudge = articleJudge;
    }
    public ArticleService getArticleService()
    {
        return articleService;
    }
    public void setArticleService(ArticleService articleService)
    {
        this.articleService = articleService;
    }
    public List<CourtOpening> getCourtOpening()
    {
        return courtOpening;
    }
    public void setCourtOpening(List<CourtOpening> courtOpening)
    {
        this.courtOpening = courtOpening;
    }
    
    
    public static void main(String[] args) {
		String requestUri = "http://127.0.0.1/xzfy/article_detail.htm?channelName=";
	}
    
}
