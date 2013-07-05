/**
 * Copyright 2013. All rights reserved by AdvocatesOnline. 
 * Do not copy or try to reproduce the source file.
 * Please write to admin@advocatesonline.com for any communications.
 */
package com.advocatesOnline.serviceImpl;

import org.springframework.stereotype.Service;

import com.advocatesOnline.dao.DaoFactory;
import com.advocatesOnline.entity.User;
import com.advocatesOnline.service.LoginService;

/**
 *<pre>
 * Author           : Sanjeev Kulkarni
 * Project          : AdvocatesOnline
 * Package          : com.advocatesOnline.serviceImpl
 * File             : LoginServiceImpl.java
 * Created On       : 18-May-2013 9:12:17 PM
 *
 *
 *<b>Revision History</b>
 *-------------------------------------------------------------------------------------------------------------------------------------------------
 *<b> Sl No.  | Changed By                    | Date & Time          | Remarks                                                                     
 *-------------------------------------------------------------------------------------------------------------------------------------------------
 *     1      | Sanjeev Kulkarni              | 18-May-2013 9:12:17 PM      | Initial Version
 *</pre>
 */

@Service
public class LoginServiceImpl implements LoginService{

	/* (non-Javadoc)
	 * @see com.advocatesOnline.service.LoginService#validateAndLogin(com.advocatesOnline.entity.User)
	 */
	@Override
	public User validateAndLogin(User user) {
		User userDetails = null;
		try{
			userDetails = DaoFactory.getLoginDao().validateAndLogin(user);
			
		}catch(Exception e){
			e.printStackTrace();
			System.out.println(e);
		}
		if(userDetails != null)
			return userDetails;
		return null;
	}
}
