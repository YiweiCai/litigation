/**
 * 
 */
package com.core.resource.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.core.base.service.impl.BaseServiceImpl;
import com.core.resource.entity.Resource;
import com.core.resource.service.ResourceService;

/**
 * <li>项目名称: cyzc</li> <li>功能描述: 资源Service实现类</li>
 * 
 * @author xcl
 * @version $Id: $
 */
@Service
@Transactional
public class ResourceServiceImpl extends BaseServiceImpl<Resource> implements ResourceService {

}
