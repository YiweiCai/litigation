package com.core.oa.article.service;

import com.core.base.entity.Page;
import com.core.base.service.BaseService;
import com.core.oa.article.entity.OaArticle;

public interface OaArticleService extends BaseService<OaArticle>{

	public Page findPage(Page page,String categoryValue,String isDraft) throws Exception;

	public int createStaticPage(OaArticle oaArticle, String id) throws Exception;

}
