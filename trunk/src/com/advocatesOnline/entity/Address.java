/**
 * Copyright 2013. All rights reserved by AdvocatesOnline. 
 * Do not copy or try to reproduce the source file.
 * Please write to admin@advocatesonline.com for any communications.
 */
package com.advocatesOnline.entity;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;


/**
 *<pre>
 * Author           : Sanjeev Kulkarni
 * Project          : AdvocatesOnline
 * Package          : com.advocatesOnline.entity
 * File             : Address.java
 * Created On       : 16-May-2013 2:17:58 PM
 *
 *
 *<b>Revision History</b> 
 *-------------------------------------------------------------------------------------------------------------------------------------------------
 *<b> Sl No.  | Changed By                    | Date & Time          | Remarks                                                                     
 *-------------------------------------------------------------------------------------------------------------------------------------------------
 *     1      | Sanjeev Kulkarni              | 16-May-2013 2:17:58 PM      | Initial Version
 *</pre>
 */

@Entity
@Table(name = "address")
public class Address extends BaseEntity{

	private static final long serialVersionUID = -6206886513176857147L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;	
	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "user")
	private User user;
	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "advocate")
	private Advocate advocate;
	
	@Column(name ="address_line1")
	private String addressLine1;
	
	@Column(name ="address_line2")
	private String addressLine2;
	
	@Column(name ="city")
	private String city;
	
	@Column(name ="state")
	private String state;
	
	@Column(name ="country")
	private String country;
	
	@Column(name ="pincode")
	private String pincode;
	
	@Column(name ="landmark")
	private String landmark;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getAddressLine1() {
		return addressLine1;
	}

	public void setAddressLine1(String addressLine1) {
		this.addressLine1 = addressLine1;
	}

	public String getAddressLine2() {
		return addressLine2;
	}

	public void setAddressLine2(String addressLine2) {
		this.addressLine2 = addressLine2;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getPincode() {
		return pincode;
	}

	public void setPincode(String pincode) {
		this.pincode = pincode;
	}

	public String getLandmark() {
		return landmark;
	}

	public void setLandmark(String landmark) {
		this.landmark = landmark;
	}

	public Advocate getAdvocate() {
		return advocate;
	}

	public void setAdvocate(Advocate advocate) {
		this.advocate = advocate;
	}
}
