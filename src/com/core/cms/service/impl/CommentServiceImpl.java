package com.core.cms.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.core.base.service.impl.BaseServiceImpl;
import com.core.cms.entity.CmsComment;
import com.core.cms.service.CommentService;
@Service
@Transactional
public class CommentServiceImpl extends BaseServiceImpl<CmsComment> implements CommentService {

}
