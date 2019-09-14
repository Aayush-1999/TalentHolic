package osa.DAO;

import static osa.services.OfyService.ofy;

import osa.entity.SocietyDetailsEntity;
import osa.entity.UserDetailsEntity;

public class SettingsDao {
    
	UserDetailsEntity ude=new UserDetailsEntity();
	SocietyDetailsEntity sde=new SocietyDetailsEntity();
	
	//FOR USER SETTINGS UPDATE
	public void changepassword(String email, String newpass) {
		ude=ofy().load().type(UserDetailsEntity.class).id(email).now();
		ude.password=newpass;
		ofy().save().entity(ude).now();
		
	}

	public void changeinfo(String email, String branch, String year,String bio) {
		ude=ofy().load().type(UserDetailsEntity.class).id(email).now();
		ude.bio=bio;
		ude.branch=branch;
		ude.year=year;
		ofy().save().entity(ude).now();
		
		
	}
    //FOR SOCIETY SETTINGS UPDATE
	public void updateinfo(String email, String headname, String number, String bio) {
	    sde=ofy().load().type(SocietyDetailsEntity.class).id(email).now();
	    sde.head=headname;
	    sde.phone=number;
	    sde.bio=bio;
	    ofy().save().entity(sde).now();
		
	}

	public void updatepassword(String email, String newpass) {
		sde=ofy().load().type(SocietyDetailsEntity.class).id(email).now();
		sde.password=newpass;
		ofy().save().entity(sde).now();
		
	}

}
