package osa.services;

import osa.DAO.ResetPassDao;

public class ResetPassService {

	ResetPassDao rpd=new ResetPassDao();

	public boolean validate(String email) {
		return rpd.validate(email); 
	}

	public boolean check(String id)
	{
		
		if(rpd.check(id))
		
			return true;
		
		else
			return false;
		
	}

	public void reset(String email, String newpass) {
		rpd.reset(email,newpass);
		
	}
	
}
			
	

