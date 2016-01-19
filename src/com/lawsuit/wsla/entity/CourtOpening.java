package com.lawsuit.wsla.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

import com.core.base.entity.BaseEntity;
import com.core.system.entity.SysUser;


@Entity
@Table(name = "COURT_OPENING")
@Cache(usage=CacheConcurrencyStrategy.READ_WRITE)
public class CourtOpening extends BaseEntity implements Serializable
{

    /**
     * 
     */
    private static final long serialVersionUID = -6652093396161034894L;
    
    private String courtId;
    private String courtName;
    private String openingUrl;
    private String videoUrl;
    private String startTime;
    private String endTime;
    private String caseName;
    private String caseSummary;
    private String caseType;
    private String plaintiff;
    private String defendant;
    private String judge;
    private String Jurors;
    private String updateTime;
    private String updateUserId;
    private String updateUserName;
    @Column(length=32)
    public String getCourtId()
    {
        return courtId;
    }
    public void setCourtId(String courtId)
    {
        this.courtId = courtId;
    }
    @Column(length=50)
    public String getCourtName()
    {
        return courtName;
    }
    public void setCourtName(String courtName)
    {
        this.courtName = courtName;
    }
    @Column(length=2000)
    public String getOpeningUrl()
    {
        return openingUrl;
    }
    public void setOpeningUrl(String openingUrl)
    {
        this.openingUrl = openingUrl;
    }
    @Column(length=2000)
    public String getVideoUrl()
    {
        return videoUrl;
    }
    public void setVideoUrl(String videoUrl)
    {
        this.videoUrl = videoUrl;
    }
    @Column(length=32)
    public String getStartTime()
    {
        return startTime;
    }
    public void setStartTime(String startTime)
    {
        this.startTime = startTime;
    }
    @Column(length=32)
    public String getEndTime()
    {
        return endTime;
    }
    public void setEndTime(String endTime)
    {
        this.endTime = endTime;
    }
    @Column(length=1000)
    public String getCaseName()
    {
        return caseName;
    }
    public void setCaseName(String caseName)
    {
        this.caseName = caseName;
    }
    @Column(length=2000)
    public String getCaseSummary()
    {
        return caseSummary;
    }
    public void setCaseSummary(String caseSummary)
    {
        this.caseSummary = caseSummary;
    }
    @Column(length=2)
    public String getCaseType()
    {
        return caseType;
    }
    public void setCaseType(String caseType)
    {
        this.caseType = caseType;
    }
    @Column(length=200)
    public String getPlaintiff()
    {
        return plaintiff;
    }
    public void setPlaintiff(String plaintiff)
    {
        this.plaintiff = plaintiff;
    }
    @Column(length=200)
    public String getDefendant()
    {
        return defendant;
    }
    public void setDefendant(String defendant)
    {
        this.defendant = defendant;
    }
    @Column(length=50)
    public String getJudge()
    {
        return judge;
    }
    public void setJudge(String judge)
    {
        this.judge = judge;
    }
    @Column(length=200)
    public String getJurors()
    {
        return Jurors;
    }
    public void setJurors(String jurors)
    {
        Jurors = jurors;
    }
    @Column(length=32)
    public String getUpdateTime()
    {
        return updateTime;
    }
    public void setUpdateTime(String updateTime)
    {
        this.updateTime = updateTime;
    }
    @Column(length=32)
    public String getUpdateUserId()
    {
        return updateUserId;
    }
    public void setUpdateUserId(String updateUserId)
    {
        this.updateUserId = updateUserId;
    }
    @Column(length=100)
    public String getUpdateUserName()
    {
        return updateUserName;
    }
    public void setUpdateUserName(String updateUserName)
    {
        this.updateUserName = updateUserName;
    }
   
    
    
    
    
}
