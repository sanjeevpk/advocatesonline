/**
 * Copyright 2013. All rights reserved by AdvocatesOnline. 
 * Do not copy or try to reproduce the source file.
 * Please write to admin@advocatesonline.com for any communications.
 */
package com.advocatesOnline.dao;

import com.advocatesOnline.entity.User;

/**
 *<pre>
 * Author           : Sanjeev Kulkarni
 * Project          : AdvocatesOnline
 * Package          : com.advocatesOnline.dao
 * File             : RegistrationDao.java
 * Created On       : 16-May-2013 1:03:46 PM
 *
 *
 *<b>Revision History</b>
 *-------------------------------------------------------------------------------------------------------------------------------------------------
 *<b> Sl No.  | Changed By                    | Date & Time          | Remarks                                                                     
 *-------------------------------------------------------------------------------------------------------------------------------------------------
 *     1      | Sanjeev Kulkarni              | 16-May-2013 1:03:46 PM      | Initial Version
 *</pre>
 */

public interface RegistrationDao {

	/**
	 * @param user
	 * @return
	 */
	boolean saveNewRegistration(User user);
	
	boolean checkEmailUniqness(User user);

}
