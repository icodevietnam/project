package com.icoding.dao;

import com.icoding.domain.Program;

public interface ProgramDao extends GenericDao<Program, Integer> {
	Program getProgram(String code);

	void deleteProgram(String code);

	void updateProgram(String code);

}
