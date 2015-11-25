package com.icoding.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.icoding.dao.GenericDao;

@Service
@Transactional
public abstract class GenericServiceImpl<E, K> implements GenericService<E, K> {

	abstract GenericDao<E, K> getDao();

	@Override
	public void saveOrUpdate(E entity) {
		getDao().saveOrUpdate(entity);
	}

	@Override
	public List<E> getAll() {
		return getDao().getAll();
	}

	@Override
	public E get(K id) {
		return getDao().find(id);
	}

	@Override
	public void add(E entity) {
		getDao().add(entity);
	}

	@Override
	public void update(E entity) {
		getDao().update(entity);
	}

	@Override
	public void remove(E entity) {
		getDao().remove(entity);
	}

}
