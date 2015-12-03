package com.icoding.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.icoding.dao.CommentDao;
import com.icoding.dao.GenericDao;
import com.icoding.domain.Comment;

@Service
@Transactional
public class CommentServiceImpl extends GenericServiceImpl<Comment, Integer>implements CommentService {

	@Autowired
	private CommentDao commentDao;

	@Override
	GenericDao<Comment, Integer> getDao() {
		return commentDao;
	}

}
