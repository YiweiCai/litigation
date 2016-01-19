package com.core.cms.action;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.core.base.web.struts2.action.BaseCrudAction;
import com.core.cms.entity.CmsCommentReplay;

@Controller("cms.CommentReplayAction")
@Scope("prototype")
public class CommentReplayAction extends BaseCrudAction<CmsCommentReplay> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Override
	public String detail() throws Exception {
		return DETAIL;
	}
	@Override
	public String delete() throws Exception {
		
		return NONE;
	}

	@Override
	public String list() throws Exception {
		
		return NONE;
	}

	@Override
	public void prepareModel() throws Exception {
		
		
	}

	@Override
	public String save() throws Exception {
		
		return NONE;
	}

	public CmsCommentReplay getModel() {
		
		return null;
	}

	@Override
	public String add() throws Exception {
		
		return NONE;
	}
	@Override
	public String update() throws Exception {
		
		return null;
	}

	
}
