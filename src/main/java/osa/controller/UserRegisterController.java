package osa.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import osa.services.SendMail;
import osa.entity.SocietyDetailsEntity;
import osa.services.SocietyDetailsService;
import osa.services.UserDetailsService;

public class UserRegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String type=request.getParameter("usertype");
    	
    	SocietyDetailsService sd=new SocietyDetailsService();
    	UserDetailsService ud=new UserDetailsService();
    	if(type.equals("user"))
    	{
    		

        	String name=request.getParameter("register-form-name");
        	String email=request.getParameter("register-form-email");
        	String password=request.getParameter("register-form-password");
        	String phone=request.getParameter("register-form-phone");
        	String gender=request.getParameter("register-form-gender");
        	String college=request.getParameter("register-form-college");
        	String course=request.getParameter("register-form-course");
        	String branch=request.getParameter("register-form-branch");
        	String year=request.getParameter("register-form-year");
        	String dob=request.getParameter("register-form-date");
        	//int auth
        	
    	
    	if(ud.checkIfUserAlreadyExists(email)||sd.checkIfUserExists(email))
    	{
    		System.out.println("USER ALREADY EXISTS");
    		HttpSession sess=request.getSession();
    		sess.setAttribute("registercheck", "false");
    		response.sendRedirect("register.jsp");
    	}
    	else
    	{
    		/*if(email.equal)
    			auth=2;
    		else
    			auth=1*/
    		ud.registerUser(name,email,password,phone,gender,college,course,branch,year,dob);
    		System.out.println("NEW USER CREATED");
    		HttpSession s=request.getSession();
			s.setAttribute("userdetails", ud.getUser(email,password));
			String toaddress = email;
			HttpSession sess=request.getSession();
			sess.setAttribute("registercheck", null);
			SendMail mail = new SendMail();
			mail.send(toaddress , "Welcome to TalentHolic" , "Dear "+name+"\n Welcome to TalentHolic, the one place for you and all the societies of your college to showcase your talents.\n\n With Regards, TalentHolic Team");
    		response.sendRedirect("settings.jsp");
    	}
    	}
    	
    	if(type.equals("society"))
    	{
    		String name=request.getParameter("register-form-name");
    		String head=request.getParameter("register-form-head");
    		String email=request.getParameter("register-form-email");
    		String password=request.getParameter("register-form-password");
    		String phone=request.getParameter("register-form-phone");
    		String college=request.getParameter("register-form-college");
    		String category=request.getParameter("register-form-category");
    		
    		if(sd.checkIfUserExists(email)||ud.checkIfUserAlreadyExists(email))
    		{
    			System.out.println("USER ALREADY EXITS");
    			HttpSession sess=request.getSession();
        		sess.setAttribute("registercheck", "false");
        		
    			response.sendRedirect("register.jsp");
    		}
    		else
    		{
    			sd.registerSociety(name,head,email,password,phone,college,category);
    			System.out.println("USER CREATED");
    			HttpSession s=request.getSession();
    			s.setAttribute("societydetails", sd.getUser(email,password));
    			HttpSession sess=request.getSession();
    			sess.setAttribute("registercheck", null);
    			
    			List<SocietyDetailsEntity> li=sd.getSocietyList();
    			if(li!=null)
    			{
    				ServletContext context=getServletContext();
    				context.setAttribute("soclist", li);
    			}
    			
    			String toaddress = email;
    			
    			SendMail mail = new SendMail();
    			mail.send(toaddress , "Welcome to TalentHolic" , "Dear "+name+"\n Welcome to TalentHolic, the one place for you and all the societies of your college to showcase your talents.\n\n With Regards, TalentHolic Team");
        		
    			response.sendRedirect("societysettings.jsp");
    		}
    	}
    	
	}

}
