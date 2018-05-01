package edu.mum.waa.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.springframework.beans.factory.annotation.Autowired;

@Entity(name = "phone")
public class Phone {
	
	@Autowired
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Long phone_id;

	@Column(name="area")
	 private int area;
	
	@Column(name = "prefix") 
	private int prefix;
	
	@Column(name = "suffix")
	 private int suffix;
	
	public Phone(int area, int prefix, int suffix) {
		  this.area = area;
		  this.prefix = prefix;
		  this.suffix = suffix;
	  }
	  
	

	public Long getPhone_id() {
		return phone_id;
	}

	public void setPhone_id(Long phone_id) {
		this.phone_id = phone_id;
	}

	public int getArea() {
		return area;
	}

	public void setArea(int area) {
		this.area = area;
	}

	public int getPrefix() {
		return prefix;
	}

	public void setPrefix(int prefix) {
		this.prefix = prefix;
	}

	public int getSuffix() {
		return suffix;
	}

	public void setSuffix(int suffix) {
		this.suffix = suffix;
	}
	 
	
}
