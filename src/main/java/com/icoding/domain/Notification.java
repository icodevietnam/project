package com.icoding.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "notification")
public class Notification {

	@Id
	@GeneratedValue
	@Column(name = "id")
	private Integer id;

	@Column(name = "name")
	private String name;

	@Column(name = "content")
	private String content;

	@Column(name = "is_ee_read")
	private Boolean isEERead;

	@Column(name = "is_pl_read")
	private Boolean isPLRead;

	@Column(name = "is_pvc_read")
	private Boolean isPVCRead;

	@Column(name = "is_dlt_read")
	private Boolean isDLTRead;

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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Boolean getIsEERead() {
		return isEERead;
	}

	public void setIsEERead(Boolean isEERead) {
		this.isEERead = isEERead;
	}

	public Boolean getIsPLRead() {
		return isPLRead;
	}

	public void setIsPLRead(Boolean isPLRead) {
		this.isPLRead = isPLRead;
	}

	public Boolean getIsPVCRead() {
		return isPVCRead;
	}

	public void setIsPVCRead(Boolean isPVCRead) {
		this.isPVCRead = isPVCRead;
	}

	public Boolean getIsDLTRead() {
		return isDLTRead;
	}

	public void setIsDLTRead(Boolean isDLTRead) {
		this.isDLTRead = isDLTRead;
	}

}
