package osa.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import osa.entity.LikeEntity;
import osa.entity.SocietyDetailsEntity;
import osa.entity.UserDetailsEntity;
import osa.services.LikeService;


public class LikeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String url=request.getParameter("url");
		
		String id=request.getParameter("id");
		
		LikeService ls=new LikeService();
		
		ls.like(id);
		
		List<LikeEntity> li=ls.getLikes();
		
		
		ServletContext context = getServletContext();
		
		context.setAttribute("likelist", li);
		
		
		response.sendRedirect(url);
	}

}
