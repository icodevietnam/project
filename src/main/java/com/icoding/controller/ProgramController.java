package com.icoding.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.icoding.domain.Program;
import com.icoding.domain.User;
import com.icoding.service.ProgramService;
import com.icoding.service.UserService;

@Controller
public class ProgramController extends GenericController {

	@Autowired
	private ProgramService programService;

	@Autowired
	private UserService userService;

	@RequestMapping(value = { "/admin/program",
			"/admin/program/list" }, method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	@Secured({ "ROLE_ADMIN", "ROLE_PVC", "ROLE_DLT", "ROLE_PL" })
	public String displayPage(Model model) {
		List<User> listUserEE = userService.getListUserEE();
		List<User> listUserPL = userService.getListUserPL();
		model.addAttribute("listUsersEE", listUserEE);
		model.addAttribute("listUsersPL", listUserPL);
		model.addAttribute("listYear", listYearNow());
		model.addAttribute("pageName", "Manage Program");
		model.addAttribute("title", "Manage Program");
		model.addAttribute("countNav", countNotifications());
		return "program/index";
	}

	@RequestMapping(value = "/program/new", method = RequestMethod.POST)
	@ResponseBody
	public String addrole(@RequestParam(value = "name") String programName,
			@RequestParam(value = "description") String programDescription, @RequestParam(value = "plBox") String plId,
			@RequestParam(value = "eeBox") String eeId, @RequestParam(value = "grade") String typeOfGrade,
			@RequestParam(value = "facultyBox") String facultyId,
			@RequestParam(value = "conductBox") String typeOfConduct,
			@RequestParam(value = "yearBox") String academicYear) {
		Program program = new Program();
		program.setName(programName);
		program.setDescription(programDescription);
		if (plId.equalsIgnoreCase("none")) {
			program.setPl(null);
		} else {
			User pl = userService.get(Integer.parseInt(plId));
			program.setPl(pl);
		}
		if (eeId.equalsIgnoreCase("none")) {
			program.setEe(null);
		} else {
			User ee = userService.get(Integer.parseInt(eeId));
			program.setEe(ee);
		}
		program.setTypeOfGrade(typeOfGrade);
		program.setAcademicYear(academicYear);
		program.setTypeOfConduct(typeOfConduct);
		try {
			programService.saveOrUpdate(program);
			return "true";
		} catch (Exception e) {
			e.printStackTrace();
			return "false";
		}
	}

	@RequestMapping(value = "/program/getAll", method = RequestMethod.GET, produces = "application/json")
	@ResponseBody
	public List<Program> getAll(Model model) {
		List<Program> listPrograms = new ArrayList<Program>();
		listPrograms = programService.getAll();
		return listPrograms;
	}

	@RequestMapping(value = "/program/get", method = RequestMethod.GET)
	@ResponseBody
	public Program getProgram(@RequestParam(value = "itemId") String itemId) {
		Program program = programService.getProgram(itemId);
		return program;
	}

	@RequestMapping(value = "/program/delete", method = RequestMethod.POST)
	@ResponseBody
	public String deleteProgram(@RequestParam(value = "itemId") String itemId) {
		// Integer id = Integer.parseInt(itemId);
		/*
		 * Program program = programService.get(id); if (program!=null) {
		 * programService.remove(faculty); return "true"; } return "false";
		 */
		programService.deleteProgram(itemId);
		return "true";
	}

	@RequestMapping(value = "/program/update", method = RequestMethod.POST)
	@ResponseBody
	public String updaterole(@RequestParam(value = "itemId") String itemId,
			@RequestParam(value = "name") String programName,
			@RequestParam(value = "description") String programDescription, @RequestParam(value = "plBox") String plId,
			@RequestParam(value = "eeBox") String eeId, @RequestParam(value = "grade") String typeOfGrade,
			@RequestParam(value = "facultyBox") String facultyId,
			@RequestParam(value = "conductBox") String typeOfConduct,
			@RequestParam(value = "yearBox") String academicYear) {
		Program program = programService.getProgram(itemId);
		program.setName(programName);
		program.setDescription(programDescription);
		if (plId.equalsIgnoreCase("none")) {
			program.setPl(null);
		} else {
			User pl = userService.get(Integer.parseInt(plId));
			program.setPl(pl);
		}
		if (eeId.equalsIgnoreCase("none")) {
			program.setEe(null);
		} else {
			User ee = userService.get(Integer.parseInt(eeId));
			program.setEe(ee);
		}
		program.setTypeOfGrade(typeOfGrade);
		program.setAcademicYear(academicYear);
		program.setTypeOfConduct(typeOfConduct);
		try {
			programService.saveOrUpdate(program);
			return "true";
		} catch (Exception e) {
			return "false";
		}
	}

	private List<String> listYearNow() {
		List<String> listYear = new ArrayList<String>();
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
		String year = sdf.format(date);
		listYear.add(year);
		listYear.add((Integer.parseInt(year) + 1) + "");
		return listYear;
	}
}
