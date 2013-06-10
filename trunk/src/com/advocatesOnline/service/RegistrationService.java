/**
 * Copyright 2013. All rights reserved by AdvocatesOnline. 
 * Do not copy or try to reproduce the source file.
 * Please write to admin@advocatesonline.com for any communications.
 */
package com.advocatesOnline.service;

import com.advocatesOnline.entity.Advocate;
import com.advocatesOnline.entity.User;

/**
 *<pre>
 * Author           : Sanjeev Kulkarni
 * Project          : AdvocatesOnline
 * Package          : com.advocatesOnline.service
 * File             : RegistrationService.java
 * Created On       : 16-May-2013 11:04:44 AM
 *
 *
 *<b>Revision History</b>
 *-------------------------------------------------------------------------------------------------------------------------------------------------
 *<b> Sl No.  | Changed By                    | Date & Time          | Remarks                                                                     
 *-------------------------------------------------------------------------------------------------------------------------------------------------
 *     1      | Sanjeev Kulkarni              | 16-May-2013 11:04:44 AM      | Initial Version
 *</pre>
 */

public interface RegistrationService {

	/**
	 * @param user
	 * @return
	 */
	boolean saveNewRegistration(User user);
	
	boolean checkEmailUniqness(User user);

	/**
	 * @param advocate
	 * @return
	 */
	boolean checkEmailUniqness(Advocate advocate);

	/**
	 * @param advocate
	 * @return
	 */
	boolean saveNewAdvocateRegistration(Advocate advocate);

}
