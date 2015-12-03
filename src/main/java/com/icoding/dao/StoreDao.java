package com.icoding.dao;

import java.util.List;

import com.icoding.domain.Store;

public interface StoreDao extends GenericDao<Store, Integer> {
	List<Store> top8Stores();

	List<Store> searchStore(String keyword);
}
