/**
 * There are <a href="https://github.com/thinkgem/jeesite">JeeSite</a> code generation
 */
package com.thinkgem.jeesite.modules.ip.service;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.BaseService;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.ip.entity.TechniqueOutput;
import com.thinkgem.jeesite.modules.ip.dao.TechniqueOutputDao;

/**
 * 副产品信息Service
 * @author WuWB
 * @version 2016-06-27
 */
@Component
@Transactional(readOnly = true)
public class TechniqueOutputService extends BaseService {

	@Autowired
	private TechniqueOutputDao techniqueOutputDao;
	
	public TechniqueOutput get(String id) {
		return techniqueOutputDao.get(id);
	}
	
	public Page<TechniqueOutput> find(Page<TechniqueOutput> page, TechniqueOutput techniqueOutput) {
		DetachedCriteria dc = techniqueOutputDao.createDetachedCriteria();
		if (StringUtils.isNotEmpty(techniqueOutput.getIp_gygzzx_id())){
			dc.add(Restrictions.like("gygzzx_id", "%"+techniqueOutput.getIp_gygzzx_id()+"%"));
		}
		dc.add(Restrictions.eq(TechniqueOutput.FIELD_DEL_FLAG, TechniqueOutput.DEL_FLAG_NORMAL));
		dc.addOrder(Order.desc("id"));
		return techniqueOutputDao.find(page, dc);
	}
	
	@Transactional(readOnly = false)
	public void save(TechniqueOutput techniqueOutput) {
		techniqueOutputDao.save(techniqueOutput);
	}
	
	@Transactional(readOnly = false)
	public void delete(String id) {
		techniqueOutputDao.deleteById(id);
	}
	
	@Transactional(readOnly = false)
	public void deletes(String id) {
		techniqueOutputDao.deleteById(id);
	}
}
