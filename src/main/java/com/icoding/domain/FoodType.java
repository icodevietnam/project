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
@Table(name = "foodtype")
public class FoodType {
	
	@Id
	@GeneratedValue
	private Integer id;
	
	@Column(name = "name")
	private String name;
	
	@Column(name = "description")
	private String description;
	
	@Column(name = "type")
	private String type;
	
	@ManyToOne
	@JoinColumn(name = "foodType")
	private FoodType foodType;
	
	@JsonIgnore
	@OneToMany(fetch = FetchType.EAGER, mappedBy = "foodType")
	@Fetch(FetchMode.SELECT)
	private List<FoodType> listFoodTypes;
	
	@JsonIgnore
	@OneToMany(fetch = FetchType.EAGER, mappedBy = "foodType")
	@Fetch(FetchMode.SELECT)
	private List<Food> listFoods;
	
	@JsonIgnore
	@OneToMany(fetch = FetchType.EAGER, mappedBy = "storeType")
	@Fetch(FetchMode.SELECT)
	private List<Store> listStores;
	
	
	
	public List<Store> getListStores() {
		return listStores;
	}

	public void setListStores(List<Store> listStores) {
		this.listStores = listStores;
	}

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

	public List<FoodType> getListFoodTypes() {
		return listFoodTypes;
	}

	public void setListFoodTypes(List<FoodType> listFoodTypes) {
		this.listFoodTypes = listFoodTypes;
	}

	public List<Food> getListFoods() {
		return listFoods;
	}

	public void setListFoods(List<Food> listFoods) {
		this.listFoods = listFoods;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	
	
}
