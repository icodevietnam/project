package com.icoding.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.icoding.domain.Role;

@Repository
public class RoleDaoImpl extends GenericDaoImpl<Role, Integer>implements RoleDao {

	@Override
	public List<Role> getAllNotUser() {
		List<Role> listRoles = getAll();
		List<Role> roleList = new ArrayList<Role>();
		for (Role r : listRoles) {
			if (!r.getName().equalsIgnoreCase("user")) {
				roleList.add(r);
			}
		}
		return roleList;
	}

	@Override
	public Role getRoleUser() {
		List<Role> roleList = new ArrayList<Role>();
		Query query = currentSession().createQuery("from Role u where u.name = :name");
		query.setParameter("name", "user");
		roleList = query.list();
		if (roleList.size() > 0)
			return roleList.get(0);
		else
			return null;
	}

}
