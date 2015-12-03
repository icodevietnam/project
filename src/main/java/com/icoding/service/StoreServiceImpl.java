package com.icoding.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.icoding.dao.GenericDao;
import com.icoding.dao.StoreDao;
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

	@Override
	public List<Store> top8Stores() {
		return storeDao.top8Stores();
	}

}
