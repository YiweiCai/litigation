package com.lawsuit.wsla.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

import com.core.base.entity.BaseEntity;
import com.core.base.entity.IDEntity;

@Entity
@Table(name = "LS_HISTORY")
@Cache(usage=CacheConcurrencyStrategy.READ_WRITE)
public class LsHistory extends IDEntity implements java.io.Serializable
{

    /**
     * 
     */
    private static final long serialVersionUID = -4188654786008481662L;
    private String createTime;
    private String createUserId;
    private String createUserName;
    private String laxxId;
    private String laxxStatus;
    private String status;//0 不同意 1 同意  2 其他
    private String opinion;
    private String remark;
    
    
    
    
    @Column(length=32)
    public String getCreateTime()
    {
        return createTime;
    }
    public void setCreateTime(String createTime)
    {
        this.createTime = createTime;
    }
    @Column(length=32)
    public String getCreateUserId()
    {
        return createUserId;
    }
    public void setCreateUserId(String createUserId)
    {
        this.createUserId = createUserId;
    }
    @Column(length=50)
    public String getCreateUserName()
    {
        return createUserName;
    }
    public void setCreateUserName(String createUserName)
    {
        this.createUserName = createUserName;
    }
    @Column(length=32)
    public String getLaxxId()
    {
        return laxxId;
    }
    public void setLaxxId(String laxxId)
    {
        this.laxxId = laxxId;
    }
    @Column(length=2)
    public String getLaxxStatus()
    {
        return laxxStatus;
    }
    public void setLaxxStatus(String laxxStatus)
    {
        this.laxxStatus = laxxStatus;
    }
    
    @Column(length=2)
    public String getStatus()
    {
        return status;
    }
    public void setStatus(String status)
    {
        this.status = status;
    }
    @Column(length=10)
    public String getOpinion()
    {
        return opinion;
    }
    public void setOpinion(String opinion)
    {
        this.opinion = opinion;
    }
    @Column(length=2000)
    public String getRemark()
    {
        return remark;
    }
    public void setRemark(String remark)
    {
        this.remark = remark;
    }
    
    
}
