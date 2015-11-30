package com.icoding.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.icoding.dao.GenericDao;
import com.icoding.dao.ProgramDao;
import com.icoding.domain.Program;

@Service
@Transactional
public class ProgramServiceImpl extends GenericServiceImpl<Program, Integer>
		implements ProgramService {

	@Autowired
	private ProgramDao programDao;

	@Override
	GenericDao<Program, Integer> getDao() {
		return programDao;
	}

	@Override
	public Program getProgram(String code) {
		return programDao.getProgram(code);
	}

	@Override
	public void deleteProgram(String code) {
		programDao.deleteProgram(code);
	}

	@Override
	public void updateProgram(String code) {
		programDao.updateProgram(code);
	}

}
