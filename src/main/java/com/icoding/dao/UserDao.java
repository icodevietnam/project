package com.icoding.dao;

import java.util.List;

import com.icoding.domain.User;

public interface UserDao extends GenericDao<User, Integer> {
	User getUser(String username);

	User getUser(String username, String password);

	List<User> getListUserEE();

	List<User> getListUserPL();

	List<User> getEmployee();

	List<User> getStudent();
	
	User loginStudent(String username,String password);
	
	Boolean checkUsernameExist(String username);
	
	Boolean checkEmailExist(String email);
}
