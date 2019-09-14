package osa.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.appengine.api.blobstore.BlobKey;
import com.google.appengine.api.blobstore.BlobstoreService;
import com.google.appengine.api.blobstore.BlobstoreServiceFactory;

import osa.entity.UserDetailsEntity;
import osa.services.UserDetailsService;

@SuppressWarnings("serial")
public class UploadProfileImage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
BlobstoreService blobstoreService = BlobstoreServiceFactory.getBlobstoreService();
		
		Map<String, List<BlobKey>> blobs = blobstoreService.getUploads(request);
		
		List<BlobKey> blobKeys = blobs.get("myFile");
		
		/*System.out.println(blobKeys.get(0).getKeyString());*/
		HttpSession sess = request.getSession();
		
		UserDetailsEntity ude=(UserDetailsEntity)sess.getAttribute("userdetails");
		
		UserDetailsService uds=new UserDetailsService();
		uds.setImageKey(blobKeys.get(0).getKeyString(),ude.email);
		
		//HttpSession sess = request.getSession();
		sess.setAttribute("userdetails", uds.getUser(ude.email,"xyz"));
		
		response.sendRedirect("/settings.jsp");
	}

}
