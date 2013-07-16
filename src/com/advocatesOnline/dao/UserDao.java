/**
 * Copyright 2013. All rights reserved by AdvocatesOnline. 
 * Do not copy or try to reproduce the source file.
 * Please write to admin@advocatesonline.com for any communications.
 */
package com.advocatesOnline.dao;

import java.io.InputStream;

import com.advocatesOnline.entity.User;

/**
 *<pre>
 * Author           : Sanjeev Kulkarni
 * Project          : AdvocatesOnline
 * Package          : com.advocatesOnline.dao
 * File             : UserDao.java
 * Created On       : 01-Jun-2013 8:00:28 PM
 *
 *
 *<b>Revision History</b>
 *-------------------------------------------------------------------------------------------------------------------------------------------------
 *<b> Sl No.  | Changed By                    | Date & Time          | Remarks                                                                     
 *-------------------------------------------------------------------------------------------------------------------------------------------------
 *     1      | Sanjeev Kulkarni              | 01-Jun-2013 8:00:28 PM      | Initial Version
 *</pre>
 */

public interface UserDao {

	/**
	 * @param userId
	 * @param newPassword
	 * @param confirmNewPassword
	 * @param confirmNewPassword2 
	 * @return
	 */
	boolean changeUserPassword(String userId, String oldPassword,
			String newPassword, String confirmNewPassword);

	/**
	 * @param userId
	 * @return
	 */
	User viewUserProfile(int userId);

	/**
	 * @param user
	 * @return
	 */
	void logoutUser(User user);

	/**
	 * @param user
	 * @param inputStream
	 */
	void uploadImage(User user, InputStream inputStream);

	/**
	 * @param imageId
	 * @return 
	 */
	User displayImage(String imageId);

}
