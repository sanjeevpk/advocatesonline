/**
 * Copyright 2013. All rights reserved by AdvocatesOnline. 
 * Do not copy or try to reproduce the source file.
 * Please write to admin@advocatesonline.com for any communications.
 */

package com.advocatesOnline.service;

import java.io.InputStream;

import com.advocatesOnline.entity.Case;
import com.advocatesOnline.entity.User;

/**
 *<pre>
 * Author           : Sanjeev Kulkarni
 * Project          : AdvocatesOnline
 * Package          : com.advocatesOnline.service
 * File             : UserService.java
 * Created On       : 30-May-2013 6:20:37 PM
 *
 *
 *<b>Revision History</b>
 *-------------------------------------------------------------------------------------------------------------------------------------------------
 *<b> Sl No.  | Changed By                    | Date & Time          | Remarks                                                                     
 *-------------------------------------------------------------------------------------------------------------------------------------------------
 *     1      | Sanjeev Kulkarni              | 30-May-2013 6:20:37 PM      | Initial Version
 *</pre>
 */

public interface UserService {

	/**
	 * @param userCase
	 * @return
	 */
	Case saveCase(Case userCase);

	/**
	 * @param userId
	 * @param oldPassword
	 * @param newPassword
	 * @param confirmNewPassword
	 * @return
	 */
	boolean chageUserPassword(String userId, String oldPassword,
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
	User displayImaage(String imageId);

}
