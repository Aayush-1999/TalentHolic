package osa.DAO;

import static osa.services.OfyService.ofy;

import java.util.List;

import osa.entity.UserDetailsEntity;

public class ResetPassDao {

	public boolean validate(String email) {
		UserDetailsEntity ude = ofy().load().type(UserDetailsEntity.class).id(email).now();
		if(ude==null)
		{
			return false;
		}
		else
		{
			return true;
		}
	}

	public boolean check(String id) {
		
		List<UserDetailsEntity>li=ofy().load().type(UserDetailsEntity.class).filter("id",id).list();
		if(li!=null)
			return true;
		else
			return false;
		
		}

	public void reset(String email, String newpass) {
		UserDetailsEntity ude = ofy().load().type(UserDetailsEntity.class).id(email).now();
		ude.password=newpass;
		ofy().save().entity(UserDetailsEntity.class).now();
	}





}
