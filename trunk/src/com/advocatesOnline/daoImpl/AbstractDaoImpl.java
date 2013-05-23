/**
 * Copyright 2013. All rights reserved by AdvocatesOnline. 
 * Do not copy or try to reproduce the source file.
 * Please write to admin@advocatesonline.com for any communications.
 */
package com.advocatesOnline.daoImpl;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

/**
 *<pre>
 * Author           : Sanjeev Kulkarni
 * Project          : AdvocatesOnline
 * Package          : com.advocatesOnline.serviceImpl
 * File             : AbstractDaoImpl.java
 * Created On       : 16-May-2013 2:52:44 PM
 *
 *
 *<b>Revision History</b>
 *-------------------------------------------------------------------------------------------------------------------------------------------------
 *<b> Sl No.  | Changed By                    | Date & Time          | Remarks                                                                     
 *-------------------------------------------------------------------------------------------------------------------------------------------------
 *     1      | Sanjeev Kulkarni              | 16-May-2013 2:52:44 PM      | Initial Version
 *</pre>
 */

public class AbstractDaoImpl {
	EntityManagerFactory emf;
	EntityManager em;
	
	public AbstractDaoImpl(){
		try{
			emf = Persistence.createEntityManagerFactory("AdvocatesOnline");
			em = emf.createEntityManager();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			//em.close();
			//emf.close(); 
		}
	}
}
