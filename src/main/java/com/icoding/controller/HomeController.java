package com.icoding.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.icoding.domain.Certificated;
import com.icoding.domain.Faculty;
import com.icoding.domain.Notification;
import com.icoding.domain.Program;
import com.icoding.domain.Report;
import com.icoding.domain.User;
import com.icoding.service.CertificateService;
import com.icoding.service.FacultyService;
import com.icoding.service.NotificationService;
import com.icoding.service.ProgramService;
import com.icoding.service.ReportService;
import com.icoding.service.UserService;

/**
 * Handles requests for the application home page.
 */
@Controller
@SessionAttributes("student")
public class HomeController extends GenericController {

	private static final Logger logger = LoggerFactory
			.getLogger(HomeController.class);

	@Autowired
	private FacultyService facultyService;

	@Autowired
	private CertificateService certificateService;

	@Autowired
	private ProgramService programService;

	@Autowired
	private BCryptPasswordEncoder encoder;

	@Autowired
	private UserService userService;

	@Autowired
	private ReportService reportService;

	@Autowired
	private NotificationService notificationService;

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = { "/admin/home", "/admin" }, method = RequestMethod.GET)
	public String adminHome(Locale locale, Model model) {
		logger.warn("Test xem co vao khong ?");
		model.addAttribute("pageName", "Quản trị người dùng");
		model.addAttribute("countNav", countNotifications());
		// model.addAttribute("listAcademicYear",
		// reportService.listReportsYear());
		model.addAttribute("allTaskCount", reportService.getAll().size());
		model.addAttribute("completedReportCount", getCompletedReport().size());
		model.addAttribute("programNoEENoPL", listProgramError().size());
		model.addAttribute("message","");
		return "home";
	}

	private List<Program> listProgramError() {
		List<Program> listPrograms = programService.getAll();
		List<Program> listProgramError = new ArrayList<Program>();
		for (Program p : listPrograms) {
			if (p.getEe() == null || p.getPl() == null) {
				listProgramError.add(p);
			}
		}
		return listProgramError;
	}

	private List<Report> getCompletedReport() {
		List<Report> listReports = reportService.getAll();
		List<Report> listCompletedReports = new ArrayList<Report>();
		for (Report r : listReports) {
			if (r.getIsApproved() == true) {
				listCompletedReports.add(r);
			}
		}
		return listCompletedReports;
	}

	@RequestMapping(value = { "/home", "/member", "/" }, method = RequestMethod.GET)
	public String displayHome(Locale locale, Model model) {
		List<Faculty> listFaculties = listFaculties();
		model.addAttribute("title", "Home");
		model.addAttribute("listFaculties", listFaculties);
		return "home/index";
	}

	@RequestMapping(value = { "/register" }, method = RequestMethod.GET)
	public String displayRegisterPage(Locale locale, Model model) {
		List<Faculty> listFaculties = listFaculties();
		model.addAttribute("title", "Register");
		model.addAttribute("listFaculties", listFaculties);
		return "home/register";
	}

	@RequestMapping(value = { "/member/login" }, method = RequestMethod.POST)
	public String loginStudent(ModelMap model, HttpServletRequest request,
			@RequestParam(value = "username") String username,
			@RequestParam(value = "password") String password) {
		User student = userService.getUser(username);
		HttpSession session = request.getSession();
		if (student != null) {
			if (encoder.matches(password, student.getPassword())) {
				// session.setAttribute("student", student);
				if (student.getRole().getName().equalsIgnoreCase("student")) {
					session.setAttribute("message","");
					session.setAttribute("student", student);
				} else {
					session.setAttribute("student",null);
				}
			} else {
				session.setAttribute("student",null);
			}
		}
		else{
			session.setAttribute("message","Login Fail");
		}
		return "redirect:/home";
	}

	@RequestMapping(value = { "/member/logout" }, method = RequestMethod.GET)
	public String loginStudent(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		if (session != null) {
			User student = (User) session.getAttribute("student");
			if (student != null) {
				session.setAttribute("student", null);
			}
		}
		SecurityContextHolder.clearContext();
		return "redirect:/home";
	}

	@RequestMapping(value = { "/program/{facultyId}" }, method = RequestMethod.GET)
	public String facultyPage(Model model, HttpServletRequest request,
			@PathVariable String facultyId) {
		List<Faculty> listFaculties = listFaculties();
		model.addAttribute("title", "Program");
		model.addAttribute("listFaculties", listFaculties);
		List<Program> listAllPrograms = programService.getAll();
		List<Program> listByFaculty = new ArrayList<Program>();
		for (Program p : listAllPrograms) {
			if (p.getFaculty().getId() == Integer.parseInt(facultyId)) {
				listByFaculty.add(p);
			}
		}
		// Get Program from Session User:
		HttpSession session = request.getSession();
		double average = 0;
		if (session != null) {
			User student = (User) session.getAttribute("student");
			if (student != null) {
				Certificated score = student.getCertificated();
				if (score != null) {
					average = (score.getBiological() + score.getChemistry()
							+ score.getEnglish() + score.getMath()
							+ score.getPhysical() + score.getLiterity()) / 6;
				}
			}
		}
		model.addAttribute("average", average);
		model.addAttribute("listPrograms", listByFaculty);
		return "home/program";
	}

	@RequestMapping(value = { "/member/score" }, method = RequestMethod.GET)
	public String scorePage(Model model) {
		List<Faculty> listFaculties = listFaculties();
		model.addAttribute("title", "Score");
		model.addAttribute("listFaculties", listFaculties);
		return "home/score";
	}

	@RequestMapping(value = { "/score/new" }, method = RequestMethod.POST)
	public String insertScore(@RequestParam(value = "math") String math,
			@RequestParam(value = "literity") String literity,
			@RequestParam(value = "chemistry") String chemistry,
			@RequestParam(value = "physical") String physical,
			@RequestParam(value = "biological") String biological,
			@RequestParam(value = "english") String english,
			@RequestParam(value = "conduct") String conduct,
			HttpServletRequest request) {
		HttpSession session = request.getSession();
		User student = (User) session.getAttribute("student");
		Certificated score = new Certificated();
		score.setMath(Integer.parseInt(math));
		score.setBiological(Integer.parseInt(biological));
		score.setPhysical(Integer.parseInt(physical));
		score.setChemistry(Integer.parseInt(chemistry));
		score.setEnglish(Integer.parseInt(english));
		score.setLiterity(Integer.parseInt(literity));
		score.setConduct(conduct);
		score.setStudent(student);
		student.setCertificated(score);
		try {
			Thread.sleep(1000);
		} catch (Exception e) {
			e.printStackTrace();
		}
		userService.saveOrUpdate(student);
		session.setAttribute("student", student);
		return "home/score";
	}

	private List<Faculty> listFaculties() {
		return facultyService.getAll();
	}

	@RequestMapping(value = { "/report/joinProgram" }, method = RequestMethod.POST)
	@ResponseBody
	public String joinProgram(@RequestParam(value = "stuId") String stuId,
			@RequestParam(value = "code") String code) {
		Integer studentId = Integer.parseInt(stuId);
		User student = userService.get(studentId);
		Program program = programService.getProgram(code);
		if (student != null && program != null) {
			if (reportService.isReportExist(studentId, code)) {
				return "false";
			} else {
				Report report = new Report();
				report.setStudent(student);
				report.setProgram(program);
				report.setCreateDate(new Date());
				report.setIsApproved(false);
				report.setIsOverdue(false);
				reportService.add(report);

				Notification notification = new Notification();
				notification.setName("New Report Added: "
						+ student.getFullName() + " join program "
						+ program.getName());
				notification.setContent("New Report: \n"
						+ " Url: http://localhost/ewsd/report/"
						+ report.getId());
				notification.setIsEERead(false);
				notification.setIsDLTRead(false);
				notification.setIsPLRead(false);
				notification.setIsPVCRead(false);
				notificationService.add(notification);
				return "true";
			}
		} else {
			return "false";
		}
	}

	private int countReportEachYear() {
		return 0;
	}

}
