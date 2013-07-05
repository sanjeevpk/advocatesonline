/**
 * Copyright 2013. All rights reserved by AdvocatesOnline. 
 * Do not copy or try to reproduce the source file.
 * Please write to admin@advocatesonline.com for any communications.
 */
package com.advocatesOnline.serviceImpl;

import org.springframework.stereotype.Service;

import com.advocatesOnline.dao.DaoFactory;
import com.advocatesOnline.entity.Case;
import com.advocatesOnline.entity.User;
import com.advocatesOnline.service.UserService;

/**
 *<pre>
 * Author           : Sanjeev Kulkarni
 * Project          : AdvocatesOnline
 * Package          : com.advocatesOnline.serviceImpl
 * File             : UserServiceImpl.java
 * Created On       : 30-May-2013 6:21:24 PM
 *
 *
 *<b>Revision History</b>
 *-------------------------------------------------------------------------------------------------------------------------------------------------
 *<b> Sl No.  | Changed By                    | Date & Time          | Remarks                                                                     
 *-------------------------------------------------------------------------------------------------------------------------------------------------
 *     1      | Sanjeev Kulkarni              | 30-May-2013 6:21:24 PM      | Initial Version
 *</pre>
 */

@Service
public class UserServiceImpl implements UserService{

	/* (non-Javadoc)
	 * @see com.advocatesOnline.service.UserService#saveCase(com.advocatesOnline.entity.Case)
	 */
	@Override
	public Case saveCase(Case userCase) {
		Case caseResult = DaoFactory.getCaseDao().saveCase(userCase);
		if(caseResult != null)
			return caseResult;
		else
			return null;
	}

	/* (non-Javadoc)
	 * @see com.advocatesOnline.service.UserService#chageUserPassword(java.lang.String, java.lang.String, java.lang.String, java.lang.String)
	 */
	@Override
	public boolean chageUserPassword(String userId, String oldPassword,
			String newPassword, String confirmNewPassword) {
		boolean changed = DaoFactory.getUserDao().changeUserPassword(userId,oldPassword,newPassword,confirmNewPassword);
		if(changed)
			return true;
		return false;
	}

	/* (non-Javadoc)
	 * @see com.advocatesOnline.service.UserService#viewUserProfile(java.lang.String)
	 */
	@Override
	public User viewUserProfile(int userId) {
		User user = DaoFactory.getUserDao().viewUserProfile(userId);
		return user;
	}

	/* (non-Javadoc)
	 * @see com.advocatesOnline.service.UserService#logoutUser(com.advocatesOnline.entity.User)
	 */
	@Override
	public void logoutUser(User user) {
		DaoFactory.getUserDao().logoutUser(user);
	}
	
}
