package com.lawsuit.wsla.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import com.core.base.entity.BaseEntity;
import com.core.base.entity.IDEntity;

/**
 * 开庭信息
 * @author Cai
 *
 */
@Entity
@Table(name="court_open_info")
public class CourtOpenInfo extends BaseEntity implements Serializable{

	
	private String caseNum;//案号
	private String caseName;//案件名称
	private String chiefJudge;//审判长
	private String viceJudges;//审判员
	private String courtPlace;//开庭地点
	private String startTime;//开庭时间
	
	
	//constructor
	public CourtOpenInfo(){
		super();
	}
	
	public CourtOpenInfo(String caseNum, String caseName, String chiefJudge,
			String viceJudges, String courtPlace, String startTime) {
		super();
		this.caseNum = caseNum;
		this.caseName = caseName;
		this.chiefJudge = chiefJudge;
		this.viceJudges = viceJudges;
		this.courtPlace = courtPlace;
		this.startTime = startTime;
	}
	// getter setter
	@Column(length=255)
	public String getCaseNum() {
		return caseNum;
	}
	public void setCaseNum(String caseNum) {
		this.caseNum = caseNum;
	}
	@Column(length=255)
	public String getCaseName() {
		return caseName;
	}
	public void setCaseName(String caseName) {
		this.caseName = caseName;
	}
	@Column(length=255)
	public String getChiefJudge() {
		return chiefJudge;
	}
	public void setChiefJudge(String chiefJudge) {
		this.chiefJudge = chiefJudge;
	}
	@Column(length=255)
	public String getViceJudges() {
		return viceJudges;
	}
	public void setViceJudges(String viceJudges) {
		this.viceJudges = viceJudges;
	}
	@Column(length=255)
	public String getCourtPlace() {
		return courtPlace;
	}
	public void setCourtPlace(String courtPlace) {
		this.courtPlace = courtPlace;
	}
	@Column(length=255)
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	// toString
	@Override
	public String toString() {
		return "CourtOpenInfo [caseName=" + caseName + ", caseNum=" + caseNum
				+ ", chiefJudge=" + chiefJudge + ", courtPlace=" + courtPlace
				+ ", startTime=" + startTime + ", viceJudges=" + viceJudges
				+ "]";
	}
	
	
	
}
