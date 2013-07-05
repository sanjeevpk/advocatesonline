/**
 * Copyright 2013. All rights reserved by AdvocatesOnline. 
 * Do not copy or try to reproduce the source file.
 * Please write to admin@advocatesonline.com for any communications.
 */

package com.advocatesOnline.daoImpl;

import java.util.List;

import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import com.advocatesOnline.dao.CaseDao;
import com.advocatesOnline.entity.Case;

/**
 *<pre>
 * Author           : Sanjeev Kulkarni
 * Project          : AdvocatesOnline
 * Package          : com.advocatesOnline.daoImpl
 * File             : CaseDaoImpl.java
 * Created On       : 29-May-2013 7:59:47 PM
 *
 *
 *<b>Revision History</b>
 *-------------------------------------------------------------------------------------------------------------------------------------------------
 *<b> Sl No.  | Changed By                    | Date & Time          		| Remarks                                                                     
 *-------------------------------------------------------------------------------------------------------------------------------------------------
 *     1      | Sanjeev Kulkarni              | 29-May-2013 7:59:47 PM      | Initial Version
 *</pre>
 */

@Repository("CaseDao")
public class CaseDaoImpl extends AbstractDaoImpl implements CaseDao{

	/* (non-Javadoc)
	 * @see com.advocatesOnline.dao.CaseDao#saveCase(com.advocatesOnline.entity.Case)
	 */
	@Override
	public Case saveCase(Case userCase) {
		try{
			em.getTransaction().begin();
			em.persist(userCase);
			em.flush();			
			em.getTransaction().commit();
		
		}catch(Exception e){
			
		}
		return userCase;
	}

	/* (non-Javadoc)
	 * @see com.advocatesOnline.dao.CaseDao#getAllCases()
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<Case> getAllCases(String userId) {
		Query query = null;
		
		try{
			query = em.createQuery("select x from Case x where x.createdBy = ?1");		
			query.setParameter(1, userId);
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return query.getResultList();
	}

	/* (non-Javadoc)
	 * @see com.advocatesOnline.dao.CaseDao#getCase(java.lang.String)
	 */
	@Override
	public Case getCase(String caseId) {
		Query query = null;
		
		try{
			query = em.createQuery("select x from Case x where x.id = ?1");
			query.setParameter(1, Integer.parseInt(caseId));
			
		}catch(Exception e){
			e.printStackTrace();
			System.out.println(e);
		}
		return (Case)query.getSingleResult();
	}

	/* (non-Javadoc)
	 * @see com.advocatesOnline.dao.CaseDao#updateCase(java.lang.String)
	 */
	@Override
	public Case updateCase(Case caseDetails) {
		try{
			em.getTransaction().begin();
			em.merge(caseDetails);
			em.getTransaction().commit();
			caseDetails = getCase(String.valueOf(caseDetails.getId()));
			System.out.println("Updated-->>" +caseDetails.getTitle());
		}catch(Exception e){
			e.printStackTrace();
			System.out.println(e);
		}
		return caseDetails;
	}

	/* (non-Javadoc)
	 * @see com.advocatesOnline.dao.CaseDao#deleteCase(int)
	 */
	@SuppressWarnings("unused")
	@Override
	public boolean deleteCase(int caseIdInt) {
		boolean deleted = false;
		try{
			Case caseDetails = em.find(Case.class, caseIdInt);
			em.getTransaction().begin();
	        em.remove(caseDetails);
	        em.getTransaction().commit();
	        deleted = true;
		}catch(Exception e){
			deleted = false;
			e.printStackTrace();
			System.out.println(e);
		}
		return deleted;
	}
}
