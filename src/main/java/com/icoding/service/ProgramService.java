package com.icoding.service;

import com.icoding.domain.Program;

public interface ProgramService extends GenericService<Program, Integer> {
	
	Program getProgram(String code);
	void deleteProgram(String code);
	void updateProgram(String code);

}
