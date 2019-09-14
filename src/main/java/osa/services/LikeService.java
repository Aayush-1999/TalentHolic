package osa.services;

import java.util.List;

import osa.DAO.LikeDao;
import osa.entity.LikeEntity;

public class LikeService {

	LikeDao ld= new LikeDao();
	public void like(String id) {
		// TODO Auto-generated method stub
		
		ld.like(id);
		
	}
	public List<LikeEntity> getLikes() {
		// TODO Auto-generated method stub
		return ld.getLikes();
	}
	public void dislike(String id) {
		// TODO Auto-generated method stub
		ld.dislike(id);
	}

	public void deleteLike(String id) {
		// TODO Auto-generated method stub
		ld.deleteLike(id);
	}

}
