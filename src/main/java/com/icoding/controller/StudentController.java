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

import com.icoding.domain.User;
import com.icoding.service.RoleService;
import com.icoding.service.UserService;
import com.icoding.utils.SendMailSSL;

@Controller
public class StudentController extends GenericController {

	@Autowired
	private UserService userService;

	@Autowired
	private RoleService roleService;

	@Autowired
	private BCryptPasswordEncoder encoder;

	@RequestMapping(value = "/student/checkPasswordExist", method = RequestMethod.GET)
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

	@RequestMapping(value = "/student/resetPassword", method = RequestMethod.GET)
	@ResponseBody
	public String resetPassword(@RequestParam(value = "itemId") String itemId) {
		Integer id = Integer.parseInt(itemId);
		User student = userService.get(id);
		student.setPassword(encoder.encode("EE223344@5"));
		userService.saveOrUpdate(student);
		try {
			SendMailSSL.sendMailTLSResetPassword(student.getEmail());
			return "true";
		} catch (Exception e) {
			e.printStackTrace();
			;
			return "false";
		}
	}

	// Response user as json
	@RequestMapping(value = "/student/getAll", method = RequestMethod.GET, produces = "application/json")
	@ResponseBody
	public List<User> getAll(Model model) {
		List<User> listUsers = new ArrayList<User>();
		listUsers = userService.getStudent();
		return listUsers;
	}

	@RequestMapping(value = { "/admin/student", "/admin/student/list" }, method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	@Secured({"ROLE_ADMIN","ROLE_PVC","ROLE_DLT","ROLE_PL","ROLE_EE"})
	public String displayPage(Model model) {
		model.addAttribute("pageName", "Manage Student");
		model.addAttribute("title", "Manage Student");
		model.addAttribute("countNav", countNotifications());
		return "student/index";
	}

	@RequestMapping(value = "/student/delete", method = RequestMethod.POST)
	@ResponseBody
	public String deleteStudent(@RequestParam(value = "itemId") String itemId) {
		Integer id = Integer.parseInt(itemId);
		User student = userService.get(id);
		if (!itemId.equalsIgnoreCase("1")) {
			student.setRole(null);
			userService.remove(student);
			return "true";
		}
		return "false";
	}

	@RequestMapping(value = "/student/get", method = RequestMethod.GET)
	@ResponseBody
	public User getStudent(@RequestParam(value = "itemId") String idemId) {
		User user = userService.get(Integer.parseInt(idemId));
		return user;
	}

	@RequestMapping(value = "/student/changePassword", method = RequestMethod.POST)
	@ResponseBody
	public String changePassword(@RequestParam(value = "userId") String userId,

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

	@RequestMapping(value = "/student/update", method = RequestMethod.POST)
	@ResponseBody
	public String updateStudent(@RequestParam(value = "userId") String userId,
			@RequestParam(value = "fullname") String fullname,
			@RequestParam(value = "birthDate") String birthDate,
			@RequestParam(value = "address") String address,
			@RequestParam(value = "phone") String phone,
			@RequestParam(value = "email") String email,
			@RequestParam(value = "state") String state,
			@RequestParam(value = "gender") String gender) {
		User user = userService.get(Integer.parseInt(userId));
		user.setFullName(fullname);
		user.setBirthDate(birthDate);
		user.setAddress(address);
		user.setEmail(email);
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

	@RequestMapping(value = "/student/new", method = RequestMethod.POST)
	@ResponseBody
	public String addStudent(@RequestParam(value = "password") String password,
			@RequestParam(value = "userName") String userName,
			@RequestParam(value = "fullname") String fullname,
			@RequestParam(value = "birthDate") String birthDate,
			@RequestParam(value = "email") String email,
			@RequestParam(value = "address") String address,
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
		user.setRole(roleService.getRoleStudent());
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

}
