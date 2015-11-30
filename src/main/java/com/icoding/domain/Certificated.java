package com.icoding.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;

@Entity
@Table(name = "certificated")
public class Certificated {

	@GenericGenerator(name = "generator", strategy = "foreign", parameters = @Parameter(name = "property", value = "student"))
	@Id
	@GeneratedValue(generator = "generator")
	@Column(name = "id")
	private Integer id;

	@Column(name = "math")
	private Integer math;

	@Column(name = "literity")
	private Integer literity;

	@Column(name = "english")
	private Integer english;

	@Column(name = "chemitry")
	private Integer chemistry;

	@Column(name = "physical")
	private Integer physical;

	@Column(name = "biological")
	private Integer biological;

	@OneToOne(fetch = FetchType.LAZY)
	@PrimaryKeyJoinColumn
	private User student;

	// Hanh kiem cua hoc sinh sinh vien do
	@Column(name = "conduct")
	private String conduct;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getMath() {
		return math;
	}

	public void setMath(Integer math) {
		this.math = math;
	}

	public Integer getLiterity() {
		return literity;
	}

	public void setLiterity(Integer literity) {
		this.literity = literity;
	}

	public Integer getEnglish() {
		return english;
	}

	public void setEnglish(Integer english) {
		this.english = english;
	}

	public Integer getChemistry() {
		return chemistry;
	}

	public void setChemistry(Integer chemistry) {
		this.chemistry = chemistry;
	}

	public Integer getPhysical() {
		return physical;
	}

	public void setPhysical(Integer physical) {
		this.physical = physical;
	}

	public Integer getBiological() {
		return biological;
	}

	public void setBiological(Integer biological) {
		this.biological = biological;
	}

	public User getStudent() {
		return student;
	}

	public void setStudent(User student) {
		this.student = student;
	}

	public String getConduct() {
		return conduct;
	}

	public void setConduct(String conduct) {
		this.conduct = conduct;
	}

}
