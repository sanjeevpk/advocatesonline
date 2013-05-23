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

import com.advocatesOnline.dao.RegistrationDao;
import com.advocatesOnline.entity.Address;
import com.advocatesOnline.entity.User;


/**
 *<pre>
 * Author           : Sanjeev Kulkarni
 * Project          : AdvocatesOnline
 * Package          : com.advocatesOnline.daoImpl
 * File             : RegistrationDaoImpl.java
 * Created On       : 16-May-2013 1:04:01 PM
 *
 *
 *<b>Revision History</b>
 *-------------------------------------------------------------------------------------------------------------------------------------------------
 *<b> Sl No.  | Changed By                    | Date & Time          | Remarks                                                                     
 *-------------------------------------------------------------------------------------------------------------------------------------------------
 *     1      | Sanjeev Kulkarni              | 16-May-2013 1:04:01 PM      | Initial Version
 *</pre>
 */

@Repository("RegistrationDao")
public class RegistrationDaoImpl extends AbstractDaoImpl implements RegistrationDao{

	/* (non-Javadoc)
	 * @see com.advocatesOnline.dao.RegistrationDao#saveNewRegistration(com.advocatesOnline.entity.User)
	 */
	@Override
	public boolean saveNewRegistration(User user) {
		
		
		try{
			em.getTransaction().begin();
			List<Address> addressList = new ArrayList<>();
			Address address = new Address();
			address.setAddressLine1("#92/10, 7th B Cross,");
			address.setAddressLine2("Jakkur Layout, Jakkur Post");
			address.setCity("Bangalore");
			address.setState("Karnataka");
			address.setCountry("India");
			address.setPincode("560064");
			address.setLandmark("Nera B G National Public School");
			addressList.add(address);
			
			Address address2 = new Address();
			address2.setAddressLine1("Plot No 9 & 10,");
			address2.setAddressLine2("Timber yard, Unkal Cross");
			address2.setCity("Hubli");
			address2.setState("Karnataka");
			address2.setCountry("India");
			address2.setPincode("580031");
			address2.setLandmark("Unkal Railway Station");
			addressList.add(address2);
			
			address.setUser(user);
			address2.setUser(user);
			
			user.setAddress(addressList);
			em.persist(address);
			em.getTransaction().commit();
			return true;
		}catch(Exception e){
			e.printStackTrace();
			System.out.println(e.toString());
			return false;
		}
	}

	/* (non-Javadoc)
	 * @see com.advocatesOnline.dao.RegistrationDao#checkEmailUniqness(com.advocatesOnline.entity.User)
	 */
	@Override
	public boolean checkEmailUniqness(User user) {
		boolean valid = false;
		try{
			
			Query query = em.createQuery("select x from User x WHERE x.email =?1 ");
			query.setParameter(1, user.getEmail());
			if(query.getResultList().size() > 0){
				valid = true;
			}else{
				valid = false;
			}
			
		}catch(Exception e){
			e.printStackTrace();
			System.out.println(e);
		}
		System.out.println(valid);
		return valid;
	}
	
}
