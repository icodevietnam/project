
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
@Table(name = "store")
public class Store {
	@Id
	@GeneratedValue
	private Integer id;

	@Column(name = "name")
	private String name;

	@Column(name = "description")
	private String description;

	@Column(name = "address")
	private String address;

	@Column(name = "open_hour")
	private String openHour;

	@Column(name = "close_hour")
	private String closeHour;

	@Column(name = "price_limit")
	private String priceLimit;

	@Column(name = "phone")
	private String phone;

	@Column(name = "is_confirm")
	private Boolean isConfirm;

	@ManyToOne
	@JoinColumn(name = "storeType")
	private FoodType storeType;

	@ManyToOne
	@JoinColumn(name = "image")
	private Image image;

	@ManyToOne
	@JoinColumn(name = "district")
	private District district;

	@JsonIgnore
	@OneToMany(fetch = FetchType.EAGER, mappedBy = "store")
	@Fetch(FetchMode.SELECT)
	private List<Food> listFoods;
	
	@JsonIgnore
	@OneToMany(fetch = FetchType.EAGER, mappedBy = "store")
	@Fetch(FetchMode.SELECT)
	private List<Comment> listComments;
	
	@JsonIgnore
	@OneToMany(fetch = FetchType.EAGER, mappedBy = "store")
	@Fetch(FetchMode.SELECT)
	private List<Rating> listRatings;
	
	
	public List<Rating> getListRatings() {
		return listRatings;
	}

	public void setListRatings(List<Rating> listRatings) {
		this.listRatings = listRatings;
	}

	public List<Comment> getListComments() {
		return listComments;
	}

	public void setListComments(List<Comment> listComments) {
		this.listComments = listComments;
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

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getOpenHour() {
		return openHour;
	}

	public void setOpenHour(String openHour) {
		this.openHour = openHour;
	}

	public String getCloseHour() {
		return closeHour;
	}

	public void setCloseHour(String closeHour) {
		this.closeHour = closeHour;
	}

	public String getPriceLimit() {
		return priceLimit;
	}

	public void setPriceLimit(String priceLimit) {
		this.priceLimit = priceLimit;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public FoodType getStoreType() {
		return storeType;
	}

	public void setStoreType(FoodType storeType) {
		this.storeType = storeType;
	}

	public List<Food> getListFoods() {
		return listFoods;
	}

	public void setListFoods(List<Food> listFoods) {
		this.listFoods = listFoods;
	}

	public District getDistrict() {
		return district;
	}

	public void setDistrict(District district) {
		this.district = district;
	}

	public Image getImage() {
		return image;
	}

	public void setImage(Image image) {
		this.image = image;
	}

	public Boolean getIsConfirm() {
		return isConfirm;
	}

	public void setIsConfirm(Boolean isConfirm) {
		this.isConfirm = isConfirm;
	}

}
