/**
 * Copyright 2013. All rights reserved by AdvocatesOnline. 

 * Do not copy or try to reproduce the source file.
 * Please write to admin@advocatesonline.com for any communications.
 */

package com.advocatesOnline.daoImpl;

import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import com.advocatesOnline.dao.LoginDao;
import com.advocatesOnline.entity.User;

/**
 *<pre>
 * Author           : Sanjeev Kulkarni
 * Project          : AdvocatesOnline
 * Package          : com.advocatesOnline.daoImpl
 * File             : LoginDaoImpl.java
 * Created On       : 18-May-2013 9:41:32 PM
 *
 *
 *<b>Revision History</b>
 *-------------------------------------------------------------------------------------------------------------------------------------------------
 *<b> Sl No.  | Changed By                    | Date & Time          | Remarks                                                                     
 *-------------------------------------------------------------------------------------------------------------------------------------------------
 *     1      | Sanjeev Kulkarni              | 18-May-2013 9:41:32 PM      | Initial Version
 *</pre>
 */

@Repository("LoginDao")
public class LoginDaoImpl extends AbstractDaoImpl implements LoginDao{

	/* (non-Javadoc)
	 * @see com.advocatesOnline.dao.LoginDao#validateAndLogin(com.advocatesOnline.entity.User)
	 */
	@Override
	public boolean validateAndLogin(User user) {
		boolean valid = false;
		try{

			Query query = em.createQuery("select x from User x WHERE x.email =?1 AND x.password =?2 ");
			query.setParameter(1, user.getEmail());
			query.setParameter(2, user.getPassword());
			if(query.getResultList().size() > 0){
				valid = true;
			}else{
				valid = false;
			}		
			}catch(Exception e){
				e.printStackTrace();
				System.out.println(e.toString());
			}
		return valid;
	}
}
