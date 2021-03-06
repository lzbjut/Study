/**
 * There are <a href="https://github.com/thinkgem/jeesite">JeeSite</a> code generation
 */
package com.thinkgem.jeesite.modules.ip.dao;

import org.springframework.stereotype.Repository;

import com.thinkgem.jeesite.common.persistence.BaseDao;
import com.thinkgem.jeesite.common.persistence.Parameter;
import com.thinkgem.jeesite.modules.ip.entity.EmployeePositionDirector;

/**
 * 人员岗位设置DAO接口
 * @author yrd
 * @version 2016-09-01
 */
@Repository
public class EmployeePositionDirectorDao extends BaseDao<EmployeePositionDirector> {

	public void deletezgBygwid(String zgid,String gwid) {
		// TODO Auto-generated method stub
		update("update EmployeePositionDirector set del_Flag = '1' where ZG_ID = '"+ zgid +"' AND GW_ID = '"+ gwid + "'");
	}
	
}
