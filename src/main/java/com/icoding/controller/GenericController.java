package com.icoding.controller;

import org.springframework.stereotype.Controller;

@Controller
public class GenericController {

	/*
	 * @Autowired private NotificationService notificationService;
	 * 
	 * @Autowired private UserService userService;
	 */

	public int countNotifications() {
		/*
		 * Authentication auth =
		 * SecurityContextHolder.getContext().getAuthentication(); String
		 * username = auth.getName(); User user = userService.getUser(username);
		 */
		int count = 0;
		/*
		 * List<Notification> listNotifications = notificationService.getAll();
		 * if (user.getRole().getName().equalsIgnoreCase("admin") ||
		 * user.getRole().getName().equalsIgnoreCase("pvc")) { for (Notification
		 * notification : listNotifications) { if (notification.getIsPVCRead()
		 * == false) { count++; } } } else if
		 * (user.getRole().getName().equalsIgnoreCase("dlt")) { for
		 * (Notification notification : listNotifications) { if
		 * (notification.getIsDLTRead() == false) { count++; } } } else if
		 * (user.getRole().getName().equalsIgnoreCase("pl")) { for (Notification
		 * notification : listNotifications) { if (notification.getIsPLRead() ==
		 * false) { count++; } } } else if
		 * (user.getRole().getName().equalsIgnoreCase("ee")) { for (Notification
		 * notification : listNotifications) { if (notification.getIsEERead() ==
		 * false) { count++; } } }
		 */
		return count;
	}
	
	
}
