package controllers;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import dao.OrderDetailImpl;
import dao.OrderImpl;
import dao.ProductImpl;
import entities.Category;
import entities.Orders;

@Controller
@RequestMapping(value = "admin")
public class AdminOrderController {
	@Autowired
	OrderImpl orderImpl;
	@Autowired
	OrderDetailImpl orderDetailImpl;
	@Autowired
	ProductImpl productImpl;
	
	@RequestMapping(value = "order")
	public String order(Model model) {
		model.addAttribute("order", orderImpl.getAll());
		model.addAttribute("page", "order");
		return "admin/index";
	}
	
	@RequestMapping(value = "order/edit/{id}", method = RequestMethod.GET)
	public String orderEdit(@PathVariable("id") int id, Model model) {
		model.addAttribute("order", orderImpl.getById(id));
		model.addAttribute("page", "order-edit");
		return "admin/index";
	}
	
	@RequestMapping(value = "order/edit", method = RequestMethod.POST)
	public String orderEdit(Integer status, @ModelAttribute("order") Orders order, Model model) {
		order.setStatus(status);
		orderImpl.update(order);
		model.addAttribute("success", "Update order id "+order.getId()+" success!");
		return "redirect:/admin/order";
	}
	
	@RequestMapping(value = "order/detail/{id}")
	public String orderDetail(@PathVariable("id") int id, Model model) {
		model.addAttribute("order", orderImpl.getById(id));
		model.addAttribute("list", orderDetailImpl.getByOrderId(id));
		model.addAttribute("product", productImpl.getAll());
		model.addAttribute("page", "order-detail");
		return "admin/index";
	}
}
