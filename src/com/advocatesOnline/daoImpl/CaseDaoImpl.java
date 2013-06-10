/**
 * Copyright 2013. All rights reserved by AdvocatesOnline. 
 * Do not copy or try to reproduce the source file.
 * Please write to admin@advocatesonline.com for any communications.
 */

package com.advocatesOnline.daoImpl;

import java.util.ArrayList;
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
		List<Case> caseList = new ArrayList<>();
		try{
			
			Query query = em.createQuery("select x from Case x where x.createdBy = ?1");
			query.setParameter(1, userId);
			caseList = query.getResultList();
			if(caseList != null && caseList.size() > 0){
				return caseList;
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}

}
