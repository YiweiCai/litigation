package com.lawsuit.wsla.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.core.base.service.impl.BaseServiceImpl;
import com.lawsuit.wsla.entity.LawyerOnline;
import com.lawsuit.wsla.service.LawyerOnlineService;


@Service
@Transactional
public class LawyerOnlineServiceImpl extends BaseServiceImpl<LawyerOnline> implements LawyerOnlineService
{

}
