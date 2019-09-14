package osa.entity;

import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.annotation.Id;
import com.googlecode.objectify.annotation.Index;

@Entity
public class LikeEntity {

	
	@Id public String id;
	@Index public long like;
	public long dislike;
	
	
	
	public LikeEntity() {
		super();
	}
	



	public LikeEntity(String id) {
		super();
		this.id = id;
		like=0;
		dislike=0;
	}
	
	
	
}
