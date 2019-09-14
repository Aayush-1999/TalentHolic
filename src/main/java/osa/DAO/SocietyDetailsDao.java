package osa.DAO;

import static osa.services.OfyService.ofy;

import java.util.List;

import osa.entity.SocietyDetailsEntity;
public class SocietyDetailsDao {

	public boolean checkSociety(String email) {
		
		SocietyDetailsEntity sd= ofy().load().type(SocietyDetailsEntity.class).id(email).now();
		
		if(sd==null)
		{
			return false;
		}
		else
		{
			return true;
		}

		
	}

	public void createSociety(SocietyDetailsEntity sde) {
		ofy().save().entity(sde).now();
	}

	public boolean validate(String email, String pass) {

			SocietyDetailsEntity sde=ofy().load().type(SocietyDetailsEntity.class).id(email).now();
			
			
			if(sde==null)
				return false;
			if(sde.password.equals(pass))
				return true;
			else
				return false;
	}

	public SocietyDetailsEntity societyDetails(String email) {
		
		return ofy().load().type(SocietyDetailsEntity.class).id(email).now();
	}

	public List<SocietyDetailsEntity> getList() {
		// TODO Auto-generated method stub
		return ofy().load().type(SocietyDetailsEntity.class).list();
	}

	public void setkey(String keyString, String email) {
		SocietyDetailsEntity sde=ofy().load().type(SocietyDetailsEntity.class).id(email).now();
		
		sde.profilekey=keyString;
		ofy().save().entities(sde).now();
		
	}

	public void setCoverkey(String keyString, String email) {
		SocietyDetailsEntity sde=ofy().load().type(SocietyDetailsEntity.class).id(email).now();
		sde.coverkey=keyString;
		ofy().save().entity(sde).now();
	}

}
