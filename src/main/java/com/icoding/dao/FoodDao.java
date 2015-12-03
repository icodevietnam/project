package com.icoding.dao;

import java.util.List;

import com.icoding.domain.Food;

public interface FoodDao extends GenericDao<Food, Integer> {
	List<Food> top12Food();
}
