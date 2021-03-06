/**
 * There are <a href="https://github.com/thinkgem/jeesite">JeeSite</a> code generation
 */
package com.thinkgem.jeesite.modules.ip.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.IdEntity;

/**
 * 基本信息Entity
 * 
 * @author yrd
 * @version 2016-06-27
 */
@Entity
@Table(name = "IP_GYGZZX")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class TechniqueWorkcenter extends IdEntity<TechniqueWorkcenter> {

	private static final long serialVersionUID = 1L;
	// private String id; // 编号
//	private String gylx_id; // 工艺路线_ID
//	private String zcpjldw_id; // 主产品_ID
//	private String gzzx_id;// 工作中心_ID
	private Integer sfmrgzzx; // 是否默认工作中心
	private Integer sjdw; // 时间单位
	private Integer bzzbsj; // 标准准备时间
	private Integer bzpdsj; // 标准排队时间
	private Integer bzjgsj; // 标准产品加工时间
	private Integer bzwlbysj; // 标准物料搬运时间
	private Integer cpqhsj; // 产品切换时间
	private Integer plzl; // 批量增量
	private Integer pljgsj; // 批量间隔时间
	private Integer zxscpl; // 最小生产批量
	private Integer zdscpl; // 最大生产批量
	private Integer zjjscpl; // 最经济生产批量
	private Integer ydpl; // 移动批量
	private Float cpzll; // 产品质量率
	private Float dwcb; // 单位成本
	private Float dwjjgz; // 单位计件工资
	private Integer sfqy; // 是否启用
	private Integer xssx; // 显示顺序
	private String bz; // 备注

	private Technique technique;
	private Material material;
	private WorkCenter workcenter;
	
	@ManyToOne
	@JoinColumn(name="IP_GYLX_ID")
	public Technique getTechnique() {
		return technique;
	}
	
	public void setTechnique(Technique technique) {
		this.technique = technique;
	}
	
	
	@ManyToOne
	@JoinColumn(name="IP_WLBM_ID")
	public Material getMaterial() {
		return material;
	}

	public void setMaterial(Material material) {
		this.material = material;
	}
	
	
	@ManyToOne
	@JoinColumn(name="IP_GZZX_ID")
	public WorkCenter getWorkcenter() {
		return workcenter;
	}

	public void setWorkcenter(WorkCenter workcenter) {
		this.workcenter = workcenter;
	}

	public TechniqueWorkcenter() {
		super();
	}

	public TechniqueWorkcenter(String id) {
		this();
		this.id = id;
	}

//	@Column(name="IP_WLBM_ID")
//	public String getZcpjldw_id() {
//		return zcpjldw_id;
//	}
//
//	public void setZcpjldw_id(String zcpjldw_id) {
//		this.zcpjldw_id = zcpjldw_id;
//	}
	
//	@Column(name="IP_GZZX_ID")
//	public String getGzzx_id() {
//		return gzzx_id;
//	}
//
//	public void setGzzx_id(String gzzx_id) {
//		this.gzzx_id = gzzx_id;
//	}
//
//	@Column(name="IP_GYLX_ID")
//	public String getGylx_id() {
//		return gylx_id;
//	}
//
//	public void setGylx_id(String gylx_id) {
//		this.gylx_id = gylx_id;
//	}

	public Integer getSfmrgzzx() {
		return sfmrgzzx;
	}

	public void setSfmrgzzx(Integer sfmrgzzx) {
		this.sfmrgzzx = sfmrgzzx;
	}

	public Integer getSjdw() {
		return sjdw;
	}

	public void setSjdw(Integer sjdw) {
		this.sjdw = sjdw;
	}

	public Integer getBzzbsj() {
		return bzzbsj;
	}

	public void setBzzbsj(Integer bzzbsj) {
		this.bzzbsj = bzzbsj;
	}

	public Integer getBzpdsj() {
		return bzpdsj;
	}

	public void setBzpdsj(Integer bzpdsj) {
		this.bzpdsj = bzpdsj;
	}

	public Integer getBzwlbysj() {
		return bzwlbysj;
	}

	public void setBzwlbysj(Integer bzwlbysj) {
		this.bzwlbysj = bzwlbysj;
	}

	public Integer getCpqhsj() {
		return cpqhsj;
	}

	public void setCpqhsj(Integer cpqhsj) {
		this.cpqhsj = cpqhsj;
	}

	public Integer getPlzl() {
		return plzl;
	}

	public void setPlzl(Integer plzl) {
		this.plzl = plzl;
	}

	public Integer getPljgsj() {
		return pljgsj;
	}

	public void setPljgsj(Integer pljgsj) {
		this.pljgsj = pljgsj;
	}

	public Integer getZxscpl() {
		return zxscpl;
	}

	public void setZxscpl(Integer zxscpl) {
		this.zxscpl = zxscpl;
	}

	public Integer getZdscpl() {
		return zdscpl;
	}

	public void setZdscpl(Integer zdscpl) {
		this.zdscpl = zdscpl;
	}

	public Integer getZjjscpl() {
		return zjjscpl;
	}

	public void setZjjscpl(Integer zjjscpl) {
		this.zjjscpl = zjjscpl;
	}

	public Integer getYdpl() {
		return ydpl;
	}

	public void setYdpl(Integer ydpl) {
		this.ydpl = ydpl;
	}

	public Float getCpzll() {
		return cpzll;
	}

	public void setCpzll(Float cpzll) {
		this.cpzll = cpzll;
	}

	public Float getDwcb() {
		return dwcb;
	}

	public void setDwcb(Float dwcb) {
		this.dwcb = dwcb;
	}

	public Float getDwjjgz() {
		return dwjjgz;
	}

	public void setDwjjgz(Float dwjjgz) {
		this.dwjjgz = dwjjgz;
	}

	public String getBz() {
		return bz;
	}

	public void setBz(String bz) {
		this.bz = bz;
	}

	

	public Integer getBzjgsj() {
		return bzjgsj;
	}

	public void setBzjgsj(Integer bzjgsj) {
		this.bzjgsj = bzjgsj;
	}

	public Integer getSfqy() {
		return sfqy;
	}

	public void setSfqy(Integer sfqy) {
		this.sfqy = sfqy;
	}

	public Integer getXssx() {
		return xssx;
	}

	public void setXssx(Integer xssx) {
		this.xssx = xssx;
	}
}
