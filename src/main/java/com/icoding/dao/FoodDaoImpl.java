package com.icoding.dao;

import org.springframework.stereotype.Repository;

import com.icoding.domain.Food;

@Repository
public class FoodDaoImpl extends GenericDaoImpl<Food, Integer> implements
		FoodDao {

}
