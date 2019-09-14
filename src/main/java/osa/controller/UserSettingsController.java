package osa.controller;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import osa.services.SendMail;
import osa.services.SettingsService;
import osa.services.UserDetailsService;
import osa.entity.UserDetailsEntity;
public class UserSettingsController extends HttpServlet {


	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		HttpSession session=request.getSession();
		UserDetailsEntity ude =(UserDetailsEntity)session.getAttribute("userdetails");
		
        SettingsService uss = new SettingsService();
        String type=request.getParameter("type");
        if(type.equals("password"))
        {
        	String oldpass=request.getParameter("old-password");
        	String newpass=request.getParameter("password");
        	String confirmpass=request.getParameter("confirm-password");
        	
        	if((oldpass.equals(ude.password)) && (newpass.equals(confirmpass)) )
        	{
        		uss.changepassword(ude.email,newpass);
        		UserDetailsService uds=new UserDetailsService();
        		 session.setAttribute("userdetails", uds.getUser(ude.email,ude.password));
                 session.setAttribute("match","done");
                 String toaddress = ude.email;
     			SendMail mail = new SendMail();
     			mail.send(toaddress , "Welcome to TalentHolic" , "Dear "+ude.name+"\n Your password has been changed successfully.\n\n With Regards, TalentHolic Team");
        		 response.sendRedirect("settings.jsp");
        	}
        	
        	else if(!(oldpass.equals(ude.password)))
        	{
        		session.setAttribute("match","notdone");
        		response.sendRedirect("settings.jsp");
        	}
        	
        	else
        	{
        		session.setAttribute("match","notdone");
        		response.sendRedirect("settings.jsp");
        	}
        }
        
        
        else
        {      
               
    	       String branch=request.getParameter("register-form-branch");
    	       String year=request.getParameter("register-form-year");
    	       String bio=request.getParameter("bio");
        	  
    	       UserDetailsService uds=new UserDetailsService();
    	       	if(branch==null)
    	       		branch=ude.branch;
    	       	if(year==null)
    	       		year=ude.year;
    	       	if(bio==null)
    	       		bio=ude.bio;
           		
    	       uss.changeinfo(ude.email,branch,year,bio);
    	       session.setAttribute("userdetails", uds.getUser(ude.email,ude.password));
    	       response.sendRedirect("profile.jsp");
           		
           
           	
    	  
        }
	
	}

}
