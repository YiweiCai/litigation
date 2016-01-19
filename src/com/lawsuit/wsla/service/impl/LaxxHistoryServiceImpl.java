package com.lawsuit.wsla.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.core.base.service.impl.BaseServiceImpl;
import com.lawsuit.wsla.entity.LsHistory;
import com.lawsuit.wsla.service.LaxxHistoryService;

@Service
@Transactional
public class LaxxHistoryServiceImpl extends BaseServiceImpl<LsHistory> implements LaxxHistoryService
{

}
