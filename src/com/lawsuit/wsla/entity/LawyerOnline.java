package com.lawsuit.wsla.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.springframework.context.annotation.Scope;

import com.core.base.entity.BaseEntity;

@Entity
@Table(name = "LAWYER_ONLINE")
@Cache(usage=CacheConcurrencyStrategy.READ_WRITE)
public class LawyerOnline extends BaseEntity implements Serializable
{

    /**
     * 
     */
    private static final long serialVersionUID = -1545725271662573984L;
    private String questionTitle;
    private String questionContext;
    private String questionArea;
    private String questionType;
    private String questionerPhone;
    private String replyUserId;
    private String replyUserName;
    private String replyContext;
    private String replyTime;
    private String replyWay;
    private String type;
    private String status;
    
    
    
    @Column(length=200)
    public String getQuestionTitle()
    {
        return questionTitle;
    }
    public void setQuestionTitle(String questionTitle)
    {
        this.questionTitle = questionTitle;
    }
    @Column(length=5000)
    public String getQuestionContext()
    {
        return questionContext;
    }
    public void setQuestionContext(String questionContext)
    {
        this.questionContext = questionContext;
    }
    @Column(length=20)
    public String getQuestionArea()
    {
        return questionArea;
    }
    public void setQuestionArea(String questionArea)
    {
        this.questionArea = questionArea;
    }
    @Column(length=20)
    public String getQuestionType()
    {
        return questionType;
    }
    public void setQuestionType(String questionType)
    {
        this.questionType = questionType;
    }
    @Column(length=20)
    public String getQuestionerPhone()
    {
        return questionerPhone;
    }
    public void setQuestionerPhone(String questionerPhone)
    {
        this.questionerPhone = questionerPhone;
    }
    @Column(length=32)
    public String getReplyUserId()
    {
        return replyUserId;
    }
    public void setReplyUserId(String replyUserId)
    {
        this.replyUserId = replyUserId;
    }
    @Column(length=100)
    public String getReplyUserName()
    {
        return replyUserName;
    }
    public void setReplyUserName(String replyUserName)
    {
        this.replyUserName = replyUserName;
    }
    
    
    @Column(length=5000)
    public String getReplyContext()
    {
        return replyContext;
    }
    public void setReplyContext(String replyContext)
    {
        this.replyContext = replyContext;
    }
    @Column(length=32)
    public String getReplyTime()
    {
        return replyTime;
    }
    public void setReplyTime(String replyTime)
    {
        this.replyTime = replyTime;
    }
    @Column(length=10)
    public String getReplyWay()
    {
        return replyWay;
    }
    public void setReplyWay(String replyWay)
    {
        this.replyWay = replyWay;
    }
    @Column(length=2)
    public String getType()
    {
        return type;
    }
    public void setType(String type)
    {
        this.type = type;
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
    
    
    
    
}
