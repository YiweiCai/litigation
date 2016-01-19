package com.core.base.entity;

import javax.persistence.Column;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MappedSuperclass;

import com.core.system.entity.SysUser;

/**
 * 实例类的父类，包含两公共属性：创建人和创建时间
 * 如果其对应的表不包含字段创建人和创建时间，请继承IDEntity
 * @author yeshujun
 * @date 2009-03-15晚
 *
 */
@MappedSuperclass
public abstract class BaseEntity extends IDEntity{
	
	private SysUser createUser;
	private String createTime;
	//2016-01-04 新增属性：机构--对应法院
	private String organization;
	
	/*private String isDelete;
	private String remark;
	private String state;*/
	
	public BaseEntity(){
		
	}
    public BaseEntity(String id){
		super(id);
	}  
    public BaseEntity(String id,String createTime){
		super(id);
		this.createTime = createTime;
	}  
	
	public BaseEntity(String id,SysUser createUser,String createTime){
		super(id);
		this.createUser = createUser;
		this.createTime = createTime;
		/*this.isDelete = isDelete;
		this.remark = remark;
		this.state = state;*/
	}
	
	
	public BaseEntity(String id,SysUser createUser, String createTime, String organization) {
		super(id);
		this.createUser = createUser;
		this.createTime = createTime;
		this.organization = organization;
	}
	
	@Column(name = "CREATE_TIME", length = 20)
	public String getCreateTime() {
		return this.createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

	/*@Column(name = "IS_DELETE", length = 1)
	public String getIsDelete() {
		return this.isDelete;
	}

	public void setIsDelete(String isDelete) {
		this.isDelete = isDelete;
	}

	@Column(name = "REMARK", length = 512)
	public String getRemark() {
		return this.remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	@Column(name = "STATE", precision = 2, scale = 0)
	public String getState() {
		return this.state;
	}

	public void setState(String state) {
		this.state = state;
	}*/
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "CREATE_USER_ID")
	public SysUser getCreateUser() {
		return createUser;
	}

	public void setCreateUser(SysUser createUser) {
		this.createUser = createUser;
	}
	@Column(name="ORGANIZATION",length=100)
	public String getOrganization() {
		return organization;
	}
	public void setOrganization(String organization) {
		this.organization = organization;
	}
	
}
