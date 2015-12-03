package com.icoding.service;

import java.util.List;

import com.icoding.domain.Food;

public interface FoodService extends GenericService<Food, Integer> {
	List<Food> top12Food();
}
