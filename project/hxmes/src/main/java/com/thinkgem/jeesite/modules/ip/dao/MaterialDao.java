/**
 * There are <a href="https://github.com/thinkgem/jeesite">JeeSite</a> code generation
 */
package com.thinkgem.jeesite.modules.ip.dao;

import org.springframework.stereotype.Repository;

import com.thinkgem.jeesite.common.persistence.BaseDao;
import com.thinkgem.jeesite.common.persistence.Parameter;
import com.thinkgem.jeesite.modules.ip.entity.Material;
import com.thinkgem.jeesite.modules.sys.entity.User;

/**
 * 物料编码信息DAO接口
 * @author ZhangHD
 * @version 2016-06-03
 */
@Repository
public class MaterialDao extends BaseDao<Material> {
	/**
	 * 
	 * @Title: findByWlbm 
	 * @Description: TODO
	 * @param wlbm
	 */
	public Material findByWlbm(String wlbm){
		return getByHql("from Material where id = :p1 and delFlag = :p2", new Parameter(wlbm, User.DEL_FLAG_NORMAL));
	}
}
