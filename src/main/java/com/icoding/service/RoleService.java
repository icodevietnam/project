package com.icoding.service;

import java.util.List;

import com.icoding.domain.Role;

public interface RoleService extends GenericService<Role, Integer> {
	List<Role> getAllNotStudent();
	Role getRoleStudent();
}
