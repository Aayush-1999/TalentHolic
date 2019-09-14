package osa.DAO;

import osa.entity.UserDetailsEntity;
import static osa.services.OfyService.ofy;

public class UserDetailsDao {

	public boolean checkUserExits(String email) {
		
		
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

	public void registerUser(UserDetailsEntity ude) {
		ofy().save().entity(ude).now();
		
	}

	public boolean validate(String email, String pass) {
		
		UserDetailsEntity ude =ofy().load().type(UserDetailsEntity.class).id(email).now();
		
		if(ude==null)
			return false;
		else if(ude.password.equals(pass))
			return true;
		else
			return false;
	}

	public UserDetailsEntity getUser(String email) {
		
		return ofy().load().type(UserDetailsEntity.class).id(email).now();
	}

	public void update(UserDetailsEntity ude) {
		
		ofy().save().entity(ude).now();
		
	}

	public void setKey(String keyString,String email) {
		UserDetailsEntity ude=ofy().load().type(UserDetailsEntity.class).id(email).now();
		
		ude.imagekey=keyString;
		
		ofy().save().entity(ude).now();
		
	}

}
