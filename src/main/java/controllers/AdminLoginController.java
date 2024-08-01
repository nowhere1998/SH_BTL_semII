package controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import dao.UsersImpl;
import entities.Users;
import util.Cipher;

@Controller
public class AdminLoginController {
	@Autowired
	UsersImpl usersImpl;
	
	@RequestMapping(value = "admin-login", method = RequestMethod.GET)
	public String login(Model model) {
		return "admin/login";
	}
	
	@RequestMapping(value = "admin-login", method = RequestMethod.POST)
	public String login(String name, String password, Model model, HttpServletRequest req) {
		if (name.isEmpty()) {
			model.addAttribute("msg", "Information is not correct!");
			model.addAttribute("name", name);
			model.addAttribute("password", password);
			return "admin/login";
		}
		Users account = usersImpl.getByNameOrEmail(name);
		String passMD5 = Cipher.GenerateMD5(password);
		if (account.getPassword()==null) {
			model.addAttribute("msg", "Information is not correct!");
			model.addAttribute("name", name);
			model.addAttribute("password", password);
			return "admin/login";
		}
		if (!account.getPassword().equals(passMD5) || account.getRole()!=1) {
			model.addAttribute("msg", "Information is not correct!");
			model.addAttribute("name", name);
			model.addAttribute("password", password);
			return "admin/login";
		}
		HttpSession session = req.getSession();
		session.setMaxInactiveInterval(3600);
		session.setAttribute("id", account.getId());
		session.setAttribute("picture", account.getImg());
		session.setAttribute("name", account.getName());
		return "redirect:/admin";
	}
	
	@RequestMapping(value = "admin/exit")
	public String logout(Model model, HttpServletRequest req) {
		HttpSession session = req.getSession();
		session.invalidate();
		return "redirect:/admin-login";
	}
}
