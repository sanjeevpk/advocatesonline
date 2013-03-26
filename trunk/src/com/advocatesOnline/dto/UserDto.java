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

package com.advocatesOnline.dto;

/**
 * <pre>
 * -------------------------------------------------------------------------------------
 * Author............: Sanjeev Kulkarni
 * Creation Date.....: 27-Feb-2013
 * Project...........: AdvocatesOnline
 * Package...........: com.advocatesOnline.dto
 * Filename..........: UserDto.java
 * Description.......:					    
 * 
 * Revision History..:
 *
 * Date             Changed By              Version         Reason
 * ---------------------------------------------------------------------------------------
 * 27-Feb-2013     	Sanjeev Kulkarni		 	1.0				NewFile
 * ---------------------------------------------------------------------------------------
 * </pre>
 */

public class UserDto extends CompanyDto{
	private static final long serialVersionUID = 1L;
	private int id;
	private String firstName;
	private String middleName;
	private String lastName;
	private String email;
	public int getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getMiddleName() {
		return middleName;
	}
	public void setMiddleName(String middleName) {
		this.middleName = middleName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
}
