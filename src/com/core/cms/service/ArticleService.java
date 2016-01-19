package com.core.cms.service;

import java.util.Map;

import com.core.base.entity.Page;
import com.core.base.service.BaseService;
import com.core.cms.entity.CmsArticle;

public interface ArticleService extends BaseService<CmsArticle>{

	public Page findPage(Page page,Map<String,String> paramMap)throws Exception;

	public int createStaticPage(CmsArticle article,String id) throws Exception;

	public int deleteAndUpdatePage(String[] strids)throws Exception;
	
	/**
	 * 
	 *<li>功能描述：全站静态化</li>
	 * @throws Exception
	 * void 
	 * @author xcl
	 */
	public void siteStaticize() throws Exception;

}
