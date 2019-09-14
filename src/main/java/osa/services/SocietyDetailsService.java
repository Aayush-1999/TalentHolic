package osa.services;

import java.util.List;

import osa.DAO.SocietyDetailsDao;
import osa.entity.SocietyDetailsEntity;

public class SocietyDetailsService {

	SocietyDetailsDao sd = new SocietyDetailsDao();
	public boolean checkIfUserExists(String email) {
		
		return sd.checkSociety(email);
	
	}
	public void registerSociety(String name, String head, String email, String password, String phone, String college, String category) {
		SocietyDetailsEntity sde=new SocietyDetailsEntity(name, head, email, password, phone, college,category);
		
		sd.createSociety(sde);
		
	}
	public boolean validate(String email, String pass) {
		
		return sd.validate(email,pass);
	}
	public SocietyDetailsEntity getUser(String email, String pass) {
		
		return sd.societyDetails(email);
	}
	public List<SocietyDetailsEntity> getSocietyList() {
		// TODO Auto-generated method stub
		return sd.getList();
	}
	public void setImageKey(String keyString, String email) {
		sd.setkey(keyString,email);
		
	}
	public void setCoverKey(String keyString, String email) {
		sd.setCoverkey(keyString,email);
		
	}

}
