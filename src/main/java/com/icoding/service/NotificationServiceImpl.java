package com.icoding.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.icoding.dao.NotificationDao;
import com.icoding.dao.GenericDao;
import com.icoding.domain.Notification;

@Service
@Transactional
public class NotificationServiceImpl extends GenericServiceImpl<Notification, Integer>
		implements NotificationService {

	@Autowired
	private NotificationDao notificationDao;

	@Override
	GenericDao<Notification, Integer> getDao() {
		return notificationDao;
	}

}
