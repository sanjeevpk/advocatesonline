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

package com.advocatesOnline.daoImpl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Repository;

import com.advocatesOnline.dao.RegistrationDao;
import com.advocatesOnline.dto.UserDto;
import com.advocatesOnline.entities.User;

/**
 * <pre>
 * -------------------------------------------------------------------------------------
 * Author............: Sanjeev Kulkarni
 * Creation Date.....: 25-Feb-2013
 * Project...........: AdvocatesOnline
 * Package...........: com.advocatesOnline.daoImpl
 * Filename..........: RegistrationDaoImpl.java
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

@Repository("RegistrationDao")
public class RegistrationDaoImpl extends AbstractDaoImpl implements RegistrationDao{

	@Override
	public UserDto saveNewRegistration(HttpServletRequest request, HttpServletResponse response) {
		//em.getTransaction().begin();
		//em.persist(user);
		//em.getTransaction().commit();
		return null;
	}

	@Override
	public UserDto saveNewRegistration(UserDto userDto) {
		User user = new User();
		user.setFirstName(userDto.getFirstName());
		user.setLastName(userDto.getLastName());
		user.setEmail(userDto.getEmail());
		System.out.println("In RegDaoImpl"+userDto.getEmail());
		
		em.getTransaction().begin();
		em.persist(user);
		em.getTransaction().commit();
		return userDto;
	}

}




