package osa.DAO;

import osa.entity.LikeEntity;
import static osa.services.OfyService.ofy;

import java.util.List;

public class LikeDao {

	public void newPost(LikeEntity le) {
		ofy().save().entity(le).now();
	}

	public void like(String id) {
		
		LikeEntity le=ofy().load().type(LikeEntity.class).id(id).now();
		
		le.like+=1;
		ofy().save().entity(le).now();
		
	}

	public List<LikeEntity> getLikes() {
		// TODO Auto-generated method stub
		return ofy().load().type(LikeEntity.class).list();
	}

	public void dislike(String id) {
		// TODO Auto-generated method stub
		LikeEntity le=ofy().load().type(LikeEntity.class).id(id).now();
		
		le.dislike+=1;
		ofy().save().entity(le).now();
		
	}
	public void deleteLike(String id) {
		// TODO Auto-generated method stub
		ofy().delete().type(LikeEntity.class).id(id);
	}


}
