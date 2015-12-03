package com.icoding.dao;

import org.springframework.stereotype.Repository;

import com.icoding.domain.Comment;

@Repository
public class CommentDaoImpl extends GenericDaoImpl<Comment, Integer>implements CommentDao {

}
