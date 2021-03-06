/**
 * There are <a href="https://github.com/thinkgem/jeesite">JeeSite</a> code generation
 */
package com.thinkgem.jeesite.modules.ip.entity;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.IdEntity;

/**
 * 分管单位设置Entity
 * @author Generate Tools
 * @version 2016-06-21
 */
@Entity
@Table(name = "ip_fgdw")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class OrganizationDirector extends IdEntity<OrganizationDirector> {
	
	private static final long serialVersionUID = 1L;
//	private String id; 		// 编号
//	private String zg_id,fgbm_id;
	private String bz; 	// 名称

	private Employee employee;
	private Organization organization;
	
	
	@ManyToOne
	@JoinColumn(name = "ZG_ID")
	public Employee getEmployee() {
		return employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}

	@ManyToOne
	@JoinColumn(name = "FGBM_ID")
	public Organization getOrganization() {
		return organization;
	}

	public void setOrganization(Organization organization) {
		this.organization = organization;
	}

//	public String getZg_id() {
//		return zg_id;
//	}
//
//	public void setZg_id(String zg_id) {
//		this.zg_id = zg_id;
//	}
//
//	public String getFgbm_id() {
//		return fgbm_id;
//	}
//
//	public void setFgbm_id(String fgbm_id) {
//		this.fgbm_id = fgbm_id;
//	}

	public String getBz() {
		return bz;
	}

	public void setBz(String bz) {
		this.bz = bz;
	}

	public OrganizationDirector() {
		super();
	}

	public OrganizationDirector(String id){
		this();
		this.id = id;
	}
	 

	
}


