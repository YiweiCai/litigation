package com.lawsuit.wsla.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

import com.core.base.entity.BaseEntity;
import com.core.base.entity.IDEntity;

//信访
@Entity
@Table(name = "Ls_Xf")
@Cache(usage=CacheConcurrencyStrategy.READ_WRITE)
public class LsXf extends BaseEntity implements java.io.Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -5717420241658341270L;

	private String name; //姓名
	private String sjhm; //手机号码
	private String zjhm; //证件号码
	private String yjdz; //邮件地址
	private String yagx; //与案关系
	private String ah; //案号
	private String zxnr; //资讯内容
	
	private String replyWay; //回复方式  电话回复、邮件回复、
	private String replyUserId; //回复用户id
	private String replyTime; //回复时间
	private String bz; //备注
	private String replyContent; //回复内容
	
	@Column(name = "name", length = 100)
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Column(name = "sjhm", length = 20)
	public String getSjhm() {
		return sjhm;
	}
	public void setSjhm(String sjhm) {
		this.sjhm = sjhm;
	}
	@Column(name = "zjhm", length = 50)
	public String getZjhm() {
		return zjhm;
	}
	public void setZjhm(String zjhm) {
		this.zjhm = zjhm;
	}
	@Column(name = "yjdz", length = 255)
	public String getYjdz() {
		return yjdz;
	}
	public void setYjdz(String yjdz) {
		this.yjdz = yjdz;
	}
	@Column(name = "yagx", length = 255)
	public String getYagx() {
		return yagx;
	}
	public void setYagx(String yagx) {
		this.yagx = yagx;
	}
	@Column(name = "ah", length = 255)
	public String getAh() {
		return ah;
	}
	public void setAh(String ah) {
		this.ah = ah;
	}
	@Column(name = "zxnr", length = 255)
	public String getZxnr() {
		return zxnr;
	}
	public void setZxnr(String zxnr) {
		this.zxnr = zxnr;
	}
	@Column(name = "reply_way", length = 10)
	public String getReplyWay() {
		return replyWay;
	}
	public void setReplyWay(String replyWay) {
		this.replyWay = replyWay;
	}
	@Column(name = "reply_userid", length = 32)
	public String getReplyUserId() {
		return replyUserId;
	}
	public void setReplyUserId(String replyUserId) {
		this.replyUserId = replyUserId;
	}
	@Column(name = "reply_time", length = 20)
	public String getReplyTime() {
		return replyTime;
	}
	public void setReplyTime(String replyTime) {
		this.replyTime = replyTime;
	}
	@Column(name = "bz", length = 255)
	public String getBz() {
		return bz;
	}
	public void setBz(String bz) {
		this.bz = bz;
	}
	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}
	@Column(name="reply_content",length=255)
	public String getReplyContent() {
		return replyContent;
	}
	
	
	
	
}
