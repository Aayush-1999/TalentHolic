package osa.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.appengine.api.blobstore.BlobKey;
import com.google.appengine.api.blobstore.BlobstoreService;
import com.google.appengine.api.blobstore.BlobstoreServiceFactory;

import osa.entity.LikeEntity;
import osa.entity.PostEntity;
import osa.entity.SocietyDetailsEntity;
import osa.entity.UserDetailsEntity;
import osa.services.LikeService;
import osa.services.PostService;

public class UploadController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session=request.getSession();
		
		UserDetailsEntity ude=(UserDetailsEntity) session.getAttribute("userdetails");
		SocietyDetailsEntity sde =(SocietyDetailsEntity)session.getAttribute("societydetails");
		
		long id=1l;
		String name;
		String email;
		if(ude!=null)
		{
			name=ude.name;
			email=ude.email;
		}
		else
		{
			name=sde.name;
			email=sde.email;
		}
		
		
		String type=request.getParameter("uploadtype");
		String description=request.getParameter("uploaddescription");
		String category=request.getParameter("uploadcategory");
		String embed=request.getParameter("upload-embed");
		
		
		BlobstoreService blobstoreService = BlobstoreServiceFactory.getBlobstoreService();
		
		String imagekey=null;
		if(blobstoreService.getUploads(request)!=null){
		Map<String, List<BlobKey>> blobs = blobstoreService.getUploads(request);
		
		if(blobs.get("image")!=null){
		List<BlobKey> blobKeys = blobs.get("image");
		
		if(blobKeys.get(0).getKeyString()!=null){
		imagekey=blobKeys.get(0).getKeyString();
		}}}
		
		
		PostService ps=new PostService();
		while(ps.checkIfPostAlreadyExists(id))
		{
			id=id+1;
		}
		
		System.out.println(id);
		
		
		ps.addPost(id,name,type,description,category,embed,imagekey,email);
		
		List<PostEntity> li = ps.list();
		
		ServletContext ctx=getServletContext();
   		ctx.setAttribute("postlist", li);
		
   		LikeService ls=new LikeService();
   		List<LikeEntity> ll=ls.getLikes();
		
		
		ServletContext context = getServletContext();
		
		context.setAttribute("likelist", ll);
		
		response.sendRedirect("/main.jsp");
		
	}

}
