package com.icoding.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.icoding.domain.Food;

@Repository
public class FoodDaoImpl extends GenericDaoImpl<Food, Integer>implements FoodDao {

	@Override
	public List<Food> top12Food() {
		List<Food> listFoods = new ArrayList<Food>();
		Query query = currentSession().createQuery("from Food f order by f.id desc");
		query.setMaxResults(12);
		listFoods = query.list();
		return listFoods;
	}

	@Override
	public List<Food> searchFood(String keyword) {
		List<Food> listFoods = new ArrayList<Food>();
		Query query = currentSession().createQuery("from Food f where f.name LIKE :keyword order by f.id desc");
		query.setString("keyword", "%" + keyword + "%");
		listFoods = query.list();
		return listFoods;
	}

}
