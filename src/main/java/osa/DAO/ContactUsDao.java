package osa.DAO;

import static osa.services.OfyService.ofy;

import osa.entity.ContactUsEntity;

public class ContactUsDao {

	public void save(ContactUsEntity ce) {
		ofy().save().entity(ce).now();
		
	}

}
