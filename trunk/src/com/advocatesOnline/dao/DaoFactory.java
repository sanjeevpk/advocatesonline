/**
 * Copyright 2013. All rights reserved by AdvocatesOnline. 
 * Do not copy or try to reproduce the source file.
 * Please write to admin@advocatesonline.com for any communications.
 */

package com.advocatesOnline.dao;

import com.advocatesOnline.daoImpl.CaseDaoImpl;
import com.advocatesOnline.daoImpl.LoginDaoImpl;
import com.advocatesOnline.daoImpl.RegistrationDaoImpl;
import com.advocatesOnline.daoImpl.UserDaoImpl;


/**
 *<pre>
 * Author           : Sanjeev Kulkarni
 * Project          : AdvocatesOnline
 * Package          : com.advocatesOnline.dao
 * File             : DaoFactory.java
 * Created On       : 16-May-2013 2:49:10 PM
 *
 *
 *<b>Revision History</b>
 *-------------------------------------------------------------------------------------------------------------------------------------------------
 *<b> Sl No.  | Changed By                    | Date & Time          		| Remarks                                                                     
 *-------------------------------------------------------------------------------------------------------------------------------------------------
 *     1      | Sanjeev Kulkarni              | 16-May-2013 2:49:10 PM      | Initial Version
 *</pre>
 */

public class DaoFactory {

	public static RegistrationDao getRegistrationDao() {
		RegistrationDao registrationDao = new RegistrationDaoImpl();
        return registrationDao;
    }
	
	public static LoginDao getLoginDao(){
		LoginDao loginDao = new LoginDaoImpl();
		return loginDao;
	}
	
	public static CaseDao getCaseDao(){
		CaseDao caseDao = new CaseDaoImpl();
		return caseDao;
	}
	
	public static UserDao getUserDao(){
		UserDao userDao = new UserDaoImpl();
		return userDao;
	}
}
