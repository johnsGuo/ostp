package com.peace.ostp.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/admin")
public class CommunityController {
	public static final String SUCCESS_MESSAGE = "success";
	public static final String ERROR_MESSAGE = "failed";
	/**
	 * 社区管理 shequ_add 社区添加 shequ_edit 社区编辑 shequ_view 社区详情 shequ 社区列表
	 */
	@RequestMapping(value = "/community_add", method = RequestMethod.GET)
	public String shequ_addGet(Model community_add, HttpServletRequest request) {
		return "admin/community/community_add";
	}

	@RequestMapping(value = "/community_edit", method = RequestMethod.GET)
	public String shequ_editGet(Model model, HttpServletRequest request) {
		return "admin/community/community_edit";
	}

	@RequestMapping(value = "/community_view", method = RequestMethod.GET)
	public String shequ_viewGet(Model model, HttpServletRequest request) {
		return "admin/community/community_view";
	}

	@RequestMapping(value = "/community_list", method = RequestMethod.GET)
	public String shequGet(Model model, HttpServletRequest request) {
		return "admin/community/community_list";
	}

}
