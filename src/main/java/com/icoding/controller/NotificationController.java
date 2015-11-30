package com.icoding.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.icoding.domain.Notification;
import com.icoding.domain.User;
import com.icoding.service.NotificationService;
import com.icoding.service.UserService;

@Controller
public class NotificationController extends GenericController {

	@Autowired
	private NotificationService notificationService;

	@Autowired
	private UserService userService;

	@RequestMapping(value = { "/admin/notification", "/admin/viewNoti" }, method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	@Secured({ "ROLE_ADMIN"})
	public String displayNotificationPage(Model model) {
		model.addAttribute("pageName", "Manage Notification");
		model.addAttribute("title", "Manage Notification");
		model.addAttribute("countNav", countNotifications());
		return "notification/index";
	}

	@RequestMapping(value = "/notification/getAll", method = RequestMethod.GET, produces = "application/json")
	@ResponseBody
	public List<Notification> getAll(Model model, Principal principal) {
		String username = principal.getName();
		User user = userService.getUser(username);
		List<Notification> listNotifications = notificationService.getAll();
		List<Notification> unReadNotifications = new ArrayList<Notification>();
		if (user.getRole().getName().equalsIgnoreCase("admin")
				|| user.getRole().getName().equalsIgnoreCase("pvc")) {
			for (Notification notification : listNotifications) {
				if (notification.getIsPVCRead() == false) {
					unReadNotifications.add(notification);
					notification.setIsPVCRead(true);
					notificationService.saveOrUpdate(notification);
				}
			}
		} else if (user.getRole().getName().equalsIgnoreCase("dlt")) {
			for (Notification notification : listNotifications) {
				if (notification.getIsDLTRead() == false) {
					unReadNotifications.add(notification);
					notification.setIsDLTRead(true);
					notificationService.saveOrUpdate(notification);
				}
			}
		} else if (user.getRole().getName().equalsIgnoreCase("pl")) {
			for (Notification notification : listNotifications) {
				if (notification.getIsPLRead() == false) {
					unReadNotifications.add(notification);
					notification.setIsPLRead(true);
					notificationService.saveOrUpdate(notification);
				}
			}
		} else if (user.getRole().getName().equalsIgnoreCase("ee")) {
			for (Notification notification : listNotifications) {
				if (notification.getIsEERead() == false) {
					unReadNotifications.add(notification);
					notification.setIsEERead(true);
					notificationService.saveOrUpdate(notification);
				}
			}
		}
		return unReadNotifications;
	}
}
