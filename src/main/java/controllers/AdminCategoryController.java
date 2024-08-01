package controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import dao.CategoryImpl;
import dao.ProductImpl;
import entities.Category;
import entities.CategoryPage;

@Controller
@RequestMapping(value="admin")
public class AdminCategoryController {
	@Autowired
	CategoryImpl categoryImpl;
	@Autowired
	ProductImpl productImpl;
	
	@RequestMapping(value = "category")
	public String category(String search, String parentName, Integer currentPage, String success, String error, Model model) {
		parentName = parentName==null?"":parentName;
		currentPage = currentPage==null?1:currentPage;
		int pageSize = 3;
		CategoryPage categoryPage = categoryImpl.paging(parentName, currentPage, pageSize);
		model.addAttribute("currentPage", currentPage);
		
		if (search!=null) {
			model.addAttribute("category", categoryImpl.search(search));
			model.addAttribute("totalPage", 1);
		} else {
			model.addAttribute("category", categoryPage.getList());
			model.addAttribute("totalPage", categoryPage.getTotalPage());
		}
		model.addAttribute("page", "category");
		model.addAttribute("success", success);
		model.addAttribute("error", error);
		return "admin/index";
	}
	
	@RequestMapping(value = "category/add", method = RequestMethod.GET)
	public String categoryAdd(Model model) {
		Category category = new Category();
		model.addAttribute("category", category);
		model.addAttribute("page", "category-add");
		return "admin/index";
	}
	
	@RequestMapping(value = "category/add", method = RequestMethod.POST)
	public String categoryAdd(@Valid @ModelAttribute("category") Category category, BindingResult result, Model model) {
		Category check = categoryImpl.getByName(category.getName());
		if (check.getName()!=null) {
			model.addAttribute("errorNameUnique", "This name has already exist!");
			model.addAttribute("category", category);
			model.addAttribute("page", "category-add");
			return "admin/index";
		}
		if (result.hasErrors()) {
			model.addAttribute("category", category);
			model.addAttribute("page", "category-add");
			return "admin/index";
		}
		categoryImpl.add(category);
		model.addAttribute("success", "Add new category success!");
		return "redirect:/admin/category";
	}
	
	@RequestMapping(value = "category/edit/{id}", method = RequestMethod.GET)
	public String categoryEdit(@PathVariable("id") int id, Model model) {
		model.addAttribute("category", categoryImpl.getById(id));
		model.addAttribute("page", "category-edit");
		return "admin/index";
	}
	
	@RequestMapping(value = "category/edit", method = RequestMethod.POST)
	public String categoryEdit(@Valid @ModelAttribute("category") Category category, BindingResult result, Model model) {
		String name = category.getName();
		Category check = categoryImpl.getByName(name);
		if (check.getName()!=null && check.getId()!=category.getId()) {
			model.addAttribute("errorNameUnique", "This name has already exist!");
			model.addAttribute("category", category);
			model.addAttribute("page", "category-edit");
			return "admin/index";
		}
		if (result.hasErrors()) {
			model.addAttribute("category", category);
			model.addAttribute("page", "category-edit");
			return "admin/index";
		}
		categoryImpl.update(category);
		model.addAttribute("success", "Update category name "+category.getName()+" success!");
		return "redirect:/admin/category";
	}
	
	@RequestMapping(value = "category/delete/{id}", method = RequestMethod.GET)
	public String categoryDelete(@PathVariable("id") int id, Model model) {
		if (productImpl.getByCategoryId(id).size()!=0) {
			model.addAttribute("error", "Can not delete category name "+categoryImpl.getById(id).getName()+" because has Product related!");
			return "redirect:/admin/category";
		}
		categoryImpl.delete(id);
		model.addAttribute("success", "Delete category success!");
		return "redirect:/admin/category";
	}
}
