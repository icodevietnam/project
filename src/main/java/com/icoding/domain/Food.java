package com.icoding.domain;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "food")
public class Food {

	@Id
	@GeneratedValue
	private Integer id;

	@Column(name = "name")
	private String name;

	@Column(name = "description")
	private String description;

	@ManyToOne
	@JoinColumn(name = "foodType")
	private FoodType foodType;

	@ManyToOne
	@JoinColumn(name = "image")
	private Image image;

	@ManyToOne
	@JoinColumn(name = "store")
	private Store store;

	@JsonIgnore
	@OneToMany(fetch = FetchType.EAGER, mappedBy = "food")
	@Fetch(FetchMode.SELECT)
	private List<Comment> listComments;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public FoodType getFoodType() {
		return foodType;
	}

	public void setFoodType(FoodType foodType) {
		this.foodType = foodType;
	}

	public Image getImage() {
		return image;
	}

	@JsonIgnore
	@OneToMany(fetch = FetchType.EAGER, mappedBy = "food")
	@Fetch(FetchMode.SELECT)
	private List<Rating> listRatings;

	public void setImage(Image image) {
		this.image = image;
	}

	public Store getStore() {
		return store;
	}

	public void setStore(Store store) {
		this.store = store;
	}

	public List<Comment> getListComments() {
		return listComments;
	}

	public void setListComments(List<Comment> listComments) {
		this.listComments = listComments;
	}

}
