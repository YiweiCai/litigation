package com.core.system.service.impl;

import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.core.base.constants.enums.YN;
import com.core.base.dao.cache.CacheConstants;
import com.core.base.dao.cache.EhCacheManager;
import com.core.base.service.impl.BaseServiceImpl;
import com.core.base.utils.FastMap;
import com.core.system.entity.SysRuleSetting;
import com.core.system.service.RuleSettingService;
/**
 * 系统规则设置service
 * @author yeshujun
 */
@Service
@Transactional
public class RuleSettingServiceImpl extends BaseServiceImpl<SysRuleSetting>  implements RuleSettingService {

	public SysRuleSetting findOne(String ruleType) throws Exception{
	     return findOne("system.findSysRuleSettings",new FastMap<String,String>().newHashMap().set("ruleType", ruleType));
	}

	@SuppressWarnings("unchecked")
	public int updateRuleSettingInCache()throws Exception{
		Map<String, YN> sysRuleSettingMap = (Map<String, YN>) findMap("system.findSysRuleSettings", "ruleType","ruleCode",null);
		
		EhCacheManager.remove(CacheConstants.CONSTANTS_DATE_CACHE, CacheConstants.SYS_RULE_SETTING_KEY);
    	EhCacheManager.put(CacheConstants.CONSTANTS_DATE_CACHE, CacheConstants.SYS_RULE_SETTING_KEY, sysRuleSettingMap);
    	
		return 1;
	}
}
