package osa.entity;

import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.annotation.Id;
import com.googlecode.objectify.annotation.Index;

@Entity
public class PostEntity {

	@Id public long id;
	public String name;
	public String type;
	public String description;
	@Index public String category;
	public String embed;
	public String imgkey;
	public String email;
	public PostEntity() {
		super();
	}
	public PostEntity(long id,String name, String type, String description, String category,String email) {
		super();
		this.id=id;
		this.name = name;
		this.type = type;
		this.description = description;
		this.category = category;
		embed=null;
		this.email=email;
	}
	
	
	public PostEntity(long id,String name, String type, String description, String category, String embed,String email) {
		super();
		this.id=id;
		this.name = name;
		this.type = type;
		this.description = description;
		this.category = category;
		this.embed = embed;
		this.email=email;
	}
	public PostEntity(long id, String name, String type, String description, String category, String embed,
			String imgkey,String email) {
		super();
		this.id = id;
		this.name = name;
		this.type = type;
		this.description = description;
		this.category = category;
		this.embed = null;
		this.imgkey = imgkey;
		this.email=email;
	}
	
	
	
	
}
