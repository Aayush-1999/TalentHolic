package osa.controller;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import osa.entity.SocietyDetailsEntity;
import osa.services.SendMail;
import osa.services.SettingsService;
import osa.services.SocietyDetailsService;
import osa.services.UserDetailsService;

public class SocietySettingsController extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		HttpSession session=request.getSession();
		
		SocietyDetailsEntity sde =(SocietyDetailsEntity)session.getAttribute("societydetails");
		SettingsService uss = new SettingsService();
        
        	String type=request.getParameter("type");
            if(type.equals("password"))
            {
            	String oldpass=request.getParameter("old-password");
            	String newpass=request.getParameter("password");
            	String confirmpass=request.getParameter("confirm-password");
            	
            	if((oldpass.equals(sde.password)) && (newpass.equals(confirmpass)) )
            	{
            		uss.updatepassword(sde.email,newpass);
            		SocietyDetailsService sds=new SocietyDetailsService();    		
            		 session.setAttribute("societydetails", sds.getUser(sde.email,sde.password));
            		 session.setAttribute("match","done");
            		 String toaddress = sde.email;
          			SendMail mail = new SendMail();
          			mail.send(toaddress , "Welcome to TalentHolic" , "Dear "+sde.name+"\n Your password has been changed successfully.\n\n With Regards, TalentHolic Team");
            		response.sendRedirect("societysettings.jsp");
            	}
            	
            	else if(!(oldpass.equals(sde.password)))
            	{
            		session.setAttribute("match","notdone");
            		response.sendRedirect("societysettings.jsp");
            	}
            	
            	else
            	{
            		session.setAttribute("match","notdone");
            		response.sendRedirect("societysettings.jsp");
            	}
            }
            
            
            else
            {     
        	      String headname=request.getParameter("sochead");
        	      String number=request.getParameter("phnumber");
        	      String bio=request.getParameter("bio");

        	      if(headname==null)
      	       		headname=sde.head;
      	       	if(number==null)
      	       		number=sde.phone;
      	       	if(bio==null)
      	       		bio=sde.bio;
        	      
                   uss.updateinfo(sde.email,headname,number,bio);
                   SocietyDetailsService sds=new SocietyDetailsService();
                   session.setAttribute("societydetails", sds.getUser(sde.email,sde.password));
                   response.sendRedirect("society.jsp");
                   
                    	
            }         	
        
       	
	}

}
