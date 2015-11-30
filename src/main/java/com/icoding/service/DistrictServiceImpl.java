package com.icoding.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.icoding.dao.DistrictDao;
import com.icoding.dao.GenericDao;
import com.icoding.domain.District;

@Service
@Transactional
public class DistrictServiceImpl extends GenericServiceImpl<District, Integer>implements DistrictService {

	@Autowired
	private DistrictDao districtDao;

	@Override
	GenericDao<District, Integer> getDao() {
		return districtDao;
	}

}
