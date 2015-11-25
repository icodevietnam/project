package com.icoding.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.icoding.domain.Notification;
import com.icoding.domain.User;
import com.icoding.service.NotificationService;
import com.icoding.service.UserService;

@Controller
public class GenericController {

	@Autowired
	private NotificationService notificationService;

	@Autowired
	private UserService userService;

	public int countNotifications() {
		Authentication auth = SecurityContextHolder.getContext()
				.getAuthentication();
		String username = auth.getName();
		User user = userService.getUser(username);
		int count = 0;
		List<Notification> listNotifications = notificationService.getAll();
		if (user.getRole().getName().equalsIgnoreCase("admin")
				|| user.getRole().getName().equalsIgnoreCase("pvc")) {
			for (Notification notification : listNotifications) {
				if (notification.getIsPVCRead() == false) {
					count++;
				}
			}
		} else if (user.getRole().getName().equalsIgnoreCase("dlt")) {
			for (Notification notification : listNotifications) {
				if (notification.getIsDLTRead() == false) {
					count++;
				}
			}
		} else if (user.getRole().getName().equalsIgnoreCase("pl")) {
			for (Notification notification : listNotifications) {
				if (notification.getIsPLRead() == false) {
					count++;
				}
			}
		} else if (user.getRole().getName().equalsIgnoreCase("ee")) {
			for (Notification notification : listNotifications) {
				if (notification.getIsEERead() == false) {
					count++;
				}
			}
		}
		return count;
	}
}
