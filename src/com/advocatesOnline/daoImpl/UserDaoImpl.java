/**
 * Copyright 2013. All rights reserved by AdvocatesOnline. 
 * Do not copy or try to reproduce the source file.
 * Please write to admin@advocatesonline.com for any communications.
 */
package com.advocatesOnline.daoImpl;

import javax.persistence.Query;

import org.apache.commons.codec.digest.DigestUtils;

import com.advocatesOnline.dao.UserDao;
import com.advocatesOnline.entity.User;

/**
 *<pre>
 * Author           : Sanjeev Kulkarni
 * Project          : AdvocatesOnline
 * Package          : com.advocatesOnline.dao
 * File             : UserDaoImpl.java
 * Created On       : 01-Jun-2013 8:00:45 PM
 *
 *
 *<b>Revision History</b>
 *-------------------------------------------------------------------------------------------------------------------------------------------------
 *<b> Sl No.  | Changed By                    | Date & Time          		| Remarks                                                                     
 *-------------------------------------------------------------------------------------------------------------------------------------------------
 *     1      | Sanjeev Kulkarni              | 01-Jun-2013 8:00:45 PM      | Initial Version
 *</pre>
 */

public class UserDaoImpl extends AbstractDaoImpl implements UserDao {

	/* (non-Javadoc)
	 * @see com.advocatesOnline.dao.UserDao#changeUserPassword(java.lang.String, java.lang.String, java.lang.String)
	 */
	@Override
	public boolean changeUserPassword(String userId, String oldPassword, String newPassword, String confirmNewPassword) {
		boolean changed = false;
		/*try {
			User user = em.find(User.class, 351);
			System.out.println(user.getId());
			user.setPassword(DigestUtils.md5Hex(newPassword));
			em.getTransaction().begin();
			if(user.getId() != 0){
				em.merge(user);
			}else{
				em.persist(user);
			}
			em.getTransaction().commit();
			changed =true;
		} catch (Exception e) {
			changed = false;
			e.printStackTrace();
		}*/
		try {
			em.getTransaction().begin();
			System.out.println("old password ="+oldPassword);
			System.out.println("new password = "+newPassword);
			Query query = em.createQuery("update User x set x.password =?1 where x.id = ?2 ");//and x.password = ?3
			query.setParameter(1,DigestUtils.md5Hex(newPassword));
			query.setParameter(2, 351);
			//query.setParameter(3, oldPassword);
			int update = query.executeUpdate();
			System.out.println("executed?? "+update);
			if(update > 0)
				{
				em.getTransaction().commit();
				changed = true;
				}
			
		} catch (NumberFormatException e) {
			changed = false;
			e.printStackTrace();
		}
		return changed;
	}
}
