/**
 * Copyright 2013. All rights reserved by AdvocatesOnline. 
 * Do not copy or try to reproduce the source file.
 * Please write to admin@advocatesonline.com for any communications.
 */
package com.advocatesOnline.service;

import com.advocatesOnline.entity.User;

/**
 *<pre>
 * Author           : Sanjeev Kulkarni
 * Project          : AdvocatesOnline
 * Package          : com.advocatesOnline.service
 * File             : LoginService.java
 * Created On       : 18-May-2013 9:11:50 PM
 *
 *
 *<b>Revision History</b>
 *-------------------------------------------------------------------------------------------------------------------------------------------------
 *<b> Sl No.  | Changed By                    | Date & Time          | Remarks                                                                     
 *-------------------------------------------------------------------------------------------------------------------------------------------------
 *     1      | Sanjeev Kulkarni              | 18-May-2013 9:11:50 PM      | Initial Version
 *</pre>
 */

public interface LoginService {

	/**
	 * @param user
	 * @return
	 */
	boolean validateAndLogin(User user);

}
