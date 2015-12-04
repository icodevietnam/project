package com.icoding.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.icoding.dao.FoodTypeDao;
import com.icoding.dao.GenericDao;
import com.icoding.domain.FoodType;

@Service
@Transactional
public class FoodTypeServiceImpl extends GenericServiceImpl<FoodType, Integer>implements FoodTypeService {

	@Autowired
	private FoodTypeDao foodTypeDao;

	@Override
	GenericDao<FoodType, Integer> getDao() {
		return foodTypeDao;
	}

	@Override
	public List<FoodType> listParent() {
		return foodTypeDao.listParent();
	}

	@Override
	public List<FoodType> listStoreType() {
		return foodTypeDao.listStoreType();
	}

	@Override
	public List<FoodType> listFoodType() {
		return foodTypeDao.listFoodType();
	}

	@Override
	public List<FoodType> listChild() {
		return foodTypeDao.listChild();
	}
	
	

}
