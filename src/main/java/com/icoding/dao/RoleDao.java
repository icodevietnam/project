package com.icoding.dao;

import java.util.List;

import com.icoding.domain.Role;

public interface RoleDao extends GenericDao<Role, Integer> {
	List<Role> getAllNotUser();

	Role getRoleUser();
}
