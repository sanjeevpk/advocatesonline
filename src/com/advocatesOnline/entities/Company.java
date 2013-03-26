/**
* Copyright 2012 Sanjeev Kulkarni
*
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
* http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

package com.advocatesOnline.entities;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

/**
 * <pre>
 * -------------------------------------------------------------------------------------
 * Author............: Sanjeev Kulkarni
 * Creation Date.....: 25-Feb-2013
 * Project...........: AdvocatesOnline
 * Package...........: com.advocatesOnline.entities
 * Filename..........: Company.java
 * Description.......:					    
 * 
 * Revision History..:
 *
 * Date             Changed By              Version         Reason
 * ---------------------------------------------------------------------------------------
 * 25-Feb-2013     	Sanjeev Kulkarni		 	1.0				NewFile
 * ---------------------------------------------------------------------------------------
 * </pre>
 */

public class Company implements Serializable{

	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	
	@Column(name = "company_name")
	private String companyName;
	
	@Column(name = "created_date")
	private Date createdDate;
	
	@Column(name = "created_time")
	private Date createdTime;
	
	@Column(name = "last_updated_date")
	private Date lastUpdatedDate;
	
	@Column(name = "last_updated_time")
	private Date lastUpdatedTime;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public Date getCreatedTime() {
		return createdTime;
	}

	public void setCreatedTime(Date createdTime) {
		this.createdTime = createdTime;
	}

	public Date getLastUpdatedDate() {
		return lastUpdatedDate;
	}

	public void setLastUpdatedDate(Date lastUpdatedDate) {
		this.lastUpdatedDate = lastUpdatedDate;
	}

	public Date getLastUpdatedTime() {
		return lastUpdatedTime;
	}

	public void setLastUpdatedTime(Date lastUpdatedTime) {
		this.lastUpdatedTime = lastUpdatedTime;
	}
}
