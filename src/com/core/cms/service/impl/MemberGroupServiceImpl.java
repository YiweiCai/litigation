package com.core.cms.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.core.base.service.impl.BaseServiceImpl;
import com.core.cms.entity.CmsMemberGroup;
import com.core.cms.service.MemberGroupService;
@Service
@Transactional
public class MemberGroupServiceImpl extends BaseServiceImpl<CmsMemberGroup> implements
		MemberGroupService {

}