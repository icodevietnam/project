package com.icoding.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.icoding.dao.GenericDao;
import com.icoding.dao.RatingDao;
import com.icoding.domain.Rating;

@Service
@Transactional
public class RatingServiceImpl extends GenericServiceImpl<Rating, Integer>implements RatingService {

	@Autowired
	private RatingDao ratingDao;

	@Override
	GenericDao<Rating, Integer> getDao() {
		return ratingDao;
	}

}
