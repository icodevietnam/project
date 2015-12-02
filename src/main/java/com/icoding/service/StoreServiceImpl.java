package com.icoding.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.icoding.dao.StoreDao;
import com.icoding.dao.GenericDao;
import com.icoding.domain.Store;

@Service
@Transactional
public class StoreServiceImpl extends GenericServiceImpl<Store, Integer>implements StoreService {

	@Autowired
	private StoreDao storeDao;

	@Override
	GenericDao<Store, Integer> getDao() {
		return storeDao;
	}

}
