/**
 * There are <a href="https://github.com/thinkgem/jeesite">JeeSite</a> code generation
 */
package com.thinkgem.jeesite.modules.ip.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import com.thinkgem.jeesite.modules.ip.entity.TechniqueOutput;
import com.thinkgem.jeesite.modules.ip.service.TechniqueOutputService;

/**
 * 副产品信息Controller
 * @author WuWB
 * @version 2016-06-27
 */
@Controller
@RequestMapping(value = "${adminPath}/ip/techniqueOutput")
public class TechniqueOutputController extends BaseController {

	@Autowired
	private TechniqueOutputService techniqueOutputService;
	
	@ModelAttribute
	public TechniqueOutput get(@RequestParam(required=false) String id) {
		if (StringUtils.isNotBlank(id)){
			return techniqueOutputService.get(id);
		}else{
			return new TechniqueOutput();
		}
	}
	
	@RequiresPermissions("ip:techniqueOutput:view")
	@RequestMapping(value = {"list", ""})
	public String list(TechniqueOutput techniqueOutput, HttpServletRequest request, HttpServletResponse response, Model model) {
		User user = UserUtils.getUser();
		if (!user.isAdmin()){
			techniqueOutput.setCreateBy(user);
		}
        Page<TechniqueOutput> page = techniqueOutputService.find(new Page<TechniqueOutput>(request, response), techniqueOutput); 
        model.addAttribute("page", page);
		return "modules/" + "ip/techniqueOutputList";
	}

	@RequiresPermissions("ip:techniqueOutput:view")
	@RequestMapping(value = "form")
	public String form(TechniqueOutput techniqueOutput, Model model) {
		model.addAttribute("techniqueOutput", techniqueOutput);
		return "modules/" + "ip/techniqueOutputForm";
	}

	@RequiresPermissions("ip:techniqueOutput:edit")
	@RequestMapping(value = "save")
	public String save(TechniqueOutput techniqueOutput, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, techniqueOutput)){
			return form(techniqueOutput, model);
		}
		techniqueOutputService.save(techniqueOutput);
		addMessage(redirectAttributes, "保存副产品信息'" + techniqueOutput.getip_wl_id() + "'成功");
		return "redirect:"+Global.getAdminPath()+"/ip/techniqueOutput/?repage";
	}
	
	@RequiresPermissions("ip:techniqueOutput:edit")
	@RequestMapping(value = "delete")
	public String delete(String id, RedirectAttributes redirectAttributes) {
		techniqueOutputService.delete(id);
		addMessage(redirectAttributes, "删除副产品信息成功");
		return "redirect:"+Global.getAdminPath()+"/ip/techniqueOutput/?repage";
	}

	@RequiresPermissions("ip:techniqueOutput:edit")
	@RequestMapping(value = "deletes")
	public String deletes(String id[], RedirectAttributes redirectAttributes) {
		for(int i=0; i<id.length; i++){
			techniqueOutputService.deletes(id[i]);
		}
		addMessage(redirectAttributes, "删除副产品信息成功");
		return "redirect:"+Global.getAdminPath()+"/ip/techniqueOutput/?repage";
	}
}
