/**
 * Copyright 2013. All rights reserved by AdvocatesOnline. 
 * Do not copy or try to reproduce the source file.
 * Please write to admin@advocatesonline.com for any communications.
 */

package com.advocatesOnline.serviceImpl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.advocatesOnline.dao.DaoFactory;
import com.advocatesOnline.entity.Case;
import com.advocatesOnline.service.CaseService;

/**
 *<pre>
 * Author           : Sanjeev Kulkarni
 * Project          : AdvocatesOnline
 * Package          : com.advocatesOnline.serviceImpl
 * File             : CaseServiceImpl.java
 * Created On       : 29-May-2013 7:58:14 PM
 *
 *
 *<b>Revision History</b>
 *-------------------------------------------------------------------------------------------------------------------------------------------------
 *<b> Sl No.  | Changed By                    | Date & Time          | Remarks                                                                     
 *-------------------------------------------------------------------------------------------------------------------------------------------------
 *     1      | Sanjeev Kulkarni              | 29-May-2013 7:58:14 PM      | Initial Version
 *</pre>
 */

@Service
public class CaseServiceImpl implements CaseService{

	/* (non-Javadoc)
	 * @see com.advocatesOnline.service.CaseService#saveCase(com.advocatesOnline.entity.Case)
	 */
	@Override
	public Case saveCase(Case userCase) {
		Case caseResult = DaoFactory.getCaseDao().saveCase(userCase);
		if(caseResult != null)
			return caseResult;
		else
			return null;
	}

	/* (non-Javadoc)
	 * @see com.advocatesOnline.service.CaseService#getViewAllCases()
	 */
	@Override
	public List<Case> getViewAllCases(String userId) {
		List<Case> caseList = DaoFactory.getCaseDao().getAllCases(userId);
		if(caseList != null && caseList.size() > 0)
			return caseList;
		else
			return null;
	}

	/* (non-Javadoc)
	 * @see com.advocatesOnline.service.CaseService#getCase(java.lang.String)
	 */
	@Override
	public Case getCase(String caseId) {
		Case caseDetails = DaoFactory.getCaseDao().getCase(caseId);
		return caseDetails;
	}

	/* (non-Javadoc)
	 * @see com.advocatesOnline.service.CaseService#updateCase(java.lang.String)
	 */
	@Override
	public Case updateCase(Case caseDetails) {
		Case case1 = DaoFactory.getCaseDao().updateCase(caseDetails);
		return case1;
	}

	/* (non-Javadoc)
	 * @see com.advocatesOnline.service.CaseService#deleteCase(int)
	 */
	@Override
	public boolean deleteCase(int caseIdInt) {
		boolean deleted = DaoFactory.getCaseDao().deleteCase(caseIdInt);
		return deleted;
	}

}
