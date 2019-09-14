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

import osa.entity.EventEntity;
import osa.entity.SocietyDetailsEntity;
import osa.services.EventService;


public class CreateEventController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
   		HttpSession session=request.getSession();
   		SocietyDetailsEntity sde=(SocietyDetailsEntity) session.getAttribute("societydetails");
   		
   		long id=1L;
   		String name=request.getParameter("new-event-name");
   		String date=request.getParameter("new-event-date");
   		String month=request.getParameter("new-event-month");
   		String startTime=request.getParameter("new-event-start-time");
   		String endTime=request.getParameter("new-event-end-time");
   		String location=request.getParameter("new-event-location");
   		String description=request.getParameter("new-event-description");
   		String society=sde.name;
   	
BlobstoreService blobstoreService = BlobstoreServiceFactory.getBlobstoreService();
		
		Map<String, List<BlobKey>> blobs = blobstoreService.getUploads(request);
		
		List<BlobKey> blobKeys = blobs.get("file");
		String imagekey=blobKeys.get(0).getKeyString();
   		
   		EventService es=new EventService();
   		while(es.checkIfAlreadyExists(id))
		{
			id=id+1;
		}
   		es.createEvent(id,name,date,month,startTime,endTime, location, description, society,imagekey);
   		
   		List<EventEntity> li = es.getAllEvents();
   		   		
   		ServletContext ctx=getServletContext();
   		ctx.setAttribute("allevents", li);
   	
   		response.sendRedirect("/events.jsp");
   	}

}
