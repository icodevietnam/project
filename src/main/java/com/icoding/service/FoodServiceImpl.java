package com.icoding.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.icoding.dao.FoodDao;
import com.icoding.dao.GenericDao;
import com.icoding.domain.Food;

@Service
@Transactional
public class FoodServiceImpl extends GenericServiceImpl<Food, Integer>implements FoodService {

	@Autowired
	private FoodDao foodDao;

	@Override
	GenericDao<Food, Integer> getDao() {
		return foodDao;
	}

}
