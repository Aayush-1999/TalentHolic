package osa.entity;

import java.io.Serializable;

import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.annotation.Id;
import com.googlecode.objectify.annotation.Index;
@Entity
public class SocietyDetailsEntity implements Serializable{
	private static final long serialVersionUID = 1L;
	
	public String name;
	public String head;
	@Id public String email;
	public String password;
	public String phone;
	public String college;
	@Index public String  category;
	public String bio;
	public String profilekey;
	public String coverkey;
	
	public SocietyDetailsEntity(String name, String head, String email, String password,
			String phone, String college, String category) {
		super();
		this.name = name;
		this.head = head;
		this.email = email;
		this.password = password;
		this.phone = phone;
		this.college = college;
		this.category = category;
		this.bio="bio";
	}
	public SocietyDetailsEntity() {
		super();
	}
	
	

}
