package com.lawsuit.wsla.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

import com.core.base.entity.BaseEntity;

@Entity
@Table(name = "UPLOAD_VIDEO")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class UploadVideo extends BaseEntity implements Serializable {

	/**
	 * 上传视频文件
	 */
	private static final long serialVersionUID = 5626057401611649254L;
	private String title;// 标题
	private String smallTitle;// 小标题
	private String keyword;// 关键字
	private String courtroom;// 法庭
	private String videoType;// 视频类型
	private String firestJudge;// 审判长
	private String judger;// 审判员
	private String juror;// 陪审员
	private String agencyJudger;// 代理审判员
	private String societyJudger;// 社会审判员
	private String brief;// 案由
	private String videoIntro;// 视频简介/案情
	private String site;// 地点
	private String time;// 时间
	private String videoSite;// 视频地址
	private String issueTime;// 发布时间
	private String remark;// 备注

	@Column(length = 200)
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	@Column(length = 200)
	public String getSmallTitle() {
		return smallTitle;
	}

	public void setSmallTitle(String smallTitle) {
		this.smallTitle = smallTitle;
	}

	@Column(length = 200)
	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	@Column(length = 100)
	public String getCourtroom() {
		return courtroom;
	}

	public void setCourtroom(String courtroom) {
		this.courtroom = courtroom;
	}

	@Column(length = 200)
	public String getVideoType() {
		return videoType;
	}

	public void setVideoType(String videoType) {
		this.videoType = videoType;
	}

	@Column(length = 200)
	public String getFirestJudge() {
		return firestJudge;
	}

	public void setFirestJudge(String firestJudge) {
		this.firestJudge = firestJudge;
	}

	@Column(length = 200)
	public String getJudger() {
		return judger;
	}

	public void setJudger(String judger) {
		this.judger = judger;
	}

	@Column(length = 200)
	public String getJuror() {
		return juror;
	}

	public void setJuror(String juror) {
		this.juror = juror;
	}

	@Column(length = 200)
	public String getAgencyJudger() {
		return agencyJudger;
	}

	public void setAgencyJudger(String agencyJudger) {
		this.agencyJudger = agencyJudger;
	}

	@Column(length = 200)
	public String getSocietyJudger() {
		return societyJudger;
	}

	public void setSocietyJudger(String societyJudger) {
		this.societyJudger = societyJudger;
	}

	@Column(length = 200)
	public String getBrief() {
		return brief;
	}

	public void setBrief(String brief) {
		this.brief = brief;
	}

	@Column(length = 200)
	public String getVideoIntro() {
		return videoIntro;
	}

	public void setVideoIntro(String videoIntro) {
		this.videoIntro = videoIntro;
	}

	@Column(length = 200)
	public String getSite() {
		return site;
	}

	public void setSite(String site) {
		this.site = site;
	}

	@Column(length = 200)
	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	@Column(length = 2000)
	public String getVideoSite() {
		return videoSite;
	}

	public void setVideoSite(String videoSite) {
		this.videoSite = videoSite;
	}

	@Column(length = 2000)
	public String getIssueTime() {
		return issueTime;
	}

	public void setIssueTime(String issueTime) {
		this.issueTime = issueTime;
	}

	@Column(length = 2000)
	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

}
