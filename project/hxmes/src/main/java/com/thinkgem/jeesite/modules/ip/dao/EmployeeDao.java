/**
 * There are <a href="https://github.com/thinkgem/jeesite">JeeSite</a> code generation
 */
package com.thinkgem.jeesite.modules.ip.dao;

import java.io.Serializable;
import java.text.ParseException;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.google.common.collect.Maps;
import com.thinkgem.jeesite.common.persistence.BaseDao;
import com.thinkgem.jeesite.common.persistence.BaseEntity;
import com.thinkgem.jeesite.common.persistence.Parameter;
import com.thinkgem.jeesite.modules.ip.entity.EmployeeContact;
import com.thinkgem.jeesite.modules.ip.entity.Employee;
import com.thinkgem.jeesite.modules.ip.entity.Organization;
import com.thinkgem.jeesite.modules.sys.entity.Menu;

/**
 * 个人信息DAO接口
 * @author cml
 * @version 2016-06-22
 */
@Repository
public class EmployeeDao extends BaseDao<Employee> {
	private EmployeeContactDao employeeContactDao;

	public void saves(EmployeeContact employeeContact, String zg_id)   {
		//employeeContact.setZg_id(zg_id);
		employeeContactDao.save(employeeContact);
	}
	
	public Employee getIDfromGH(String GH){

		return getByHql("from Employee where GH=:p1", new Parameter(GH));

	}
	
	public Employee getEmployeefromId(String Id){

		return getByHql("from Employee where ID=:p1", new Parameter(Id));
	}
	
	public int DeleteAllRecords(String id){
		int i = update("update EmployeeEducation set delFlag='" + Employee.DEL_FLAG_DELETE + "' where IP_ZGGRXX_ID = :p1", 
					new Parameter(id));
		i = update("update EmployeeCareer set delFlag='" + Employee.DEL_FLAG_DELETE + "' where IP_ZGGRXX_ID = :p1", 
				new Parameter(id));
		i = update("update EmployeeHonor set delFlag='" + Employee.DEL_FLAG_DELETE + "' where IP_ZGGRXX_ID = :p1", 
				new Parameter(id));
		i = update("update EmployeeProject set delFlag='" + Employee.DEL_FLAG_DELETE + "' where IP_ZGGRXX_ID = :p1", 
				new Parameter(id));
		i = update("update EmployeePosition set delFlag='" + Employee.DEL_FLAG_DELETE + "' where IP_ZGGRXX_ID = :p1", 
				new Parameter(id));
		i = update("update EmployeePoliticalStatus set delFlag='" + Employee.DEL_FLAG_DELETE + "' where IP_ZGGRXX_ID = :p1", 
				new Parameter(id));
		i = update("update EmployeeAward set delFlag='" + Employee.DEL_FLAG_DELETE + "' where IP_ZGGRXX_ID = :p1", 
				new Parameter(id));
		i = update("update EmployeeAppraisal set delFlag='" + Employee.DEL_FLAG_DELETE + "' where IP_ZGGRXX_ID = :p1", 
				new Parameter(id));
		return i;
	}

	public Integer getNewxssx() {
		Employee Ep = getByHql("from Employee where xssx = (select Max(xssx) from Employee)");
		return Ep.getXssx()+1;
	}

	
}
