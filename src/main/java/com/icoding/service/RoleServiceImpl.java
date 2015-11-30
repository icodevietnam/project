package com.icoding.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.icoding.dao.GenericDao;
import com.icoding.dao.RoleDao;
import com.icoding.domain.Role;

@Service
@Transactional
public class RoleServiceImpl extends GenericServiceImpl<Role, Integer>
		implements RoleService {

	@Autowired
	private RoleDao roleDao;

	@Override
	GenericDao<Role, Integer> getDao() {
		return roleDao;
	}

	@Override
	public List<Role> getAllNotStudent() {
		return roleDao.getAllNotStudent();
	}

	@Override
	public Role getRoleStudent() {
		return roleDao.getRoleStudent();
	}

}
