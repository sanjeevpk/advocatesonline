/**
 * Copyright 2013. All rights reserved by AdvocatesOnline. 
 * Do not copy or try to reproduce the source file.
 * Please write to admin@advocatesonline.com for any communications.
 */
package com.advocatesOnline.serviceImpl;

import org.springframework.stereotype.Service;

import com.advocatesOnline.dao.DaoFactory;
import com.advocatesOnline.entity.User;
import com.advocatesOnline.service.RegistrationService;

/**
 *<pre>
 * Author           : Sanjeev Kulkarni
 * Project          : AdvocatesOnline
 * Package          : com.advocatesOnline.serviceImpl
 * File             : RegistrationServiceImpl.java
 * Created On       : 16-May-2013 11:05:17 AM
 *
 *
 *<b>Revision History</b>
 *-------------------------------------------------------------------------------------------------------------------------------------------------
 *<b> Sl No.  | Changed By                    | Date & Time          | Remarks                                                                     
 *-------------------------------------------------------------------------------------------------------------------------------------------------
 *     1      | Sanjeev Kulkarni              | 16-May-2013 11:05:17 AM      | Initial Version
 *</pre>
 */

@Service
public class RegistrationServiceImpl implements RegistrationService{

	/* (non-Javadoc)
	 * @see com.advocatesOnline.service.RegistrationService#saveNewRegistration(com.advocatesOnline.entity.User)
	 */
	@Override
	public boolean saveNewRegistration(User user) {
		boolean saved = DaoFactory.getRegistrationDao().saveNewRegistration(user);//registrationDao.saveNewRegistration(user);
		if(saved){
			return true;
		}else{
			return false;
		}
	}

	/* (non-Javadoc)
	 * @see com.advocatesOnline.service.RegistrationService#checkEmailUniqness(com.advocatesOnline.entity.User)
	 */
	@Override
	public boolean checkEmailUniqness(User user) {
		boolean valid = DaoFactory.getRegistrationDao().checkEmailUniqness(user);
		return valid;
	}

}
