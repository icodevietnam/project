package com.icoding.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.joda.time.DateTime;
import org.joda.time.Days;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.icoding.domain.Notification;
import com.icoding.domain.Report;
import com.icoding.service.NotificationService;
import com.icoding.service.ReportService;
import com.icoding.service.UserService;

@Controller
public class ReportController extends GenericController {

	private static final Logger logger = LoggerFactory.getLogger(ReportController.class);

	@Autowired
	private ReportService reportService;

	@Autowired
	private UserService userService;

	@Autowired
	private NotificationService notificationService;

	@RequestMapping(value = { "/admin/report",
			"/admin/report/list" }, method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	@Secured({ "ROLE_ADMIN", "ROLE_PVC", "ROLE_DLT", "ROLE_EE", "ROLE_PL" })
	public String displayPage(Model model) {
		int countReport = checkOverdue();
		model.addAttribute("pageName", "Manage Report");
		model.addAttribute("title", "Manage Report");
		model.addAttribute("countOverdue", "<br/>We have " + countReport + " reports overdued...");
		model.addAttribute("countNav", countNotifications());
		return "report/index";
	}

	@RequestMapping(value = "/report/getAll", method = RequestMethod.GET, produces = "application/json")
	@ResponseBody
	public List<Report> getAll(Model model, Principal principal) {
		/*
		 * String username = principal.getName(); User user =
		 * userService.getUser(username); List<Report> listReports =
		 * reportService.getAll();
		 */
		List<Report> filterReports = new ArrayList<Report>();
		/*
		 * if (user.getRole().getName().equalsIgnoreCase("admin") ||
		 * user.getRole().getName().equalsIgnoreCase("pvc") ||
		 * user.getRole().getName().equalsIgnoreCase("dlt")) { filterReports =
		 * listReports; } else if
		 * (user.getRole().getName().equalsIgnoreCase("ee")) { for (Report
		 * report : listReports) { if (report.getProgram().getEe().getUsername()
		 * .equalsIgnoreCase(username)) { filterReports.add(report); } } } else
		 * if (user.getRole().getName().equalsIgnoreCase("pl")) { } for (Report
		 * report : listReports) { for (Faculty faculty : listFaculties) { if
		 * (report.getProgram().getFaculty().getId() == faculty .getId()) {
		 * filterReports.add(report); } } } }
		 */
		return filterReports;
	}

	@RequestMapping(value = "/report/setApprove", method = RequestMethod.POST)
	@ResponseBody
	public String updaterole(@RequestParam(value = "reportId") String reportId) {
		Report report = reportService.get(Integer.parseInt(reportId));
		report.setIsApproved(true);
		try {
			reportService.saveOrUpdate(report);
			return "true";
		} catch (Exception e) {
			return "false";
		}
	}

	// Check and change overdue status
	private int checkOverdue() {
		List<Report> listReports = reportService.getAll();
		int countReportOverdue = 0;
		for (Report report : listReports) {
			int days = Days.daysBetween(new DateTime(report.getCreateDate()), new DateTime(new Date())).getDays();
			if (days >= 14 && !report.getIsApproved()) {
				report.setIsOverdue(true);
				countReportOverdue++;
				Notification notification = new Notification();
				notification.setName("New Report Overdue: " + report.getStudent().getFullName() + " join program "
						+ report.getProgram().getName());
				notification
						.setContent("Overdue Report: \n" + " Url: http://localhost/project/report/" + report.getId());
				notification.setIsEERead(false);
				notification.setIsDLTRead(false);
				notification.setIsPLRead(false);
				notification.setIsPVCRead(false);
				notificationService.add(notification);
			}
			reportService.saveOrUpdate(report);
		}

		return countReportOverdue;
	}

}
