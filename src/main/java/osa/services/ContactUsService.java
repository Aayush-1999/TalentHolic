package osa.services;

import osa.DAO.ContactUsDao;
import osa.entity.ContactUsEntity;

public class ContactUsService {

	public void store(String name, String email, String phone, String subject, String mssg) {
		ContactUsDao cud=new ContactUsDao();
		ContactUsEntity cue=new ContactUsEntity(name,email,phone,subject,mssg);
		cud.save(cue);
		
	}

}
