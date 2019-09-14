package osa.entity;

import java.io.Serializable;

import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.annotation.Id;

@Entity
public class EventEntity implements Serializable{

	@Id
	public long id;
	public String name;
	public String date;
	public String month;
	public String startTime;
	public String endTime;
	public String location;
	public String description;
	public String society;
	public String imagekey;
	public EventEntity() {
		super();
	}
	public EventEntity(long id, String name, String date, String month, String startTime, String endTime,
			String location, String description, String society,String imagekey) {
		super();
		this.id = id;
		this.name = name;
		this.date = date;
		this.month = month;
		this.startTime = startTime;
		this.endTime = endTime;
		this.location = location;
		this.description = description;
		this.society = society;
		this.imagekey=imagekey;
	}
	
	
}
