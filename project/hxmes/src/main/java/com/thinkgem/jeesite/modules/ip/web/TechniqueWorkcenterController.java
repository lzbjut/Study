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
import com.thinkgem.jeesite.modules.ip.entity.TechniqueWorkcenter;
import com.thinkgem.jeesite.modules.ip.service.TechniqueWorkcenterService;

/**
 * 基本信息Controller
 * 
 * @author yrd
 * @version 2016-06-27
 */
@Controller
@RequestMapping(value = "${adminPath}/ip/techniqueWorkcenter")
public class TechniqueWorkcenterController extends BaseController {

	@Autowired
	private TechniqueWorkcenterService techniqueWorkcenterService;

	@ModelAttribute
	public TechniqueWorkcenter get(@RequestParam(required = false) String id) {
		if (StringUtils.isNotBlank(id)) {
			return techniqueWorkcenterService.get(id);
		} else {
			return new TechniqueWorkcenter();
		}
	}

	@RequiresPermissions("ip:techniqueWorkcenter:view")
	@RequestMapping(value = { "list", "" })
	public String list(TechniqueWorkcenter techniqueWorkcenter,
			HttpServletRequest request, HttpServletResponse response,
			Model model) {
		User user = UserUtils.getUser();
		if (!user.isAdmin()) {
			techniqueWorkcenter.setCreateBy(user);
		}
		String subPageType = request.getParameter("subPageType");
		String moduleUrl = null;
		if (subPageType == null) {
			subPageType = "1";
		}
		if (subPageType.equals("1"))
			moduleUrl = "";
		else if (subPageType.equals("2"))
			moduleUrl = "techniqueStore";
		else if (subPageType.equals("3"))
			moduleUrl = "techniqueInput";
		else if (subPageType.equals("4"))
			moduleUrl = "techniqueOutput";
		else if (subPageType.equals("5"))
			moduleUrl = "techniqueEnergy";

		Page<TechniqueWorkcenter> page = techniqueWorkcenterService.find(
				new Page<TechniqueWorkcenter>(request, response),
				techniqueWorkcenter);
		model.addAttribute("page", page);
		model.addAttribute("direct", moduleUrl);
		return "modules/" + "ip/techniqueWorkcenterList";
	}

	@RequiresPermissions("ip:techniqueWorkcenter:view")
	@RequestMapping(value = "form")
	public String form(TechniqueWorkcenter techniqueWorkcenter, Model model) {
		model.addAttribute("techniqueWorkcenter", techniqueWorkcenter);
		return "modules/" + "ip/techniqueWorkcenterForm";
	}

	@RequiresPermissions("ip:techniqueWorkcenter:edit")
	@RequestMapping(value = "save")
	public String save(TechniqueWorkcenter techniqueWorkcenter, Model model,
			RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, techniqueWorkcenter)) {
			return form(techniqueWorkcenter, model);
		}
		techniqueWorkcenterService.save(techniqueWorkcenter);
		addMessage(redirectAttributes,
				"保存基本信息成功");
		return "redirect:" + Global.getAdminPath()
				+ "/ip/techniqueWorkcenter/?repage";
	}

	@RequiresPermissions("ip:techniqueWorkcenter:edit")
	@RequestMapping(value = "delete")
	public String delete(String id, RedirectAttributes redirectAttributes) {
		techniqueWorkcenterService.delete(id);
		addMessage(redirectAttributes, "删除基本信息成功");
		return "redirect:" + Global.getAdminPath()
				+ "/ip/techniqueWorkcenter/?repage";
	}

	@RequiresPermissions("ip:techniqueWorkcenter:edit")
	@RequestMapping(value = "deletes")
	public String deletes(String id[], RedirectAttributes redirectAttributes) {
		for (int i = 0; i < id.length; i++) {
			techniqueWorkcenterService.deletes(id[i]);
		}
		addMessage(redirectAttributes, "删除基本信息成功");
		return "redirect:" + Global.getAdminPath()
				+ "/ip/techniqueWorkcenter/?repage";
	}
}
