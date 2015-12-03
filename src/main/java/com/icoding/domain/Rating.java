package com.icoding.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "rating")
public class Rating {

	@Id
	@GeneratedValue
	private Integer id;

	@Column(name = "point")
	private Integer point;

	@ManyToOne
	@JoinColumn(name = "store", nullable = true)
	private Store store;

	@ManyToOne
	@JoinColumn(name = "food", nullable = true)
	private Food food;

	@ManyToOne
	@JoinColumn(name = "user")
	private User user;

}
