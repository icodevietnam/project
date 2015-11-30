package com.icoding.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.icoding.domain.Role;
import com.icoding.domain.User;
import com.icoding.service.RoleService;
import com.icoding.service.UserService;

@Controller
public class UserController extends GenericController {

	@Autowired
	private UserService userService;

	@Autowired
	private RoleService roleService;

	@Autowired
	private BCryptPasswordEncoder encoder;

	@RequestMapping(value = "/user/checkPasswordExist", method = RequestMethod.GET)
	@ResponseBody
	public String checkPasswordExist(
			@RequestParam(value = "oldpassword") String oldPassword) {
		Authentication auth = SecurityContextHolder.getContext()
				.getAuthentication();
		UserDetails userDetails = (UserDetails) auth.getPrincipal();
		User currentUser = userService.getUser(userDetails.getUsername());
		if (encoder.matches(oldPassword, currentUser.getPassword()))
			return "false";
		else
			return "true";
	}

	// Response user as json
	@RequestMapping(value = "/user/getAll", method = RequestMethod.GET, produces = "application/json")
	@ResponseBody
	public List<User> getAll(Model model) {
		List<User> listUsers = new ArrayList<User>();
		listUsers = userService.getEmployee();
		return listUsers;
	}

	@RequestMapping(value = { "/admin/user", "/admin/user/list" }, method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	@Secured({ "ROLE_ADMIN", "ROLE_PVC"})
	public String displayPage(Model model) {
		List<Role> listRoles = new ArrayList<Role>();
		listRoles = roleService.getAllNotStudent();
		model.addAttribute("pageName", "Manage User");
		model.addAttribute("title", "Manage User");
		model.addAttribute("listRoles", listRoles);
		model.addAttribute("countNav", countNotifications());
		return "user/index";
	}

	@RequestMapping(value = "/user/delete", method = RequestMethod.POST)
	@ResponseBody
	public String deleteUser(@RequestParam(value = "itemId") String itemId) {
		Integer id = Integer.parseInt(itemId);
		User user = userService.get(id);
		if (!itemId.equalsIgnoreCase("1")) {
			user.setRole(null);
			userService.remove(user);
			return "true";
		}
		return "false";
	}

	@RequestMapping(value = "/user/get", method = RequestMethod.GET)
	@ResponseBody
	public User getUser(@RequestParam(value = "itemId") String idemId) {
		User user = userService.get(Integer.parseInt(idemId));
		return user;
	}

	@RequestMapping(value = "/user/changePassword", method = RequestMethod.POST)
	@ResponseBody
	public String updateUser(@RequestParam(value = "userId") String userId,
			@RequestParam(value = "password") String password) {
		User user = userService.get(Integer.parseInt(userId));
		user.setPassword(encoder.encode(password));
		try {
			userService.update(user);
			return "true";
		} catch (Exception e) {
			return "false";
		}
	}

	@RequestMapping(value = "/user/update", method = RequestMethod.POST)
	@ResponseBody
	public String updateUser(@RequestParam(value = "userId") String userId,
			@RequestParam(value = "fullname") String fullname,
			@RequestParam(value = "birthDate") String birthDate,
			@RequestParam(value = "address") String address,
			@RequestParam(value = "roleId") String roleId,
			@RequestParam(value = "phone") String phone,
			@RequestParam(value = "email") String email,
			@RequestParam(value = "state") String state,
			@RequestParam(value = "gender") String gender) {
		User user = userService.get(Integer.parseInt(userId));
		user.setFullName(fullname);
		user.setBirthDate(birthDate);
		user.setAddress(address);
		user.setEmail(email);
		user.setRole(roleService.get(Integer.parseInt(roleId)));
		user.setState(state);
		if (gender.equalsIgnoreCase("true")) {
			user.setGender(true);
		}
		user.setGender(false);
		user.setPhone(phone);
		try {
			userService.update(user);
			return "true";
		} catch (Exception e) {
			return "false";
		}
	}

	@RequestMapping(value = "/user/new", method = RequestMethod.POST)
	@ResponseBody
	public String addUser(@RequestParam(value = "password") String password,
			@RequestParam(value = "userName") String userName,
			@RequestParam(value = "fullname") String fullname,
			@RequestParam(value = "birthDate") String birthDate,
			@RequestParam(value = "email") String email,
			@RequestParam(value = "address") String address,
			@RequestParam(value = "roleId") String roleId,
			@RequestParam(value = "phone") String phone,
			@RequestParam(value = "state") String state,
			@RequestParam(value = "gender") String gender) {

		User user = new User();
		user.setUsername(userName);
		user.setPassword(encoder.encode(password));
		user.setFullName(fullname);
		user.setBirthDate(birthDate);
		user.setAddress(address);
		user.setEmail(email);
		user.setRole(roleService.get(Integer.parseInt(roleId)));
		user.setState(state);
		if (gender.equalsIgnoreCase("true")) {
			user.setGender(true);
		}
		user.setGender(false);
		user.setPhone(phone);
		try {
			userService.saveOrUpdate(user);
			return "true";
		} catch (Exception e) {
			return "false";
		}
	}

	@RequestMapping(value = "/user/checkUsername", method = RequestMethod.POST)
	@ResponseBody
	public String checkUsername(
			@RequestParam(value = "username") String username) {
		if (userService.checkUsernameExist(username)) {
			return "false";
		}
		return "true";
	}

	@RequestMapping(value = "/user/checkEmail", method = RequestMethod.POST)
	@ResponseBody
	public String checkEmail(@RequestParam(value = "email") String email) {
		if (userService.checkEmailExist(email)) {
			return "false";
		}
		return "true";
	}

}
