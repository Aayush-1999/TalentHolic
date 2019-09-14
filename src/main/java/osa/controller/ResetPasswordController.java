package osa.controller;

import static osa.services.OfyService.ofy;

import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import osa.entity.UserDetailsEntity;
import osa.services.ResetPassService;

public class ResetPasswordController extends HttpServlet {
	
	
	ResetPassService rps=new ResetPassService();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 HttpSession s=request.getSession();
		
		String id=request.getParameter("id");
		
		if(rps.check(id))
		{
			List<UserDetailsEntity>li=ofy().load().type(UserDetailsEntity.class).list();
		    Iterator<UserDetailsEntity>itr=li.iterator();
		    while(itr.hasNext())
		     {
		     	UserDetailsEntity ude=itr.next();
		    	if(ude.id==id)
		    	{
		    	  s.setAttribute("email", ude.email);
		    	}	
		     }
		    
		    response.sendRedirect("ResetPassword.jsp");
		 }	        
	     else
			response.sendRedirect("login.jsp");
	}
		
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession s=request.getSession();
		
		String email=(String)s.getAttribute("email");
		String newpass=request.getParameter("resetnewpassword");
		String confirmpass=request.getParameter("confirmnewpassword");
		
		if(newpass.equals(confirmpass))
		{
	  	  rps.reset(email,newpass);
		  s.setAttribute("match","done");
		  response.sendRedirect("ResetPassword.jsp");
		}
		else
		{
		 s.setAttribute("match", "notdone");
		 response.sendRedirect("ResetPassword.jsp");
		}
	}

}
