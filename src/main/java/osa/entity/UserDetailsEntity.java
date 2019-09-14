package osa.entity;

import java.io.Serializable;

import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.annotation.Id;
import com.googlecode.objectify.annotation.Index;

@Entity
public class UserDetailsEntity implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	@Index public String name;
	@Id public String email;
	public String password;
	public String phone;
	public String gender;
	public String college;
	public String course;
	public String branch;
	public String year;
	public String dob;
	public String bio;
	public String imagekey;
	public String id=null;
	public int auth;
	
	
	public UserDetailsEntity() {
		super();
	}
	
	public UserDetailsEntity(String name, String email, String password, String phone, String gender,
			String college, String course, String branch, String year, String dob) {
		super();
		this.name = name;
		this.email = email;
		this.password = password;
		this.phone = phone;
		this.gender = gender;
		this.college = college;
		this.course = course;
		this.branch = branch;
		this.year = year;
		this.dob = dob;
		this.bio="bio";
	}

}
