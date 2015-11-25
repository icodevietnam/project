package com.icoding.domain;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "user")
public class User {

	@Id
	@GeneratedValue
	private Integer id;

	@Column(name = "username")
	private String username;

	@Column(name = "password")
	private String password;

	@Column(name = "fullname", length = 255)
	private String fullName;

	@Column(name = "birthdate", length = 255)
	private String birthDate;

	@Column(name = "gender")
	private Boolean gender;

	@Column(name = "email")
	private String email;

	@Column(name = "address", length = 255)
	private String address;

	@Column(name = "phone", length = 255)
	private String phone;

	@Column(name = "state", length = 255)
	private String state;

	@OneToOne(cascade = CascadeType.ALL)
	@JoinTable(name = "user_roles", joinColumns = { @JoinColumn(name = "user_id", referencedColumnName = "id") }, inverseJoinColumns = { @JoinColumn(name = "role_id", referencedColumnName = "id") })
	private Role role;

	@OneToOne(fetch = FetchType.LAZY, mappedBy = "student", cascade = CascadeType.ALL)
	@JsonIgnore
	private Certificated certificated;

	@JsonIgnore
	@OneToMany(fetch = FetchType.EAGER, mappedBy = "ee")
	@Fetch(FetchMode.SELECT)
	private List<Program> listProgramsByEE;

	@JsonIgnore
	@OneToMany(fetch = FetchType.EAGER, mappedBy = "pl")
	@Fetch(FetchMode.SELECT)
	private List<Program> listProgramsByPL;
	
	@JsonIgnore
	@OneToMany(fetch = FetchType.EAGER, mappedBy = "student")
	@Fetch(FetchMode.SELECT)
	private List<Report> listReportsByStudent;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getBirthDate() {
		return birthDate;
	}

	public void setBirthDate(String birthDate) {
		this.birthDate = birthDate;
	}

	public Boolean getGender() {
		return gender;
	}

	public void setGender(Boolean gender) {
		this.gender = gender;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public Certificated getCertificated() {
		return certificated;
	}

	public void setCertificated(Certificated certificated) {
		this.certificated = certificated;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public List<Program> getListProgramsByEE() {
		return listProgramsByEE;
	}

	public void setListProgramsByEE(List<Program> listProgramsByEE) {
		this.listProgramsByEE = listProgramsByEE;
	}

	public List<Program> getListProgramsByPL() {
		return listProgramsByPL;
	}

	public void setListProgramsByPL(List<Program> listProgramsByPL) {
		this.listProgramsByPL = listProgramsByPL;
	}
	
}
