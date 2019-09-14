package osa.entity;

import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.annotation.Id;
import com.googlecode.objectify.annotation.Index;

@Entity
public class CommentEntity {
	
	@Id public long uid;
	@Index public String postId;
	public String name;
	public String comment;
	public CommentEntity() {
		super();
	}
	public CommentEntity(long uid, String postId, String name, String comment) {
		super();
		this.uid = uid;
		this.postId = postId;
		this.name = name;
		this.comment = comment;
	}
	
	
	

}
