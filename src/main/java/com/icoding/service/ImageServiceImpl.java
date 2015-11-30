package com.icoding.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.icoding.dao.ImageDao;
import com.icoding.dao.GenericDao;
import com.icoding.domain.Image;

@Service
@Transactional
public class ImageServiceImpl extends GenericServiceImpl<Image, Integer>implements ImageService {

	@Autowired
	private ImageDao districtDao;

	@Override
	GenericDao<Image, Integer> getDao() {
		return districtDao;
	}

}
