package com.lawsuit.wsla.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

import com.core.base.entity.IDEntity;

@Entity
@Table(name = "Ls_Yast")
@Cache(usage=CacheConcurrencyStrategy.READ_WRITE)
public class LsYast extends IDEntity implements java.io.Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1667285012638180699L;
	
	private String ssdw;//是原告还是被告 
	private String type; //0-自然人， 1-法人 ，2-非法人其他组织
	private String name; //姓名
	private String sfz; //身份证
	private String csrq; //出生日期
	private String sex; //性别
	private String mz; //民族
	private String sjhm; //手机号码
	private String lxdh; //联系电话
	private String gj; //国籍
	private String whcd; //文化程度
	private String yzbm; //邮政编码
	private String hjszd; //户籍所在地
	private String lxdz; //联系地址
	private String fr; //单位负责人或法定代表人名称
	
	
	private String laxxId; 
	public LsYast(){
		
	}
	
	public LsYast(String id){
		super(id);
	}
	
	public LsYast(String id, String ssdw, String type, String name, String sfz,
			String csrq, String sex, String mz, String sjhm, String lxdh,
			String gj, String whcd, String yzbm, String hjszd, String lxdz,
			String fr,String laxxId) {
		super(id);
		this.ssdw = ssdw;
		this.type = type;
		this.name = name;
		this.sfz = sfz;
		this.csrq = csrq;
		this.sex = sex;
		this.mz = mz;
		this.sjhm = sjhm;
		this.lxdh = lxdh;
		this.gj = gj;
		this.whcd = whcd;
		this.yzbm = yzbm;
		this.hjszd = hjszd;
		this.lxdz = lxdz;
		this.fr = fr;
		this.laxxId = laxxId;
	}

	@Column(name = "ssdw", length = 1)
	public String getSsdw() {
		return ssdw;
	}
	public void setSsdw(String ssdw) {
		this.ssdw = ssdw;
	}
	@Column(name = "type", length = 1)
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	@Column(name = "name", length = 100)
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Column(name = "sfz", length = 18)
	public String getSfz() {
		return sfz;
	}
	public void setSfz(String sfz) {
		this.sfz = sfz;
	}
	@Column(name = "csrq", length = 20)
	public String getCsrq() {
		return csrq;
	}
	public void setCsrq(String csrq) {
		this.csrq = csrq;
	}
	@Column(name = "sex", length = 10)
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	@Column(name = "mz", length = 20)
	public String getMz() {
		return mz;
	}
	public void setMz(String mz) {
		this.mz = mz;
	}
	@Column(name = "sjhm", length = 15)
	public String getSjhm() {
		return sjhm;
	}
	public void setSjhm(String sjhm) {
		this.sjhm = sjhm;
	}
	@Column(name = "lxdh", length = 20)
	public String getLxdh() {
		return lxdh;
	}
	public void setLxdh(String lxdh) {
		this.lxdh = lxdh;
	}
	@Column(name = "gj", length = 40)
	public String getGj() {
		return gj;
	}
	public void setGj(String gj) {
		this.gj = gj;
	}
	@Column(name = "whcd", length = 20)
	public String getWhcd() {
		return whcd;
	}
	public void setWhcd(String whcd) {
		this.whcd = whcd;
	}
	@Column(name = "yzbm", length = 10)
	public String getYzbm() {
		return yzbm;
	}
	public void setYzbm(String yzbm) {
		this.yzbm = yzbm;
	}
	@Column(name = "hjszd", length = 255)
	public String getHjszd() {
		return hjszd;
	}
	public void setHjszd(String hjszd) {
		this.hjszd = hjszd;
	}
	@Column(name = "lxdz", length = 255)
	public String getLxdz() {
		return lxdz;
	}
	public void setLxdz(String lxdz) {
		this.lxdz = lxdz;
	}
	@Column(name = "fr", length = 20)
	public String getFr() {
		return fr;
	}
	public void setFr(String fr) {
		this.fr = fr;
	}

	public void setLaxxId(String laxxId) {
		this.laxxId = laxxId;
	}

	@Column(name = "laxx_id", length = 20)
	public String getLaxxId() {
		return laxxId;
	}


	


}
