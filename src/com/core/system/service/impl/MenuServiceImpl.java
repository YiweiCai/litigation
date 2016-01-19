package com.core.system.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.core.base.service.impl.BaseServiceImpl;
import com.core.system.entity.SysMenu;
import com.core.system.service.MenuService;
@Service
@Transactional
public class MenuServiceImpl extends BaseServiceImpl<SysMenu> implements MenuService {
	
}
