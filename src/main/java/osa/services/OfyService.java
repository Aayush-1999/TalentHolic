package osa.services;

import com.googlecode.objectify.Objectify;
import com.googlecode.objectify.ObjectifyService;

import osa.entity.CommentEntity;
import osa.entity.EventEntity;
import osa.entity.LikeEntity;
import osa.entity.PostEntity;
import osa.entity.SocietyDetailsEntity;
import osa.entity.UserDetailsEntity;

public class OfyService {
	
	static
	{
		ObjectifyService.register(UserDetailsEntity.class);
		ObjectifyService.register(SocietyDetailsEntity.class);
		ObjectifyService.register(PostEntity.class);
		ObjectifyService.register(EventEntity.class);
		ObjectifyService.register(CommentEntity.class);
		ObjectifyService.register(LikeEntity.class);
	}
	
	public static Objectify ofy()
	{
		return ObjectifyService.ofy();
	}

}
