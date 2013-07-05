/**
 * Copyright 2013. All rights reserved by AdvocatesOnline. 
 * Do not copy or try to reproduce the source file.
 * Please write to admin@advocatesonline.com for any communications.
 */

package com.advocatesOnline.service;

import java.util.List;

import com.advocatesOnline.entity.Case;

/**
 *<pre>
 * Author           : Sanjeev Kulkarni
 * Project          : AdvocatesOnline
 * Package          : com.advocatesOnline.service
 * File             : CaseService.java
 * Created On       : 29-May-2013 7:57:27 PM
 *
 *
 *<b>Revision History</b>
 *-------------------------------------------------------------------------------------------------------------------------------------------------
 *<b> Sl No.  | Changed By                    | Date & Time          		| Remarks                                                                     
 *-------------------------------------------------------------------------------------------------------------------------------------------------
 *     1      | Sanjeev Kulkarni              | 29-May-2013 7:57:27 PM      | Initial Version
 *</pre>
 */

public interface CaseService {

	/**
	 * @param userCase
	 * @return
	 */
	Case saveCase(Case userCase);

	/**
	 * @param userId 
	 * @return
	 */
	List<Case> getViewAllCases(String userId);

	/**
	 * @param caseId
	 * @return
	 */
	Case getCase(String caseId);

	/**
	 * @param userCase
	 * @return
	 */
	Case updateCase(Case userCase);

	/**
	 * @param caseIdInt
	 * @return
	 */
	boolean deleteCase(int caseIdInt);
	
}
