package osa.DAO;

import osa.entity.PostEntity;
import static osa.services.OfyService.ofy;

import java.util.List;

public class PostDao {

	
	public boolean checkIfExist(long id) {
		
		PostEntity pe=ofy().load().type(PostEntity.class).id(id).now();
		
		if(pe!=null)
			return true;
		else
			return false;
	}

	public void uploadPost(PostEntity pe) {

		ofy().save().entity(pe).now();
		
	}
	
	public List<PostEntity> list()
	{
		return ofy().load().type(PostEntity.class).list();
	}

	public void deletePost(String id) {
		
		long in=Long.parseLong(id);
		ofy().delete().type(PostEntity.class).id(in);
	}
}
