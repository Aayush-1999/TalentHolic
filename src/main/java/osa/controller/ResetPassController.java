package osa.controller;

import static osa.services.OfyService.ofy;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import osa.services.UserDetailsService;
import osa.entity.UserDetailsEntity;
import osa.services.ResetPassService;
import osa.services.SendMail;

public class ResetPassController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		ResetPassService rps=new ResetPassService();
		String email=request.getParameter("resetpass-email");
		
		HttpSession s=request.getSession();
		
		if(rps.validate(email))
		{
			System.out.println("user's email id exists");
			
			
		 //generating random string
			
			String id;
		    final String alpha_num_string="ABCEDFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";	 
			StringBuilder builder=new StringBuilder();
			int count=24;
			while(count--!=0)
			  {
			    int character=(int)(Math.random()*alpha_num_string.length());
		   	    builder.append(alpha_num_string.charAt(character));
			  }
			id=builder.toString();
	        
			UserDetailsEntity ude = ofy().load().type(UserDetailsEntity.class).id(email).now();
			String name=ude.name;
			
			ude.id=id;
			ofy().save().entity(ude).now();
			
			
			//send mail statement
		    String toaddress = email;
			SendMail mail = new SendMail();
			mail.send(toaddress , "RESET NEW PASSWORD" , "Dear "+name +"\nThe link to generate a new password is https:\\talent-holic-th.appspot.com/resetpassword?id="+id+"");
 		 
			s.setAttribute("checkid","true" );
		    response.sendRedirect("resetpass.jsp");
		}
		else
		{
			s.setAttribute("checkid", "false");
			response.sendRedirect("resetpass.jsp");
			
		}
	
	}

}
