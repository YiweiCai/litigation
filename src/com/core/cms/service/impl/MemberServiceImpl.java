package com.core.cms.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.core.base.service.impl.BaseServiceImpl;
import com.core.cms.entity.CmsMember;
import com.core.cms.service.MemberService;
@Service
@Transactional
public class MemberServiceImpl extends BaseServiceImpl<CmsMember> implements MemberService {

}
