package osa.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import osa.services.SocietyDetailsService;
import osa.services.UserDetailsService;


public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email=request.getParameter("login-form-username");
		String pass=request.getParameter("login-form-password");
		
		SocietyDetailsService sds = new SocietyDetailsService();
		UserDetailsService uds=new UserDetailsService();
		if(uds.validate(email,pass))
		{
			System.out.println("user");
			HttpSession s=request.getSession();
			s.setAttribute("userdetails", uds.getUser(email,pass));
			s.setAttribute("loginfail", null);
			
			response.sendRedirect("profile.jsp");
		}
		else if(sds.validate(email,pass))
		{
			System.out.println("society");
			HttpSession s=request.getSession();
			s.setAttribute("societydetails", sds.getUser(email,pass));
			s.setAttribute("loginfail", null);
			response.sendRedirect("society.jsp");
		
		}
		else
		{
			HttpSession s=request.getSession();
			s.setAttribute("loginfail", "true");
			System.out.println("not user");
			response.sendRedirect("login.jsp");
		}
	}

}
