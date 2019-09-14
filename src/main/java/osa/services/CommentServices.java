package osa.services;

import java.util.List;

import osa.DAO.CommentDao;
import osa.entity.CommentEntity;

public class CommentServices {

	CommentDao cd=new CommentDao();
	public boolean checkIfAlreadyExists(long uid) {
		// TODO Auto-generated method stub
		return cd.checkComment(uid);
	}
	public void createComment(long uid, String postId, String name, String comment) {
		// TODO Auto-generated method stub
		CommentEntity ce = new CommentEntity(uid, postId, name, comment);
		cd.create(ce);
	}
	public List<CommentEntity> getComments() {
		// TODO Auto-generated method stub
		return cd.get();
	}

	public void deleteComments(String id) {
		// TODO Auto-generated method stub
		cd.deleteComments(id);
	}
}
