package controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminHomeController {
	@RequestMapping(value = "/admin")
	public String index(Model model) {
		model.addAttribute("page", "home");
		return "admin/index";
	}
	
	@RequestMapping(value = "admin/search")
	public String search(String search, String page, Model model) {
		System.out.println(page);
		if (page.contains("category")) {
			model.addAttribute("search", search);
			return "redirect:/admin/category";
		}
		if (page.contains("product")) {
			model.addAttribute("search", search);
			return "redirect:/admin/product";
		}
		if (page.contains("account")) {
			model.addAttribute("search", search);
			return "redirect:/admin/account";
		}
		return "redirect:/admin";
	}
}
