package com.icoding.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class FoodController {
	
	@RequestMapping(value = { "/admin/food", "/admin/food/list" }, method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	public String displayPage(Model model) {
		model.addAttribute("pageName", "Manage Food");
		model.addAttribute("title", "Manage Food");
		return "food/index";
	}
}
