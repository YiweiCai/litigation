package com.core.cms.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.core.base.service.impl.BaseServiceImpl;
import com.core.cms.entity.CmsChannel;
import com.core.cms.service.ChannelService;
@Service
@Transactional
public class ChannelServiceImpl extends BaseServiceImpl<CmsChannel> implements ChannelService{

}
