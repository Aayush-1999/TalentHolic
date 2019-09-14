package osa.services;

import java.util.Collections;
import java.util.List;

import osa.DAO.LikeDao;
import osa.DAO.PostDao;
import osa.entity.LikeEntity;
import osa.entity.PostEntity;

public class PostService {
	
	PostDao pd=new PostDao();

	public boolean checkIfPostAlreadyExists(long id) {
		
		return pd.checkIfExist(id);
	}

	public void addPost(long id, String name, String type, String description, String category, String embed, String imagekey, String email) {
		
		PostEntity pe;
		if(type.equals("video"))
			pe=new PostEntity(id,name,type,description,category,embed,email);
		else if(type.equals("image"))
			pe=new PostEntity(id,name,type,description,category,embed,imagekey,email);
		else
			pe=new PostEntity(id,name,type,description,category,email);
		
		String pid = Long.toString(id);
		
		LikeEntity le=new LikeEntity(pid);
		
		LikeDao ld=new LikeDao();
		pd.uploadPost(pe);
		
		ld.newPost(le);
	}
	
	
	public List<PostEntity> list()
	{
		List<PostEntity> li=pd.list();
		Collections.reverse(li);
		return li;
	}

	public void deletePost(String id) {
		pd.deletePost(id);
	}

}
