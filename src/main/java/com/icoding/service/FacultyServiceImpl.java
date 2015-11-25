package com.icoding.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.icoding.dao.FacultyDao;
import com.icoding.dao.GenericDao;
import com.icoding.domain.Faculty;

@Service
@Transactional
public class FacultyServiceImpl extends GenericServiceImpl<Faculty, Integer>
		implements FacultyService {

	@Autowired
	private FacultyDao facultyDao;

	@Override
	GenericDao<Faculty, Integer> getDao() {
		return facultyDao;
	}

}
