<%@page import="osa.entity.SocietyDetailsEntity"%>
<%@page import="osa.services.SocietyDetailsService"%>
<%@page import="osa.services.LikeService"%>
<%@page import="osa.entity.LikeEntity"%>
<%@page import="osa.entity.CommentEntity"%>
<%@page import="osa.services.CommentServices"%>
<%@page import="osa.entity.PostEntity"%>
<%@page import="osa.services.PostService"%>
<%@page import="osa.services.EventService"%>
<%@page import="osa.entity.EventEntity"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%




EventService es=new EventService();
List<EventEntity> li = es.getAllEvents();
if(li!=null)
application.setAttribute("allevents", li);


PostService ps=new PostService();
List <PostEntity> lp=ps.list();
if(lp!=null)
application.setAttribute("postlist", lp);

CommentServices cs=new CommentServices();
List <CommentEntity> lc=cs.getComments();
if(lc!=null)
application.setAttribute("commentlist", lc);


LikeService ls=new LikeService();
List<LikeEntity> ll=ls.getLikes();
if(ll!=null)
application.setAttribute("likelist" , ll);	
	

SocietyDetailsService sd = new SocietyDetailsService();
List<SocietyDetailsEntity> lb=sd.getSocietyList();
if(ls!=null)
application.setAttribute("soclist",lb);
response.sendRedirect("main.jsp");


%>

</body>
</html>