package com.icoding.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.icoding.dao.CertificateDao;
import com.icoding.dao.GenericDao;
import com.icoding.domain.Certificated;

@Service
@Transactional
public class CertificateServiceImpl extends
		GenericServiceImpl<Certificated, Integer> implements CertificateService {

	private CertificateDao certificateDao;

	@Override
	GenericDao<Certificated, Integer> getDao() {
		return certificateDao;
	}

}
