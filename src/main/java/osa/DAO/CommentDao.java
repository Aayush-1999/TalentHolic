package osa.DAO;

import osa.entity.CommentEntity;
import static osa.services.OfyService.ofy;

import java.util.List;

public class CommentDao {

	public boolean checkComment(long uid) {
		
		CommentEntity ce=ofy().load().type(CommentEntity.class).id(uid).now();
				
		if(ce!=null)
			return true;
		else
			return false;
	}

	public void create(CommentEntity ce) {
		// TODO Auto-generated method stub
		ofy().save().entity(ce).now();
		
	}

	public List<CommentEntity> get() {
		// TODO Auto-generated method stub
		return ofy().load().type(CommentEntity.class).list();
	}

	public void deleteComments(String id) {
		// TODO Auto-generated method stub
		long t=1;
		CommentEntity ce=ofy().load().type(CommentEntity.class).id(t).now();
		while(ce!=null)
		{
			if(ce.postId.equals(id))
			{
				ofy().delete().type(CommentEntity.class).id(ce.uid).now();
			}
			t++;
			ce=ofy().load().type(CommentEntity.class).id(t).now();
		}
	}
}
