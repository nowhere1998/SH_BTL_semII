package controllers;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import dao.CategoryImpl;
import dao.ProductImpl;
import entities.Category;
import entities.CategoryPage;
import entities.Product;
import entities.ProductPage;

@Controller
@RequestMapping(value = "admin")
public class AdminProductController {
	@Autowired
	ProductImpl productImpl;
	@Autowired
	CategoryImpl categoryImpl;
	
	@RequestMapping(value = "product")
	public String product(String search, Integer categoryId, Integer currentPage, String success, String error, Model model) {
		currentPage = currentPage==null?1:currentPage;
		int pageSize = 3;
		ProductPage productPage = productImpl.paging(categoryId, currentPage, pageSize);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("category", productPage.getList());
		model.addAttribute("success", success);
		model.addAttribute("error", error);
		if (search!=null) {
			model.addAttribute("product", productImpl.search(search));
			model.addAttribute("totalPage", 1);
		} else {
			model.addAttribute("product", productPage.getList());
			model.addAttribute("totalPage", productPage.getTotalPage());
		}
		model.addAttribute("page", "product");
		return "admin/index";
	}
	
	@RequestMapping(value = "product/add", method = RequestMethod.GET)
	public String productAdd(Model model) {
		Product product = new Product();
		model.addAttribute("category", categoryImpl.getAll());
		model.addAttribute("product", product);
		model.addAttribute("page", "product-add");
		return "admin/index";
	}
	
	@RequestMapping(value = "product/add", method = RequestMethod.POST)
	public String productAdd(@Valid @ModelAttribute("product") Product product, BindingResult result, @RequestParam("file") MultipartFile file, Model model, HttpServletRequest req) {
		Product check = productImpl.getByName(product.getName());
		System.out.println(check);
		if (check.getName()!=null) {
			model.addAttribute("errorNameUnique", "This name has already exist!");
			model.addAttribute("category", categoryImpl.getAll());
			model.addAttribute("product", product);
			model.addAttribute("page", "product-add");
			return "admin/index";
		}
		if (product.getPrice()==0) {
			model.addAttribute("errorPrice", "Price must bigger than 0!");
			model.addAttribute("category", categoryImpl.getAll());
			model.addAttribute("product", product);
			model.addAttribute("page", "product-add");
			return "admin/index";
		}
		if (product.getSalePrice() >= product.getPrice()) {
			model.addAttribute("errorSalePrice", "Sale price can not bigger than price!");
			model.addAttribute("category", categoryImpl.getAll());
			model.addAttribute("product", product);
			model.addAttribute("page", "product-add");
			return "admin/index";
		}
		if (product.getSalePrice()<0) {
			product.setSalePrice(0);
		}
		if (result.hasErrors()) {
			model.addAttribute("category", categoryImpl.getAll());
			model.addAttribute("product", product);
			model.addAttribute("page", "product-add");
			return "admin/index";
		}
		if (file.getOriginalFilename()!="") {
			String uploadRootPath = req.getServletContext().getRealPath("resources/images");
			File destination = new File(uploadRootPath+"/"+file.getOriginalFilename());
			try {
				file.transferTo(destination);
			} catch (IllegalStateException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			product.setImg("resources/images/"+file.getOriginalFilename());
		}
		productImpl.add(product);
		model.addAttribute("success", "Add new product success!");
		return "redirect:/admin/product";
	}
	
	@RequestMapping(value = "product/edit/{id}", method = RequestMethod.GET)
	public String productEdit(@PathVariable("id") int id, Model model) {
		model.addAttribute("category", categoryImpl.getAll());
		model.addAttribute("product", productImpl.getById(id));
		model.addAttribute("page", "product-edit");
		return "admin/index";
	}
	
	@RequestMapping(value = "product/edit", method = RequestMethod.POST)
	public String productEdit(@Valid @ModelAttribute("product") Product product, BindingResult result,@RequestParam("file") MultipartFile file , Model model, HttpServletRequest req) {
		Product check = productImpl.getByName(product.getName());
		String name = product.getName();
		if (check.getName()!=null && check.getId()!=product.getId()) {
			model.addAttribute("errorNameUnique", "This name has already exist!");
			model.addAttribute("category", categoryImpl.getAll());
			model.addAttribute("product", product);
			model.addAttribute("page", "product-edit");
			return "admin/index";
		}
		if (product.getPrice()==0) {
			model.addAttribute("errorPrice", "Price must bigger than 0!");
			model.addAttribute("category", categoryImpl.getAll());
			model.addAttribute("product", product);
			model.addAttribute("page", "product-edit");
			return "admin/index";
		}
		if (product.getSalePrice() >= product.getPrice()) {
			model.addAttribute("errorSalePrice", "Sale price can not bigger than price!");
			model.addAttribute("category", categoryImpl.getAll());
			model.addAttribute("product", product);
			model.addAttribute("page", "product-edit");
			return "admin/index";
		}
		if (product.getSalePrice()<0) {
			product.setSalePrice(0);
		}
		if (result.hasErrors()) {
			model.addAttribute("category", categoryImpl.getAll());
			model.addAttribute("product", product);
			model.addAttribute("page", "product-edit");
			return "admin/index";
		}
		
		if (file.getOriginalFilename()!="") {
			String uploadRootPath = req.getServletContext().getRealPath("resources/images");
			File destination = new File(uploadRootPath+"/"+file.getOriginalFilename());
			try {
				file.transferTo(destination);
			} catch (IllegalStateException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			product.setImg("resources/images/"+file.getOriginalFilename());
		}
		productImpl.update(product);
		model.addAttribute("success", "Update product success!");
		return "redirect:/admin/product";
	}
	
	@RequestMapping(value = "product/delete/{id}", method = RequestMethod.GET)
	public String productDelete(@PathVariable("id") int id, Model model) {
		productImpl.delete(id);
		model.addAttribute("success", "Delete product success!");
		return "redirect:/admin/product";
	}
}
