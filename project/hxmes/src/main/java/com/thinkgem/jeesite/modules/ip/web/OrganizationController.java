/**
 * There are <a href="https://github.com/thinkgem/jeesite">JeeSite</a> code generation
 */
package com.thinkgem.jeesite.modules.ip.web;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.authz.annotation.RequiresUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.sys.entity.Office;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import com.thinkgem.jeesite.modules.ip.entity.Organization;
import com.thinkgem.jeesite.modules.ip.entity.OrganizationDepartment;
import com.thinkgem.jeesite.modules.ip.service.OrganizationDepartmentService;
//import com.thinkgem.jeesite.modules.ip.form.TreeList;
import com.thinkgem.jeesite.modules.ip.service.OrganizationService;

/**
 * 组织机构管理Controller
 * @author sse
 * @version 2016-06-15
 */
@Controller
@RequestMapping(value = "${adminPath}/ip/organization")
public class OrganizationController extends BaseController {

	@Autowired
	private OrganizationService organizationService;
	@Autowired
	private OrganizationDepartmentService organizationDepartmentService;
	
	@ModelAttribute
	public Organization get(@RequestParam(required=false) String id) {
		if (StringUtils.isNotBlank(id)){
			return organizationService.get(id);
		}else{
			return new Organization();
		}
	}
	
	@RequiresPermissions("ip:organization:view")
	@RequestMapping(value = "")
	public String index() {
		
		return "modules/ip/organizationIndex";
	}

	@RequiresPermissions("ip:organization:view")
	@RequestMapping(value = "tree")
	public String tree(Organization organization, Model model) {
		//model.addAttribute("organizationList", organizationService.findById(true, null));
		
		List<Map<String, Object>> mapList = Lists.newArrayList();
		
		List<Organization> list = organizationService.findById(true, null);
		List<OrganizationDepartment> DList = organizationDepartmentService.findAll();
		for (int i=0; i<list.size(); i++){
			Organization e = list.get(i);	
			Map<String, Object> map = Maps.newHashMap();
			map.put("id", e.getId());
			map.put("pId", null);
			map.put("name", e.getJgmc());
			//map.put("url",);
			mapList.add(map);
//			for(int j=0;j<DList.size();j++){
//				OrganizationDepartment ed = DList.get(j);
//				if(e.getId().equals(ed.getOrganzation().getId())){
//					Map<String, Object> mapd = Maps.newHashMap();
//					mapd.put("id", ed.getId());
//					mapd.put("pId", ed.getOrganzation().getId() != null ? ed.getOrganzation().getId() : 0);
//					mapd.put("name", ed.getBmmc());
//					mapd.put("url","/ip/organizationDepartment/list?id=");
//					mapList.add(mapd);
//				}
//				
//			}
		}
		
		model.addAttribute("organizationList", mapList);
		
		return "modules/" + "ip/organizationTree";
	}
	
	@RequiresPermissions("ip:organization:view")
	@RequestMapping(value = "list")
	public String list(Organization organization, HttpServletRequest request, HttpServletResponse response, Model model) {
		User user = UserUtils.getUser();
		if (!user.isAdmin()){
			organization.setCreateBy(user);
		}
        Page<Organization> page = organizationService.find(new Page<Organization>(request, response), organization); 
        model.addAttribute("page", page);
		return "modules/" + "ip/organizationList";
	}

	@RequiresPermissions("ip:organization:view")
	@RequestMapping(value = "form")
	public String form(Organization organization, Model model) {
		List<Organization> list = organizationService.findAll();
		model.addAttribute("list", list);
		model.addAttribute("organization", organization);
		return "modules/" + "ip/organizationForm";
	}

	@RequiresPermissions("ip:organization:edit")
	@RequestMapping(value = "save")
	public String save(Organization organization, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, organization)){
			return form(organization, model);
		}
		organizationService.save(organization);
		addMessage(redirectAttributes, "保存组织机构管理'" + organization.getJgmc() + "'成功");
		return "redirect:"+Global.getAdminPath()+"/ip/organization/list/?repage";
	}
	
	@RequiresPermissions("ip:organization:edit")
	@RequestMapping(value = "delete")
	public String delete(String id, RedirectAttributes redirectAttributes) {
		organizationService.delete(id);
		addMessage(redirectAttributes, "删除组织机构管理成功");
		return "redirect:"+Global.getAdminPath()+"/ip/organization/list/?repage";
	}
	
	@RequiresUser
	@ResponseBody
	@RequestMapping("treeData")
	public List<Map<String, Object>> treeData(HttpServletResponse response) {
		response.setContentType("application/json; charset=UTF-8");
		List<Map<String, Object>> mapList = Lists.newArrayList();
		
		List<Organization> list = organizationService.findById(true, null);
		for (int i=0; i<list.size(); i++){
			Organization e = list.get(i);	
			Map<String, Object> map = Maps.newHashMap();
			map.put("id", e.getId());
			map.put("pId", e.getId() != null ? e.getId() : 0);
			map.put("name", e.getJgmc());
			mapList.add(map);
		}
		
		return mapList;
		
		/*
		 * response.setContentType("application/json; charset=UTF-8");
		List<Map<String, Object>> mapList = Lists.newArrayList();
		
		List<Organization> list = organizationService.findById(true, null);
		for (int i=0; i<list.size(); i++){
			Organization e = list.get(i);
		
			Map<String, Object> map = Maps.newHashMap();
			map.put("id", e.getId());
			map.put("pId", e.getId() != null ? e.getId() : 0);
			map.put("name", e.getJgmc());
			mapList.add(map);
		}
		
		return mapList;
		 */
	}

}
