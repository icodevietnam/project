package com.icoding.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.icoding.domain.Faculty;
import com.icoding.service.FacultyService;

@Controller
public class FacultyController extends GenericController{

	@Autowired
	private FacultyService facultyService;

	@RequestMapping(value = { "/admin/faculty", "/admin/faculty/list" }, method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	@Secured({"ROLE_ADMIN"})
	public String displayPage(Model model) {
		model.addAttribute("pageName", "Manage Faculty");
		model.addAttribute("title", "Manage Faculty");
		model.addAttribute("countNav", countNotifications());
		return "faculty/index";
	}

	@RequestMapping(value = "/faculty/new", method = RequestMethod.POST)
	@ResponseBody
	public String addrole(
			@RequestParam(value = "name") String facultyName,
			@RequestParam(value = "description") String facultyDescription) {
		Faculty faculty = new Faculty();
		faculty.setName(facultyName);
		faculty.setDescription(facultyDescription);
		try {
			facultyService.saveOrUpdate(faculty);
			return "true";
		} catch (Exception e) {
			return "false";
		}
	}

	@RequestMapping(value = "/faculty/getAll", method = RequestMethod.GET, produces = "application/json")
	@ResponseBody
	public List<Faculty> getAll(Model model) {
		List<Faculty> listFacultys = new ArrayList<Faculty>();
		listFacultys = facultyService.getAll();
		return listFacultys;
	}

	@RequestMapping(value = "/faculty/delete", method = RequestMethod.POST)
	@ResponseBody
	public String deleteRole(@RequestParam(value = "itemId") String itemId) {
		Integer id = Integer.parseInt(itemId);
		Faculty faculty = facultyService.get(id);
		if (faculty.getListPrograms().size() == 0) {
			facultyService.remove(faculty);
			return "true";
		}
		return "false";
	}

	@RequestMapping(value = "/faculty/update", method = RequestMethod.POST)
	@ResponseBody
	public String updaterole(
			@RequestParam(value = "facultyId") String facultyId,
			@RequestParam(value = "name") String facultyName,
			@RequestParam(value = "description") String facultyDescription) {
		Faculty faculty = facultyService.get(Integer.parseInt(facultyId));
		faculty.setName(facultyName);
		faculty.setDescription(facultyDescription);
		try {
			facultyService.saveOrUpdate(faculty);
			return "true";
		} catch (Exception e) {
			return "false";
		}
	}

	@RequestMapping(value = "/faculty/get", method = RequestMethod.GET)
	@ResponseBody
	public Faculty getFaculty(@RequestParam(value = "itemId") String itemId) {
		Faculty faculty = facultyService.get(Integer.parseInt(itemId));
		return faculty;
	}
}
