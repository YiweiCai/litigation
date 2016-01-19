package com.lawsuit.wsla.entity;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Lob;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

import com.core.base.entity.BaseEntity;
import com.core.base.entity.IDEntity;
import com.core.system.entity.SysUser;

@Entity
@Table(name = "Ls_Laxx")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class LsLaxx extends BaseEntity implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1514582244494747601L;
	private String state; // 状态 是否审核通过 0 未审核 1一级审核 2 二级审核
	private String shResult; // 0不同意 1同意

	private String ajlx; // 案件类型
	private String sdzl; // 诉的种类
	private String sqslfy; // 申请受理法院
	private String ssqq; // 诉讼请求
	private String yyrq; // 预约日期
	private String dqjd;// 当前阶段(填写在第几步)

	private String handleUserId; // 处理用户
	private String handleTime; // 处理时间

	public LsLaxx() {

	}

	public LsLaxx(String id) {
		super(id);
	}

	public LsLaxx(String id, SysUser createUser, String createTime,
			String state, String ajlx, String sdzl, String sqslfy, String ssqq,
			String yyrq, String handleUserId, String handleTime, String dqjd) {
		super(id, createUser, createTime);
		this.state = state;
		this.dqjd = dqjd;
		this.ajlx = ajlx;
		this.sdzl = sdzl;
		this.sqslfy = sqslfy;
		this.ssqq = ssqq;
		this.yyrq = yyrq;
		this.handleUserId = handleUserId;
		this.handleTime = handleTime;
	}

	@Column(name = "ajlx", length = 2)
	public String getAjlx() {
		return ajlx;
	}

	public void setAjlx(String ajlx) {
		this.ajlx = ajlx;
	}

	@Column(name = "dqjd", length = 2)
	public String getDqjd() {
		return dqjd;
	}

	public void setDqjd(String dqjd) {
		this.dqjd = dqjd;
	}

	@Column(name = "sdzl", length = 2)
	public String getSdzl() {
		return sdzl;
	}

	public void setSdzl(String sdzl) {
		this.sdzl = sdzl;
	}

	@Column(name = "sqslfy", length = 20)
	public String getSqslfy() {
		return sqslfy;
	}

	public void setSqslfy(String sqslfy) {
		this.sqslfy = sqslfy;
	}

	@Lob
	@Column(name = "ssqq")
	public String getSsqq() {
		return ssqq;
	}

	public void setSsqq(String ssqq) {
		this.ssqq = ssqq;
	}

	@Column(name = "state", length = 10)
	public void setState(String state) {
		this.state = state;
	}

	public String getState() {
		return state;
	}

	@Column(length = 2)
	public String getShResult() {
		return shResult;
	}

	public void setShResult(String shResult) {
		this.shResult = shResult;
	}

	public void setYyrq(String yyrq) {
		this.yyrq = yyrq;
	}

	@Column(name = "yyrq", length = 20)
	public String getYyrq() {
		return yyrq;
	}

	public void setHandleUserId(String handleUserId) {
		this.handleUserId = handleUserId;
	}

	@Column(name = "handle_userid", length = 32)
	public String getHandleUserId() {
		return handleUserId;
	}

	public void setHandleTime(String handleTime) {
		this.handleTime = handleTime;
	}

	@Column(name = "handle_TIME", length = 20)
	public String getHandleTime() {
		return handleTime;
	}
}
