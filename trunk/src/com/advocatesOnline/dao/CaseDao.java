/**
 * Copyright 2013. All rights reserved by AdvocatesOnline. 
 * Do not copy or try to reproduce the source file.
 * Please write to admin@advocatesonline.com for any communications.
 */
package com.advocatesOnline.dao;

import java.util.List;

import com.advocatesOnline.entity.Case;

/**
 *<pre>
 * Author           : Sanjeev Kulkarni
 * Project          : AdvocatesOnline
 * Package          : com.advocatesOnline.dao
 * File             : CaseDao.java
 * Created On       : 29-May-2013 7:59:30 PM
 *
 *
 *<b>Revision History</b>
 *-------------------------------------------------------------------------------------------------------------------------------------------------
 *<b> Sl No.  | Changed By                    | Date & Time          | Remarks                                                                     
 *-------------------------------------------------------------------------------------------------------------------------------------------------
 *     1      | Sanjeev Kulkarni              | 29-May-2013 7:59:30 PM      | Initial Version
 *</pre>
 */

public interface CaseDao {

	/**
	 * @param userCase 
	 * @return
	 */
	Case saveCase(Case userCase);

	/**
	 * @param userId 
	 * @return
	 */
	List<Case> getAllCases(String userId);

}
