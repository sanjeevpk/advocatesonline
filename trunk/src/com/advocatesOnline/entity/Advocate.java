/**
 * Copyright 2013. All rights reserved by AdvocatesOnline. 
 * Do not copy or try to reproduce the source file.
 * Please write to admin@advocatesonline.com for any communications.
 */

package com.advocatesOnline.entity;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.advocatesOnline.enums.Gender;
import com.advocatesOnline.enums.UserType;

/**
 *<pre>
 * Author           : Sanjeev Kulkarni
 * Project          : AdvocatesOnline
 * Package          : com.advocatesOnline.entity
 * File             : Advocate.java
 * Created On       : 27-May-2013 4:33:58 PM
 *
 *
 *<b>Revision History</b>
 *-------------------------------------------------------------------------------------------------------------------------------------------------
 *<b> Sl No.  | Changed By                    | Date & Time          		| Remarks                                                                     
 *-------------------------------------------------------------------------------------------------------------------------------------------------
 *     1      | Sanjeev Kulkarni              | 27-May-2013 4:33:58 PM      | Initial Version
 *</pre>
 */

@Entity
@Table(name = "advocate")
public class Advocate extends BaseEntity{
	private static final long serialVersionUID = -4500115432922002588L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	
	@Column(name = "name")
	private String name;
	
	@Column(name = "email")
	private String email;
	
	@Column(name = "password")
	private String password;
	
	@Column(name = "date_of_birth")
	private Date dateOfBirth;
	
	@Column(name = "gender")
	@Enumerated(EnumType.STRING)
	private Gender gender;
	
	@Column(name ="active")
	private boolean active;
	
	@Column(name = "logged_in")
	private boolean loggedIn;
	
	@Column(name = "user_type")
	@Enumerated(EnumType.STRING)
	private UserType userType;
	
	@OneToMany(cascade = CascadeType.ALL, mappedBy = "user") 
	private List<Address> address;
	
	@Column(name = "bar_council_no")
	private String barCouncilNo;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Date getDateOfBirth() {
		return dateOfBirth;
	}

	public void setDateOfBirth(Date dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}

	public Gender getGender() {
		return gender;
	}

	public void setGender(Gender gender) {
		this.gender = gender;
	}

	public boolean isActive() {
		return active;
	}

	public void setActive(boolean active) {
		this.active = active;
	}

	public boolean isLoggedIn() {
		return loggedIn;
	}

	public void setLoggedIn(boolean loggedIn) {
		this.loggedIn = loggedIn;
	}

	public UserType getUserType() {
		return userType;
	}

	public void setUserType(UserType userType) {
		this.userType = userType;
	}

	public List<Address> getAddress() {
		return address;
	}

	public void setAddress(List<Address> address) {
		this.address = address;
	}

	public String getBarCouncilNo() {
		return barCouncilNo;
	}

	public void setBarCouncilNo(String barCouncilNo) {
		this.barCouncilNo = barCouncilNo;
	}
}
