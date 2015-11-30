package com.icoding.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.icoding.dao.GenericDao;
import com.icoding.dao.UserDao;
import com.icoding.domain.User;

@Service
@Transactional
public class UserServiceImpl extends GenericServiceImpl<User, Integer>
		implements UserService {

	@Autowired
	private UserDao userDao;

	@Override
	public User getUser(String username) {
		return userDao.getUser(username);
	}

	@Override
	public User getUser(String username, String password) {
		return userDao.getUser(username, password);
	}

	@Override
	GenericDao<User, Integer> getDao() {
		return userDao;
	}

	@Override
	public List<User> getListUserEE() {
		return userDao.getListUserEE();
	}

	@Override
	public List<User> getListUserPL() {
		return userDao.getListUserPL();
	}

	@Override
	public List<User> getEmployee() {
		return userDao.getEmployee();
	}

	@Override
	public List<User> getStudent() {
		return userDao.getStudent();
	}

	@Override
	public User loginStudent(String username, String password) {
		return userDao.loginStudent(username, password);
	}

	@Override
	public Boolean checkUsernameExist(String username) {
		return userDao.checkUsernameExist(username);
	}

	@Override
	public Boolean checkEmailExist(String email) {
		return userDao.checkEmailExist(email);
	}

}
