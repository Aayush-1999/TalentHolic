package osa.services;

import osa.DAO.UserDetailsDao;
import osa.entity.UserDetailsEntity;

public class UserDetailsService {
	
	UserDetailsDao ud=new UserDetailsDao();

	public boolean checkIfUserAlreadyExists(String email) {
		return ud.checkUserExits(email);
	}

	public void registerUser(String name, String email, String password, String phone, String gender,
			String college, String course, String branch, String year, String dob) {
		UserDetailsEntity ude = new UserDetailsEntity(name,email, password,  phone,  gender,
				 college,  course,  branch,  year,  dob);
		ud.registerUser(ude);
		
	}

	public boolean validate(String email, String pass) {
		
		return ud.validate(email,pass);
	}

	public UserDetailsEntity getUser(String email, String pass) {
		
		return ud.getUser(email);
	}

	public void updateUser(UserDetailsEntity ude) {
		
		ud.update(ude);
		
	}

	public void setImageKey(String keyString,String email) {
		ud.setKey(keyString,email);
		
	}

}
