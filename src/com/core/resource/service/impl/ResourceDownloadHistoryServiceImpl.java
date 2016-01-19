/**
 * 
 */
package com.core.resource.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.core.base.service.impl.BaseServiceImpl;
import com.core.resource.entity.ResourceDownloadHistory;
import com.core.resource.service.ResourceDownloadHistoryService;

/**
 * <li>项目名称: cyzc</li> <li>功能描述: 资源下载记录Service实现类</li>
 * 
 * @author xcl
 * @version $Id: $
 */
@Service
@Transactional
public class ResourceDownloadHistoryServiceImpl extends BaseServiceImpl<ResourceDownloadHistory>
    implements ResourceDownloadHistoryService {

}
