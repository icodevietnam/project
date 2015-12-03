package com.icoding.service;

import java.util.List;

import com.icoding.domain.Store;

public interface StoreService extends GenericService<Store, Integer> {
	
	List<Store> top8Stores();

}
