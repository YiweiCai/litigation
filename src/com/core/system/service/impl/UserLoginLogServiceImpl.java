package com.core.system.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.core.base.service.impl.BaseServiceImpl;
import com.core.system.entity.UserLoginLog;
import com.core.system.service.UserLoginLogService;

@Service
@Transactional
public class UserLoginLogServiceImpl extends BaseServiceImpl<UserLoginLog> implements UserLoginLogService {

}
