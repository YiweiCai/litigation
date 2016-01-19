package com.core.resource.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

import com.core.base.entity.BaseEntity;

/**
 * 
 * <li>项目名称: cyzc</li> <li>功能描述: 资源实体类</li>
 * 
 * @author xcl
 * @version $Id: $
 */
@Entity
@Table(name = "core_RESOURCE")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class Resource extends BaseEntity implements java.io.Serializable {

    /**
	 * 
	 */
    private static final long serialVersionUID = 1L;

    /**
     * 资源名称
     */
    private String name;

    /**
     * 资源类型
     */
    private String type;

    /**
     * 资源分类
     */
    private String category;

    /**
     * 发布时间
     */
    private String publishTime;

    /**
     * 资源描述
     */
    private String description;

    /**
     * 目标环境
     */
    private String environment;

    /**
     * 浏览次数
     */
    private int visitCount;

    /**
     * 下载次数
     */
    private int downloadCount;

    /**
     * 状态：0-未审核，1-审核通过，2-审核不通过
     */
    private int state;

    public Resource() {

    }

    public Resource(String id) {
        super(id);
    }

    /**
     * 获取资源名称
     * 
     * @return name 资源名称
     */
    public String getName() {
        return name;
    }

    /**
     * 设置资源名称
     * 
     * @param name 资源名称
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * 获取资源类型
     * 
     * @return type 资源类型
     */
    @Column(length = 50)
    public String getType() {
        return type;
    }

    /**
     * 设置资源类型
     * 
     * @param type 资源类型
     */
    public void setType(String type) {
        this.type = type;
    }

    /**
     * 获取资源分类
     * 
     * @return category 资源分类
     */
    @Column(length = 50)
    public String getCategory() {
        return category;
    }

    /**
     * 设置资源分类
     * 
     * @param category 资源分类
     */
    public void setCategory(String category) {
        this.category = category;
    }

    /**
     * 获取发布时间
     * 
     * @return publishTime 发布时间
     */
    @Column(length = 20)
    public String getPublishTime() {
        return publishTime;
    }

    /**
     * 设置发布时间
     * 
     * @param publishTime 发布时间
     */
    public void setPublishTime(String publishTime) {
        this.publishTime = publishTime;
    }

    /**
     * 获取资源描述
     * 
     * @return description 资源描述
     */
    @Column(length = 2000)
    public String getDescription() {
        return description;
    }

    /**
     * 设置资源描述
     * 
     * @param description 资源描述
     */
    public void setDescription(String description) {
        this.description = description;
    }

    /**
     * 获取目标环境
     * 
     * @return environment 目标环境
     */
    public String getEnvironment() {
        return environment;
    }

    /**
     * 设置目标环境
     * 
     * @param environment 目标环境
     */
    public void setEnvironment(String environment) {
        this.environment = environment;
    }

    /**
     * 获取状态：0-未审核，1-审核通过，2-审核不通过
     * 
     * @return state 状态：0-未审核，1-审核通过，2-审核不通过
     */
    public int getState() {
        return state;
    }

    /**
     * 设置状态：0-未审核，1-审核通过，2-审核不通过
     * 
     * @param state 状态：0-未审核，1-审核通过，2-审核不通过
     */
    public void setState(int state) {
        this.state = state;
    }

    /**
     * 获取浏览次数
     * 
     * @return visitCount 浏览次数
     */
    public int getVisitCount() {
        return visitCount;
    }

    /**
     * 设置浏览次数
     * 
     * @param visitCount 浏览次数
     */
    public void setVisitCount(int visitCount) {
        this.visitCount = visitCount;
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
}
