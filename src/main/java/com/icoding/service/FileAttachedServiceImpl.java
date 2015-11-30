package com.icoding.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.icoding.dao.FileAttachedDao;
import com.icoding.dao.GenericDao;
import com.icoding.domain.FileAttached;

@Service
@Transactional
public class FileAttachedServiceImpl extends
		GenericServiceImpl<FileAttached, Integer> implements
		FileAttachedService {

	private FileAttachedDao fileAttachedDao;

	@Override
	GenericDao<FileAttached, Integer> getDao() {
		return fileAttachedDao;
	}

}
