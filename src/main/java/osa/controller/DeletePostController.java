package osa.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import osa.entity.CommentEntity;
import osa.entity.LikeEntity;
import osa.entity.PostEntity;
import osa.services.CommentServices;
import osa.services.LikeService;
import osa.services.PostService;

public class DeletePostController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
		String url=request.getParameter("url");
		String id =request.getParameter("postid");
		/*String value=request.getParameter("deleteconfirmation");*/
		
		/*if(value.equals("delete"))
		{
		*/
			PostService ps=new PostService();
		    ps.deletePost(id);
		    
		    LikeService lv=new LikeService();
		    lv.deleteLike(id);
		    
		    CommentServices cs=new CommentServices();
		    cs.deleteComments(id);
		    
		    
		    List<PostEntity> li = ps.list();
			ServletContext ctx=getServletContext();
	   		ctx.setAttribute("postlist", li);
			
	   		LikeService ls=new LikeService();
	   		List<LikeEntity> ll=ls.getLikes();
			ServletContext context = getServletContext();
			context.setAttribute("likelist", ll);
			
			List<CommentEntity> lc=cs.getComments();
	        context.setAttribute("commentlist", lc);
	   		
	        response.sendRedirect(url);
	  
	/*	}

		else
			response.sendRedirect(url);
	*/
	}

}
