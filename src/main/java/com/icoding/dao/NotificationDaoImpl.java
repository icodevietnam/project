package com.icoding.dao;

import org.springframework.stereotype.Repository;

import com.icoding.domain.Notification;

@Repository
public class NotificationDaoImpl extends GenericDaoImpl<Notification, Integer> implements
		NotificationDao {

}
