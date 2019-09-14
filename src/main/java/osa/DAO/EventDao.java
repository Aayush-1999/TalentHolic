package osa.DAO;

import osa.entity.EventEntity;
import static osa.services.OfyService.ofy;

import java.util.List;
public class EventDao {

	public boolean checkEvent(long id) {
		// TODO Auto-generated method stub
		EventEntity ee=ofy().load().type(EventEntity.class).id(id).now();
		
		if(ee!=null)
			return true;
		else
			return false;
	}

	public void create(EventEntity ee) {
		
		ofy().save().entity(ee).now();
		
	}

	public List<EventEntity> getEvents() {
		
		return ofy().load().type(EventEntity.class).list();
	}

}
