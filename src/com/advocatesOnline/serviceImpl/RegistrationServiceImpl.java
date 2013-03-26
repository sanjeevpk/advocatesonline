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

package com.advocatesOnline.serviceImpl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.advocatesOnline.dao.RegistrationDao;
import com.advocatesOnline.dto.UserDto;
import com.advocatesOnline.service.RegistrationService;

/**
 * <pre>
 * -------------------------------------------------------------------------------------
 * Author............: Sanjeev Kulkarni
 * Creation Date.....: 25-Feb-2013
 * Project...........: AdvocatesOnline
 * Package...........: com.advocatesOnline.serviceImpl
 * Filename..........: RegistrationServiceImpl.java
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

@Service
public class RegistrationServiceImpl implements RegistrationService{
	
	@Autowired
	RegistrationDao registrationDao;
	
	@Override
	public UserDto saveNewRegistration(HttpServletRequest request, HttpServletResponse response) {
		UserDto userDto = registrationDao.saveNewRegistration(request,response);
		return userDto;
	}

	@Override
	public UserDto saveNewRegistration(UserDto userDto) {
		System.out.println("In RegServiceImpl"+userDto.getEmail());
		UserDto userDto2 = registrationDao.saveNewRegistration(userDto);
		return userDto2;
	}

}





