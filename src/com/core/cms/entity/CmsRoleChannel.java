package com.core.cms.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

import com.core.base.constants.enums.Auth;
import com.core.base.entity.IDEntity;
import com.core.base.utils.DateUtils;
import com.core.system.entity.SysRole;
/**
 * 角色菜单中间表
 * @author yeshujun
 *
 */
@Entity
@Table(name = "CMS_ROLE_CHANNEL")
@Cache(usage=CacheConcurrencyStrategy.READ_WRITE)
public class CmsRoleChannel  extends IDEntity implements java.io.Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Auth auth=Auth.W;//权限级别，R:查看，W:增删改查，N：不具有访问权限
	private SysRole sysRole;
	private CmsChannel cmsChannel;
	private String createTime=DateUtils.getCurrentDate();
	
	public CmsRoleChannel() {
		
	}

	public CmsRoleChannel(String id) {
		super(id);
	}
	
	public CmsRoleChannel(String id,Auth auth, SysRole sysRole, CmsChannel cmsChannel, String createTime){
		 super(id);
	     this.auth=auth;
		 this.cmsChannel=cmsChannel;
		 this.sysRole=sysRole;
		 this.createTime=createTime;
	}
	
	@Column(name = "AUTH",length=10)
	@Enumerated(EnumType.STRING)
	public Auth getAuth() {
		return auth;
	}

	public void setAuth(Auth auth) {
		this.auth = auth;
	}
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "ROLE_ID")
	@Cache(usage=CacheConcurrencyStrategy.READ_WRITE)
	public SysRole getSysRole() {
		return sysRole;
	}
	
	public void setSysRole(SysRole sysRole) {
		this.sysRole = sysRole;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "CHANNEL_ID")
	@Cache(usage=CacheConcurrencyStrategy.READ_WRITE)
	public CmsChannel getCmsChannel() {
		return cmsChannel;
	}

	public void setCmsChannel(CmsChannel cmsChannel) {
		this.cmsChannel = cmsChannel;
	}
	
	@Column(name = "CREATE_TIME",length=20)
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
}

