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

import osa.entity.SocietyDetailsEntity;
import osa.entity.UserDetailsEntity;
import osa.services.SocietyDetailsService;
import osa.services.UserDetailsService;

public class SocietyProfileUploadController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
BlobstoreService blobstoreService = BlobstoreServiceFactory.getBlobstoreService();
		
		Map<String, List<BlobKey>> blobs = blobstoreService.getUploads(request);
		
		List<BlobKey> blobKeys = blobs.get("myFile");
		
		/*System.out.println(blobKeys.get(0).getKeyString());*/
		HttpSession sess = request.getSession();
		
		SocietyDetailsEntity sde=(SocietyDetailsEntity)sess.getAttribute("societydetails");
		
		SocietyDetailsService sds=new SocietyDetailsService();
		sds.setImageKey(blobKeys.get(0).getKeyString(),sde.email);
		
		//HttpSession sess = request.getSession();
		sess.setAttribute("societydetails", sds.getUser(sde.email,"xyz"));
		
		response.sendRedirect("/societysettings.jsp");

	}

}
