package com.icoding.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.icoding.domain.Program;
import com.icoding.domain.User;

@Repository
public class ProgramDaoImpl extends GenericDaoImpl<Program, Integer> implements
		ProgramDao {

	@Override
	public Program getProgram(String code) {
		List<Program> listPrograms = new ArrayList<Program>();
		Query query = currentSession().createQuery(
				"from Program u where u.code = :code");
		query.setParameter("code", code);
		listPrograms = query.list();
		if (listPrograms.size() > 0)
			return listPrograms.get(0);
		else
			return null;
	}

	@Override
	public void deleteProgram(String code) {
		Program program = getProgram(code);
		remove(program);
	}

	@Override
	public void updateProgram(String code) {
		Program program = getProgram(code);
		update(program);
	}

}
