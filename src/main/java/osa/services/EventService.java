package osa.services;

import java.util.List;

import osa.DAO.EventDao;
import osa.entity.EventEntity;

public class EventService {

	EventDao ed=new EventDao();
	public boolean checkIfAlreadyExists(long id) {
		// TODO Auto-generated method stub
		return ed.checkEvent(id);
	}
	public void createEvent(long id, String name, String date, String month, String startTime, String endTime,
			String location, String description, String society, String imagekey) {
		EventEntity ee = new EventEntity(id, name, date, month, startTime, endTime, location, description, society,imagekey);
		ed.create(ee);
		
	}
	public List<EventEntity> getAllEvents() {
		// TODO Auto-generated method stub
		return ed.getEvents();
	}

}
