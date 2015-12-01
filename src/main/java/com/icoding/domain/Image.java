package com.icoding.domain;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "image")
public class Image {

	@Id
	@GeneratedValue
	private Integer id;

	@Column(name = "name")
	private String name;

	@Column(name = "path")
	private String path;

	@Column(name = "ext")
	private String ext;

	@Column(name = "absolutely_path")
	private String absolutelyPath;

	@JsonIgnore
	@OneToMany(fetch = FetchType.EAGER, mappedBy = "image")
	@Fetch(FetchMode.SELECT)
	private List<District> listDistricts;


	@JsonIgnore
	@OneToMany(fetch = FetchType.EAGER, mappedBy = "image")
	@Fetch(FetchMode.SELECT)
	private List<Banner> listBanners;

	@JsonIgnore
	@OneToMany(fetch = FetchType.EAGER, mappedBy = "image")
	@Fetch(FetchMode.SELECT)
	private List<Food> listFoods;
	
	@JsonIgnore
	@OneToMany(fetch = FetchType.EAGER, mappedBy = "image")
	@Fetch(FetchMode.SELECT)
	private List<Store> listStores;

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

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public String getExt() {
		return ext;
	}

	public void setExt(String ext) {
		this.ext = ext;
	}

	public String getAbsolutelyPath() {
		return absolutelyPath;
	}

	public void setAbsolutelyPath(String absolutelyPath) {
		this.absolutelyPath = absolutelyPath;
	}

	public List<District> getListDistricts() {
		return listDistricts;
	}

	public void setListDistricts(List<District> listDistricts) {
		this.listDistricts = listDistricts;
	}

	public List<Banner> getListBanners() {
		return listBanners;
	}

	public void setListBanners(List<Banner> listBanners) {
		this.listBanners = listBanners;
	}

	public List<Food> getListFoods() {
		return listFoods;
	}

	public void setListFoods(List<Food> listFoods) {
		this.listFoods = listFoods;
	}

	public List<Store> getListStores() {
		return listStores;
	}

	public void setListStores(List<Store> listStores) {
		this.listStores = listStores;
	}
	

}
