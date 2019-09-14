package osa.services;
import osa.DAO.SettingsDao;

public class SettingsService {

	SettingsDao sd=new SettingsDao();
	//FOR USER SETTINGS UPDATE
	public void changepassword(String email, String newpass) {
         sd.changepassword(email,newpass);		 
		
	}

	public void changeinfo(String email, String branch, String year,String bio) {
		sd.changeinfo(email,branch,year,bio);
		
	}
	//FOR SOCIETY SETTINGS UPDATE
	public void updateinfo(String email,String headname, String number, String bio){
		sd.updateinfo(email,headname,number,bio);
	}

	public void updatepassword(String email, String newpass) {
		sd.updatepassword(email,newpass);
		
	}

}
