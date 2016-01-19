package com.core.system.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.core.base.service.impl.BaseServiceImpl;
import com.core.system.entity.SysMailServerSetting;
import com.core.system.service.MailServerSettingService;

@Service
@Transactional
public class MailServerSettingServiceImpl extends BaseServiceImpl<SysMailServerSetting> implements MailServerSettingService {

}