package controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import dao.CategoryImpl;
import dao.OrderImpl;
import dao.ProductImpl;
import dao.UsersImpl;
import entities.ProductPage;
import entities.Users;
import net.bytebuddy.build.Plugin.Engine.Source.Empty;
import util.Cipher;

@Controller
public class HomeController {
	@Autowired 
	UsersImpl usersImpl;
	@Autowired 
	ProductImpl productImpl;
	@Autowired
	CategoryImpl categoryImpl;
	@Autowired
	OrderImpl orderImpl;

	
	@RequestMapping(value = {"/", "home"})
	public String index(Model model) {
		model.addAttribute("product", productImpl.getNewest());
		model.addAttribute("page", "home");
		return "index";
	}
	
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String login(Model model) {
		model.addAttribute("page", "login");
		return "index";
	}
	
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String login(String name, String password, Model model, HttpServletRequest req) {
		Users account = usersImpl.getByNameOrEmail(name);
		String passMD5 = Cipher.GenerateMD5(password);
		if (account==null || !account.getPassword().equals(passMD5)) {
			model.addAttribute("msg", "Information is not correct!");
			model.addAttribute("page", "login");
			return "index";
		}
		HttpSession session = req.getSession();
		session.setMaxInactiveInterval(3600);
		session.setAttribute("userId", account.getId());
		session.setAttribute("userPicture", account.getImg());
		session.setAttribute("userName", account.getName());
		model.addAttribute("product", productImpl.getAll());
		model.addAttribute("page", "home");
		return "index";
	}
	
	@RequestMapping(value = "register", method = RequestMethod.GET)
	public String register(Model model) {
		model.addAttribute("page", "register");
		return "index";
	}
	
	@RequestMapping(value = "register", method = RequestMethod.POST)
	public String register(String confirmPassword, String name, String email, String password, Model model) {
		if (!confirmPassword.equals(password)) {
			model.addAttribute("errorConfirmPassword", "Password is not correct!");
			model.addAttribute("name", name);
			model.addAttribute("email", email);
			model.addAttribute("password", password);
			model.addAttribute("confirmPassword", confirmPassword);
			model.addAttribute("page", "register");
			return "index";
		}
		Users users = new Users();
		Users check = usersImpl.getByNameOrEmail(email);
		if (check.getEmail()!=null) {
			model.addAttribute("errorUniqueEmail", "Email is already exist!");
			model.addAttribute("name", name);
			model.addAttribute("email", email);
			model.addAttribute("password", password);
			model.addAttribute("confirmPassword", confirmPassword);
			model.addAttribute("page", "register");
			return "index";
		}
		if (check.getName()!=null) {
			model.addAttribute("errorUniqueName", "Name is already exist!");
			model.addAttribute("name", name);
			model.addAttribute("email", email);
			model.addAttribute("password", password);
			model.addAttribute("confirmPassword", confirmPassword);
			model.addAttribute("page", "register");
			return "index";
		}
		users.setName(name);
		users.setEmail(email);
		users.setRole(0);
		users.setPassword(Cipher.GenerateMD5(confirmPassword));
		usersImpl.add(users);
		model.addAttribute("page", "login");
		return "index";
	}
	
	@RequestMapping(value = "exit")
	public String exit(Model model, HttpServletRequest req) {
		HttpSession session = req.getSession();
		session.invalidate();
		model.addAttribute("page", "home");
		return "index";
	}
	
	@RequestMapping(value = "shop")
	public String shop(String parentName, String search, Integer categoryId, Integer currentPage, Model model) {
		model.addAttribute("page", "shop");
		currentPage = currentPage==null?1:currentPage;
		int pageSize = 6;
		ProductPage productPage = productImpl.paging(categoryId, currentPage, pageSize);
		model.addAttribute("currentPage", currentPage);
		if (search!=null) {
			model.addAttribute("product", productImpl.search(search));
			model.addAttribute("totalPage", 1);
		} else {
			model.addAttribute("product", productPage.getList());
			model.addAttribute("totalPage", productPage.getTotalPage());
		}
		if (parentName!=null) {
			model.addAttribute("product", productImpl.getAll());
			model.addAttribute("totalPage", 1);
		}
		model.addAttribute("category", categoryImpl.getByParentName(parentName));
		model.addAttribute("men", categoryImpl.getByParentName("men"));
		model.addAttribute("women", categoryImpl.getByParentName("women"));
		model.addAttribute("kid", categoryImpl.getByParentName("kid"));
		model.addAttribute("parentName", parentName);
		return "index";
	}
	
	@RequestMapping(value = "blog")
	public String blog(Model model) {
		model.addAttribute("page", "blog");
		return "index";
	}
	
	@RequestMapping(value = "about")
	public String about(Model model) {
		model.addAttribute("page", "about");
		return "index";
	}
	
	@RequestMapping(value = "faq")
	public String faq(Model model) {
		model.addAttribute("page", "faq");
		return "index";
	}
	
	@RequestMapping(value = "contact")
	public String contact(Model model) {
		model.addAttribute("page", "contact");
		return "index";
	}
	
	@RequestMapping(value = "product-detail/{id}")
	public String productDetail(@PathVariable("id") int id, Model model) {
		model.addAttribute("product", productImpl.getById(id));
		model.addAttribute("page", "product-detail");
		return "index";
	}
}
