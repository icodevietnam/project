package com.icoding.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.icoding.domain.Store;

@Repository
public class StoreDaoImpl extends GenericDaoImpl<Store, Integer> implements StoreDao {

	@Override
	public List<Store> top8Stores() {
		List<Store> listStores = new ArrayList<Store>();
		Query query = currentSession().createQuery("from Store f order by f.id desc");
		query.setMaxResults(12);
		listStores = query.list();
		return listStores;
	}

	@Override
	public List<Store> searchStore(String keyword) {
		List<Store> listStores = new ArrayList<Store>();
		Query query = currentSession().createQuery("from Store s where s.name LIKE :keyword order by s.id desc");
		query.setString("keyword", "%" + keyword + "%");
		listStores = query.list();
		return listStores;
	}

}
