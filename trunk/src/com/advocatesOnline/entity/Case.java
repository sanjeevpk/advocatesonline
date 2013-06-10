/**
 * Copyright 2013. All rights reserved by AdvocatesOnline. 
 * Do not copy or try to reproduce the source file.
 * Please write to admin@advocatesonline.com for any communications.
 */

package com.advocatesOnline.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 *<pre>
 * Author           : Sanjeev Kulkarni
 * Project          : AdvocatesOnline
 * Package          : com.advocatesOnline.entity
 * File             : Case.java
 * Created On       : 29-May-2013 8:02:36 PM
 *
 *
 *<b>Revision History</b>
 *-------------------------------------------------------------------------------------------------------------------------------------------------
 *<b> Sl No.  | Changed By                    | Date & Time          | Remarks                                                                     
 *-------------------------------------------------------------------------------------------------------------------------------------------------
 *     1      | Sanjeev Kulkarni              | 29-May-2013 8:02:36 PM      | Initial Version
 *</pre>
 */

@Entity
@Table(name = "cases")
public class Case extends BaseEntity{
	private static final long serialVersionUID = 4786678325321175345L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	
	@Column(name = "title")
	private String title;
	
	@Column(name = "detail_description")
	private String detailDescription;
	
	@Column(name = "category")
	private String category;
	
	@Column(name = "submitted_by")
	private String submittedBy;
	
	@Column(name = "viewed_by")
	private String viewedBy;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDetailDescription() {
		return detailDescription;
	}

	public void setDetailDescription(String detailDescription) {
		this.detailDescription = detailDescription;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getSubmittedBy() {
		return submittedBy;
	}

	public void setSubmittedBy(String submittedBy) {
		this.submittedBy = submittedBy;
	}

	public String getViewedBy() {
		return viewedBy;
	}

	public void setViewedBy(String viewedBy) {
		this.viewedBy = viewedBy;
	}
}
