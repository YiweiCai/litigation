package com.core.resource.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

import com.core.base.entity.BaseEntity;

/**
 * 
 * <li>项目名称: cyzc</li> <li>功能描述: 资源下载记录实体类</li>
 * 
 * @author xcl
 * @version $Id: $
 */
@Entity
@Table(name = "core_RESOURCE_DOWNLOAD_HISTORY")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class ResourceDownloadHistory extends BaseEntity implements java.io.Serializable {

    /**
	 * 
	 */
    private static final long serialVersionUID = 1L;

    /**
     * 资源ID
     */
    private String resourceId;

    /**
     * 下载次数
     */
    private int downloadCount;
    
    /**
     * 最新下载时间
     */
    private String updateTime;

    public ResourceDownloadHistory() {

    }

    public ResourceDownloadHistory(String id) {
        super(id);
    }

    /**
     * 获取资源ID
     * 
     * @return resourceId 资源ID
     */
    @Column(length = 32)
    public String getResourceId() {
        return resourceId;
    }

    /**
     * 设置资源ID
     * 
     * @param resourceId 资源ID
     */
    public void setResourceId(String resourceId) {
        this.resourceId = resourceId;
    }

    /**
     * 获取下载次数
     * 
     * @return downloadCount 下载次数
     */
    public int getDownloadCount() {
        return downloadCount;
    }

    /**
     * 设置下载次数
     * 
     * @param downloadCount 下载次数
     */
    public void setDownloadCount(int downloadCount) {
        this.downloadCount = downloadCount;
    }

    /**
     * 获取最新下载时间
     * @return updateTime 最新下载时间
     */
    public String getUpdateTime() {
        return updateTime;
    }

    /**
     * 设置最新下载时间
     * @param updateTime 最新下载时间
     */
    public void setUpdateTime(String updateTime) {
        this.updateTime = updateTime;
    }
}
