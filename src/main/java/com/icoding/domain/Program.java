package com.icoding.domain;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.hibernate.annotations.GenericGenerator;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "program")
public class Program {

	@Id
	@GenericGenerator(name = "seq_program_code", strategy = "com.icoding.generator.ProgramCodeGenerator")
	@GeneratedValue(generator = "seq_program_code", strategy = GenerationType.SEQUENCE)
	@Column(name = "code", unique = true, nullable = false, length = 20)
	private String code;

	@Column(name = "name")
	private String name;

	@Column(name = "description")
	private String description;

	@ManyToOne
	@JoinColumn(name = "faculty")
	private Faculty faculty;

	@ManyToOne
	@JoinColumn(name = "ee")
	private User ee;

	@ManyToOne
	@JoinColumn(name = "pl")
	private User pl;

	@Column(name = "type_grade")
	private String typeOfGrade;

	@Column(name = "type_conduct")
	private String typeOfConduct;

	@Column(name = "academic_year")
	private String academicYear;
	
	@JsonIgnore
	@OneToMany(fetch = FetchType.EAGER, mappedBy = "program")
	@Fetch(FetchMode.SELECT)
	private List<Report> listReports;
	
	@Column(name = "isHot")
	private Boolean isHot;

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
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

	public Faculty getFaculty() {
		return faculty;
	}

	public void setFaculty(Faculty faculty) {
		this.faculty = faculty;
	}

	public User getEe() {
		return ee;
	}

	public void setEe(User ee) {
		this.ee = ee;
	}

	public String getAcademicYear() {
		return academicYear;
	}

	public void setAcademicYear(String academicYear) {
		this.academicYear = academicYear;
	}

	public User getPl() {
		return pl;
	}

	public void setPl(User pl) {
		this.pl = pl;
	}

	public String getTypeOfGrade() {
		return typeOfGrade;
	}

	public void setTypeOfGrade(String typeOfGrade) {
		this.typeOfGrade = typeOfGrade;
	}

	public String getTypeOfConduct() {
		return typeOfConduct;
	}

	public void setTypeOfConduct(String typeOfConduct) {
		this.typeOfConduct = typeOfConduct;
	}

	public List<Report> getListReports() {
		return listReports;
	}

	public void setListReports(List<Report> listReports) {
		this.listReports = listReports;
	}

	public Boolean getIsHot() {
		return isHot;
	}

	public void setIsHot(Boolean isHot) {
		this.isHot = isHot;
	}
	
}
