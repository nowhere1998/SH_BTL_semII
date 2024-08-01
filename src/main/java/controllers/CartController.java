package controllers;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.OrderImpl;
import dao.ProductImpl;
import entities.OrderDetail;
import entities.Orders;
import entities.Product;

@Controller
public class CartController {
	@Autowired
	OrderImpl orderImpl;
	@Autowired
	ProductImpl productImpl;
	
	@RequestMapping(value = "addProduct/{id}")
	public void add(@PathVariable("id") int id, Model model, HttpServletRequest req) {
		HttpSession session = req.getSession();
		Product product = productImpl.getById(id);
		List<OrderDetail> cart = new ArrayList<OrderDetail>();
		if (session.getAttribute("cart")==null) {
			OrderDetail orderDetail = new OrderDetail();
			orderDetail.setAmount(1);
			orderDetail.setProductId(id);
			orderDetail.setPrice(product.getSalePrice()==0?product.getPrice():product.getSalePrice());
			cart.add(orderDetail);
		} else {
			cart = (List<OrderDetail>) session.getAttribute("cart");
			boolean duplicate = false;
			for (OrderDetail orderDetail : cart) {
				if (orderDetail.getProductId()==id) {
					orderDetail.setAmount(orderDetail.getAmount()+1);
					orderDetail.setPrice(product.getSalePrice()==0?product.getPrice()*orderDetail.getAmount():product.getSalePrice()*orderDetail.getAmount());
					duplicate = true;
					break;
				}
			}
			if (duplicate) {
				session.setAttribute("cart", cart);
			} else {
				OrderDetail orderDetail = new OrderDetail();
				orderDetail.setAmount(1);
				orderDetail.setProductId(id);
				orderDetail.setPrice(product.getSalePrice()==0?product.getPrice():product.getSalePrice());
				cart.add(orderDetail);
			}
		}
		session.setAttribute("cart", cart);
	}
	
	@RequestMapping(value = "cart")
	public String cart(Model model, HttpServletRequest req) {
		model.addAttribute("page", "cart");
		List<OrderDetail> cart = new ArrayList<OrderDetail>();
		HttpSession session = req.getSession();
		if (session.getAttribute("cart") != null) {
			cart = (List<OrderDetail>) session.getAttribute("cart");
		}
		model.addAttribute("cart", cart);
		model.addAttribute("product", productImpl.getAll());
		return "index";
	}
	
	@RequestMapping(value = "updateCart/{id}/{value}")
	public String updateCart(@PathVariable("id") int id, @PathVariable("value") Integer amount, Model model, HttpServletRequest req) {
		List<OrderDetail> cart = new ArrayList<>();
		HttpSession session = req.getSession();
		if (session.getAttribute("cart") != null) {
			cart = (List<OrderDetail>) session.getAttribute("cart");
			for (int i = 0; i < cart.size(); i++) {
				OrderDetail item = cart.get(i);
				if (item.getProductId()==id) {
					item.setAmount(amount);
					break;
				}
			}
		}
		session.setAttribute("cart", cart);
		model.addAttribute("page", "cart");
		model.addAttribute("product", productImpl.getAll());
		return "index";
	}
	
	@RequestMapping(value = "removeCartItem/{id}")
	public String removeCartItem(@PathVariable("id") Integer id, Model model, HttpServletRequest req) {
		List<OrderDetail> cart = new ArrayList<>();
		HttpSession session = req.getSession();
		boolean find = false;
		if (session.getAttribute("cart") != null) {
			int i;
			cart = (List<OrderDetail>) session.getAttribute("cart");
			for (i = 0; i < cart.size(); i++) {
				OrderDetail item = cart.get(i);
				if (item.getProductId()==id) {
					find = true;
					break;
				}
			}
			if (find) {
				cart.remove(i);
			}
			session.setAttribute("cart", cart);
		}
		session.setAttribute("cart", cart);
		model.addAttribute("page", "cart");
		model.addAttribute("product", productImpl.getAll());
		return "index";
	}
	
	@RequestMapping(value = "checkout")
	public String checkout(String address, String note, Integer phone, Model model, HttpServletRequest req) {
		List<OrderDetail> cart=null;
		HttpSession session = req.getSession();
		float total = 0;
		if (session.getAttribute("userId") == null) {
			return "redirect:/login";
		}
		if (session.getAttribute("cart") != null) {
			cart = (List<OrderDetail>) session.getAttribute("cart");
			String timeStamp = new SimpleDateFormat("yyMMdd-HHmmss").format(Calendar.getInstance().getTime());
			Orders order=new Orders();
			order.setCreatedAt("HD"+timeStamp);
			order.setAccountId((int) session.getAttribute("userId"));
//			order.setOrderDate(Date.valueOf(LocalDate.now()));
			for (OrderDetail orderDetail : cart) {
				total += orderDetail.getPrice()*orderDetail.getAmount();
			}
			order.setTotalPrice(total);
			order.setAddress(address);
			order.setPhone(phone);
			order.setNote(note);
			order.setStatus(0);
			orderImpl.add(order);
			orderImpl.addOrderDetail(cart, orderImpl.getLast().getId());
			model.addAttribute("msg","Check out success!");
		} else {
			model.addAttribute("msg","Cart is empty!");
		}
		model.addAttribute("page","cart");
		cart =new ArrayList<OrderDetail>();
		session.setAttribute("cart", null);
		model.addAttribute("cart", cart);
		return "index";
	}
}
