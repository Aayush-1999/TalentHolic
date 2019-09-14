package osa.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import osa.entity.CommentEntity;
import osa.services.CommentServices;




public class CommentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		long uid=1L;
		String postId=request.getParameter("id");
		String name=request.getParameter("name");
		String comment=request.getParameter("comment");
		String url=request.getParameter("url");
		
		CommentServices cs=new CommentServices();
   		while(cs.checkIfAlreadyExists(uid))
		{
			uid=uid+1;
		}
   		
   		cs.createComment(uid,postId,name,comment);
   		
   		List<CommentEntity> li=cs.getComments();
   		
   		ServletContext context=getServletContext();
   		
   		context.setAttribute("commentlist", li);
   		
   		response.sendRedirect(url);
		
	}

}
