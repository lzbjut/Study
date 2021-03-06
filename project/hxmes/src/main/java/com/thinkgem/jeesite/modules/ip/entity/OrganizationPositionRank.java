/**
 * There are <a href="https://github.com/thinkgem/jeesite">JeeSite</a> code generation
 */
package com.thinkgem.jeesite.modules.ip.entity;

import javax.persistence.Entity;
import javax.persistence.Table;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.IdEntity;

/**
 * 人员业务分类管理Entity
 * @author Iris
 * @version 2016-06-21
 */
@Entity
@Table(name = "IP_JGRYYWLB")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class OrganizationPositionRank extends IdEntity<OrganizationPositionRank> {
	
	private static final long serialVersionUID = 1L;
	
	private String ZZJG_ID;
	
	private String RYYWLBBM;
	private String RYYWLBMC;
	private String RYYWLBMS;
	private Integer sfqy;
	private Integer xssx; // 显示顺序	
	private String bz; // 备注
	public Integer getXssx() {
		return xssx;
	}


	public void setXssx(Integer xssx) {
		this.xssx = xssx;
	}

	public String getBz() {
		return bz;
	}


	public void setBz(String bz) {
		this.bz = bz;
	}
	

	public OrganizationPositionRank() {
		super();
	}

	public OrganizationPositionRank(String id){
		this();
		this.id = id;
	}
	 
	@Length(min=1, max=200)
	

	public String getZZJG_ID() {
		return ZZJG_ID;
	}

	public void setZZJG_ID(String iP_ZZJG_ID) {
		this.ZZJG_ID = iP_ZZJG_ID;
	}


	public Integer getSfqy() {
		return sfqy;
	}


	public void setSfqy(Integer sfqy) {
		this.sfqy = sfqy;
	}


	public String getRYYWLBMS() {
		return RYYWLBMS;
	}


	public void setRYYWLBMS(String rYYWLBMS) {
		RYYWLBMS = rYYWLBMS;
	}


	public String getRYYWLBMC() {
		return RYYWLBMC;
	}


	public void setRYYWLBMC(String rYYWLBMC) {
		RYYWLBMC = rYYWLBMC;
	}


	public String getRYYWLBBM() {
		return RYYWLBBM;
	}


	public void setRYYWLBBM(String rYYWLBBM) {
		RYYWLBBM = rYYWLBBM;
	}

	
}


