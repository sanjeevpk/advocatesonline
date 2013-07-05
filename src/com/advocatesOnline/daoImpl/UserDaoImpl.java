/**
 * Copyright 2013. All rights reserved by AdvocatesOnline. 
 * Do not copy or try to reproduce the source file.
 * Please write to admin@advocatesonline.com for any communications.
 */

package com.advocatesOnline.daoImpl;

import java.util.Date;

import javax.persistence.Query;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.log4j.Logger;

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
	Logger logger = Logger.getLogger(UserDaoImpl.class);
	String className = UserDaoImpl.class.getName();
	
	/* (non-Javadoc)
	 * @see com.advocatesOnline.dao.UserDao#changeUserPassword(java.lang.String, java.lang.String, java.lang.String)
	 */
	@Override
	public boolean changeUserPassword(String userId, String oldPassword, String newPassword, String confirmNewPassword) {
		String methodName = " :: changeUserPassword() ";
		logger.info(className + methodName + "enter");
		
		boolean changed = false;
		try {
			em.getTransaction().begin();
			Query query = em.createQuery("select x from User x where x.id = ?1 and x.password = ?2");
			query.setParameter(1, userId != "0" ? Integer.parseInt(userId) : 0);
			query.setParameter(2, DigestUtils.md5Hex(oldPassword));
			if(query.getResultList().size() > 0){
				
				Query query1 = em.createQuery("update User x set x.password =?1, x.updatedBy = ?2, x.updatedOn = ?3, x.updatedTime = ?4 where x.id = ?5 ");
				query1.setParameter(1,DigestUtils.md5Hex(newPassword));
				query1.setParameter(2, userId != "0" ? Integer.parseInt(userId) : 0);
				query1.setParameter(3, new Date());
				query1.setParameter(4, new Date());
				query1.setParameter(5, userId != "0" ? Integer.parseInt(userId) : 0);
				
				int update = query1.executeUpdate();
				System.out.println("executed?? "+update);
				if(update > 0)
					{
					em.getTransaction().commit();
					changed = true;
					}
			}else{
				changed = false;
			}			
			
		} catch (Exception e) {
			changed = false;
			e.printStackTrace();
			logger.info(className + methodName + "Exception ", e);
		}
		logger.info(className + methodName + "leave");
		return changed;
	}

	/* (non-Javadoc)
	 * @see com.advocatesOnline.dao.UserDao#viewUserProfile(java.lang.String)
	 */
	@Override
	public User viewUserProfile(int userId) {
		String methodName = " : viewUserProfile() :: ";
		logger.info(className + methodName + "enter");
		Query query = null;
		
		try{
			query = em.createQuery("select x from User x where x.id = ?1");
			query.setParameter(1, userId);
			
		}catch(Exception e){
			e.printStackTrace();
			logger.info(className + methodName + "Exception :: ", e);
		}	
		
		logger.info(className + methodName + "leave");
		
		return (User)query.getSingleResult();
	}

	/* (non-Javadoc)
	 * @see com.advocatesOnline.dao.UserDao#logoutUser(com.advocatesOnline.entity.User)
	 */
	@Override
	public void logoutUser(User user) {
		String methodName = " :: logoutUser() ";
		logger.info(className + methodName + "enter");
		Query query = null;
		
		try{
			em.getTransaction().begin();
			query = em.createQuery("update User x set x.loggedIn = ?1, x.lastLogonDate = ?2, x.lastLogonTime = ?3" +
					" where x.id = ?4");
			query.setParameter(1, false);
			query.setParameter(2, new Date());
			query.setParameter(3, new Date());
			query.setParameter(4, user.getId());
			
			int updated = query.executeUpdate();
			if(updated > 0){
				em.getTransaction().commit();
			}
		}catch(Exception e){
			e.printStackTrace();
			logger.info(className + methodName + "Exception ", e);
		}
		
		logger.info(className + methodName + "leave");
	}
}
