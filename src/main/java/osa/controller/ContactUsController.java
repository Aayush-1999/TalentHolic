package osa.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import osa.services.ContactUsService;

public class ContactUsController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
       String name=request.getParameter("contactform-name");
       String email=request.getParameter("contactform-email");
       String phone=request.getParameter("contactform-phone");
       String subject=request.getParameter("contactform-subject");
       String mssg=request.getParameter("contactform-message");
	
       ContactUsService cs=new ContactUsService();
       cs.store(name,email,phone,subject,mssg);
       
       HttpSession session=request.getSession();
       session.setAttribute("value",true);
       response.sendRedirect("Contact.jsp");       
	}

}
