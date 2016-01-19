package com.lawsuit.wsla.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.core.base.service.impl.BaseServiceImpl;
import com.lawsuit.wsla.entity.LsXf;
import com.lawsuit.wsla.service.XfService;

@Service
@Transactional
public class XfServiceImpl extends BaseServiceImpl<LsXf> implements XfService{

}
