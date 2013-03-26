
package com.advocatesOnline.daoImpl;


import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

/**
@Author		: Sanjeev Kulkarni
@Created on	: 17-Oct-20122:45:13 PM
@Project	: SpringMVC-JPA-Service-DAO
@Package	: com.sanjeevkulkarni.daoImpl
@File		: AbstractDaoImpl.java
@Comments	: 

Revision History:
Sl No.	| Revision Date	| Changed By			| Reasons		
-----------------------------------------------------------------------------------------------

 **/



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

