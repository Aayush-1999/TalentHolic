package osa.entity;

import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.annotation.Id;
import com.googlecode.objectify.annotation.Index;

@Entity
public class ContactUsEntity {
@Index String name;
@Id String email;
String phone;
String subject;
String mssg;

public ContactUsEntity()
{
	super();
}
public ContactUsEntity(String name,String email,String phone,String subject,String mssg)
{
	super();
	this.name=name;
	this.email=email;
	this.phone=phone;
	this.subject=subject;
	this.mssg=mssg;
}

}
