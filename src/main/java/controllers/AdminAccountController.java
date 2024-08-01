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

import dao.OrderImpl;
import dao.UsersImpl;
import entities.Users;
import entities.UsersPage;
import util.Cipher;

@Controller
@RequestMapping(value = "admin")
public class AdminAccountController {
	@Autowired
	UsersImpl usersImpl;
	@Autowired
	OrderImpl orderImpl;
	
	@RequestMapping(value = "account")
	public String account(String search, Integer currentPage, String success, String error, Model model) {
		currentPage = currentPage==null?1:currentPage;
		int pageSize = 3;
		UsersPage usersPage = usersImpl.paging(currentPage, pageSize);
		
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("success", success);
		System.out.println(search);
		if (search!=null) {
			System.out.println(1);
			model.addAttribute("account", usersImpl.search(search));
			model.addAttribute("totalPage", 1);
		} else {
			model.addAttribute("account", usersPage.getList());
			model.addAttribute("totalPage", usersPage.getTotalPage());
		}
		model.addAttribute("page", "account");
		return "admin/index";
	}
	
	@RequestMapping(value = "account/add", method = RequestMethod.GET)
	public String accountAdd(Model model) {
		Users account = new Users();
		model.addAttribute("account", account);
		model.addAttribute("page", "account-add");
		return "admin/index";
	}
	
	@RequestMapping(value = "account/add", method = RequestMethod.POST)
	public String accountAdd(String confirmPassword, @Valid @ModelAttribute("users") Users account, BindingResult result, @RequestParam("file") MultipartFile file, Model model, HttpServletRequest req) {
		Users checkName = usersImpl.getByNameOrEmail(account.getName());
		Users checkEmail = usersImpl.getByNameOrEmail(account.getEmail());
		if (checkName.getName()!=null) {
			model.addAttribute("errorUniqueName", "Name is already exist!");
			model.addAttribute("confirmPassword", confirmPassword);
			model.addAttribute("account", account);
			model.addAttribute("page", "account-add");
			return "admin/index";
		}
		if (checkEmail.getEmail()!=null) {
			model.addAttribute("errorUniqueEmail", "Email is already exist!");
			model.addAttribute("confirmPassword", confirmPassword);
			model.addAttribute("account", account);
			model.addAttribute("page", "account-add");
			return "admin/index";
		}
		if (!account.getPassword().equals(confirmPassword)) {
			model.addAttribute("errorConfirmPassword", "Password is not correct!");
			model.addAttribute("confirmPassword", confirmPassword);
			model.addAttribute("account", account);
			model.addAttribute("page", "account-add");
			return "admin/index";
		}
		if (result.hasErrors()) {
			model.addAttribute("confirmPassword", confirmPassword);
			model.addAttribute("account", account);
			model.addAttribute("page", "account-add");
			return "admin/index";
		}
		if (file.getOriginalFilename()!=null) {
			String uploadRootPath = req.getServletContext().getRealPath("resources/images");
			File destination = new File(uploadRootPath+"/"+file.getOriginalFilename());
			try {
				file.transferTo(destination);
			} catch (IllegalStateException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			account.setImg("resources/images/"+file.getOriginalFilename());
		}
		account.setPassword(Cipher.GenerateMD5(confirmPassword));
		usersImpl.add(account);
		model.addAttribute("success", "Add new account success!");
		return "redirect:/admin/account";
	}
	
	@RequestMapping(value = "account/edit/{id}", method = RequestMethod.GET)
	public String accountEdit(@PathVariable("id") int id, Model model) {
		Users account = usersImpl.getById(id);
		model.addAttribute("account", account);
		model.addAttribute("page", "account-edit");
		return "admin/index";
	}
	
	@RequestMapping(value = "account/edit", method = RequestMethod.POST)
	public String accountEdit(@Valid @ModelAttribute("account") Users account, BindingResult result, String confirmPassword, @RequestParam("file") MultipartFile file, Model model, HttpServletRequest req) {
		Users checkName = usersImpl.getByNameOrEmail(account.getName());
		Users checkEmail = usersImpl.getByNameOrEmail(account.getEmail());
		if (checkName.getName()!=null && checkName.getId()!=account.getId()) {
			System.out.println(checkName.getId());
			System.out.println(account.getId());
			model.addAttribute("errorUniqueName", "Name is already exist!");
			model.addAttribute("confirmPassword", confirmPassword);
			model.addAttribute("account", account);
			model.addAttribute("page", "account-edit");
			return "admin/index";
		}
		if (checkEmail.getEmail()!=null && checkName.getId()!=account.getId()) {
			model.addAttribute("errorUniqueEmail", "Email is already exist!");
			model.addAttribute("confirmPassword", confirmPassword);
			model.addAttribute("account", account);
			model.addAttribute("page", "account-edit");
			return "admin/index";
		}
		if (!account.getPassword().equals(confirmPassword)) {
			model.addAttribute("errorConfirmPassword", "Password is not correct!");
			model.addAttribute("confirmPassword", confirmPassword);
			model.addAttribute("account", account);
			model.addAttribute("page", "account-edit");
			return "admin/index";
		}
		if (result.hasErrors()) {
			model.addAttribute("confirmPassword", confirmPassword);
			model.addAttribute("account", account);
			model.addAttribute("page", "account-edit");
			return "admin/index";
		}
		if (file.getOriginalFilename()!=null) {
			String uploadRootPath = req.getServletContext().getRealPath("resources/images");
			File destination = new File(uploadRootPath+"/"+file.getOriginalFilename());
			try {
				file.transferTo(destination);
			} catch (IllegalStateException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			account.setImg("resources/images/"+file.getOriginalFilename());
		}
		account.setPassword(Cipher.GenerateMD5(confirmPassword));
		usersImpl.update(account);
		model.addAttribute("success", "Update account success!");
		return "redirect:/admin/account";
	}
	
	@RequestMapping(value = "account/delete/{id}", method = RequestMethod.GET)
	public String productDelete(@PathVariable("id") int id, Model model) {
		if (orderImpl.getById(id).getAccountId()!=0) {
			model.addAttribute("error", "Can not delete because has order related!");
			return "redirect:/admin/account";
		}
		usersImpl.delete(id);
		model.addAttribute("success", "Delete account success!");
		return "redirect:/admin/account";
	}
}
