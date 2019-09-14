<%@page import="com.google.appengine.api.blobstore.BlobstoreServiceFactory"%>
<%@page import="com.google.appengine.api.blobstore.BlobstoreService"%>
<%@page import="osa.entity.SocietyDetailsEntity"%>
<%@page import="osa.entity.UserDetailsEntity"%>
<%@page import="com.google.appengine.api.images.ImagesServiceFactory"%>
<%@page import="com.google.appengine.api.images.ServingUrlOptions"%>
<%@page import="com.google.appengine.api.images.ImagesService"%>
<%@page import="com.google.appengine.api.blobstore.BlobKey"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%UserDetailsEntity user=(UserDetailsEntity)session.getAttribute("userdetails");
SocietyDetailsEntity soc=(SocietyDetailsEntity)session.getAttribute("societydetails");%>
<!DOCTYPE html>
<html dir="ltr" lang="en-US">
<head>

	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<meta name="author" content="SemiColonWeb" />

	<!-- Stylesheets
	============================================= -->
	<link href="https://fonts.googleapis.com/css?family=Lato:300,400,400i,700|Raleway:300,400,500,600,700|Crete+Round:400i" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" href="css/bootstrap.css" type="text/css" />
	<link rel="stylesheet" href="style.css" type="text/css" />
	<link rel="stylesheet" href="css/dark.css" type="text/css" />
	<link rel="stylesheet" href="css/font-icons.css" type="text/css" />
	<link rel="stylesheet" href="css/animate.css" type="text/css" />
	<link rel="stylesheet" href="css/magnific-popup.css" type="text/css" />

	<link rel="stylesheet" href="css/responsive.css" type="text/css" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />

	<!-- Bootstrap File Upload CSS -->
	<link rel="stylesheet" href="css/components/bs-filestyle.css" type="text/css" />

	<link rel="stylesheet" href="css/responsive.css" type="text/css" />
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />



	<!-- Document Title
	============================================= -->
	<title>About Us</title>


</head>

<body class="stretched">

	<!-- Document Wrapper
	============================================= -->
	<div id="wrapper" class="clearfix">

		<!-- Header
		============================================= -->
		<header id="header" class="full-header dark">

			<div id="header-wrap">

				<div class="container clearfix">

					<div id="primary-menu-trigger"><i class="icon-reorder"></i></div>

					<!-- Logo
					============================================= -->
					<div id="logo">
						<a href="main.jsp" class="standard-logo" data-dark-logo="images/talentholic.png"><img src="images/talentholic.png" alt="Canvas Logo"></a>
						<a href="main.jsp" class="retina-logo" data-dark-logo="images/talentholic2x.png"><img src="images/talentholic.png" alt="Canvas Logo"></a>
					</div><!-- #logo end -->

					<%if((session.getAttribute("userdetails")!=null)||(session.getAttribute("societydetails")!=null)) {%>

					<div id="top-account" class="dropdown">
						<%
						
					if((user!=null)&&(user.imagekey!=null)){

					BlobKey bk=new BlobKey(user.imagekey);
					ImagesService imagesService = ImagesServiceFactory.getImagesService();

					ServingUrlOptions servingOptions = ServingUrlOptions.Builder.withBlobKey(bk);
 
  
					String servingUrl = imagesService.getServingUrl(servingOptions); %>
					
						<a href="#" class="btn btn-secondary btn-sm dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true"><img src="<%=servingUrl %>" height="30" width="30"></a>
					<%}
					
					else if((soc!=null)&&(soc.profilekey!=null)){
						BlobKey bk=new BlobKey(soc.profilekey);
						ImagesService imagesService = ImagesServiceFactory.getImagesService();

						ServingUrlOptions servingOptions = ServingUrlOptions.Builder.withBlobKey(bk);
	 
	  
						String servingUrl = imagesService.getServingUrl(servingOptions); %>
						
							<a href="#" class="btn btn-secondary btn-sm dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true"><img src="<%=servingUrl %>" height="30" width="30"></a>
					
					<%} 
					else{%><a href="#" class="btn btn-secondary btn-sm dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true"><img src="images/icons/avatar.jpg" height="30" width="30"></a><%} %>
<ul class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenu1">
							<%if(session.getAttribute("societydetails")!=null){ %>
							<a class="dropdown-item tleft" href="society.jsp">
							<%}else{ %><a class="dropdown-item tleft" href="profile.jsp"><%} %>
							Profile</a>
							<a class="dropdown-item tleft" href="newpost.jsp">New Post</a>
							<%if(session.getAttribute("societydetails")!=null){ %>
							<a class="dropdown-item tleft" href="newevent.jsp">New Event</a><%} %>
							<% if(session.getAttribute("societydetails")!=null){ %><a class="dropdown-item tleft" href="societysettings.jsp"><%}else{ %><a class="dropdown-item tleft" href="settings.jsp"><%} %>Settings</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item tleft" href="/logout">Logout <i class="icon-signout"></i></a>
						</ul>
					</div>
					<%} %>

					<!-- Primary Navigation
					============================================= -->
					<nav id="primary-menu">

						<ul>
							<li><a href="main.jsp"><div>Home</div></a></li>
							<li><a href="#"><div>Categories</div></a>
								<ul>
									<li><a href="dance.jsp"><div>Dance</div></a></li>
									<li><a href="drama.jsp"><div>Drama</div></a></li>
									<li><a href="music.jsp"><div>Music</div></a></li>
									<li><a href="literary.jsp"><div>Literary</div></a></li>
									<li><a href="comingsoon.jsp"><div>Humanitarian</div></a></li>
									<li><a href="photography.jsp"><div>Photography</div></a></li>
									<li><a href="creativity.jsp"><div>Creativity</div></a></li>
									<li><a href="Technical.jsp"><div>Technical</div></a></li>
							
								</ul>
							</li>
							<li><a href="events.jsp"><div>Events</div></a></li>
							<li><a href="aboutus.jsp"><div>About Us</div></a></li>
							<%if((session.getAttribute("userdetails")==null)&&(session.getAttribute("societydetails")==null)) {%>
							<li><a href="login.jsp"><div>Login</div></a></li>
							<%} %>
							
						</ul>

						
						
						<!-- Top Search
						============================================= -->
						<!-- <div id="top-search">
							<a href="#" id="top-search-trigger"><i class="icon-search3"></i><i class="icon-line-cross"></i></a>
							<form action="search.html" method="get">
								<input type="text" name="q" class="form-control" value="" placeholder="Type &amp; Hit Enter..">
							</form>
						</div> --><!-- #top-search end -->

					</nav><!-- #primary-menu end -->
				</div>

			</div>

		</header><!-- #header end -->

		<!-- Page Title
		============================================= -->
		<section id="page-title">

			<div class="container clearfix center">
				<h1>About Us</h1>
			</div>

		</section><!-- #page-title end -->


		
		<!-- Content
		============================================= -->
		<section id="content">

			<div class="content-wrap">

				<div class="container clearfix">

					<div class="heading-block center">
						<h2>TalentHolic Think Tank</h2>
							<span>TalentHolic provides you the perfect platform to showcase your talents in front of your college along with the various societies of your college.</span>
					</div>

					

					<div class="row clearfix">

						
						<div class="col">
							<div class="team team-list clearfix">
								<div class="team-image center"  >
									<img src="images/icons/avatar.jpg" alt="Aayush Agarwal">
								</div>
							</div>

							<div class="team-desc">
								<div class="team-title"><h4>Aayush Agarwal</h4><span>Developer</span></div>
			                </div>
						</div>

						
					</div>
				</div>
			</div>

		</section><!-- #content end -->


			<!-- Footer
		============================================= -->
		<footer id="footer" class="dark">

			<!-- Copyrights
			============================================= -->
			<div id="copyrights">

				<div class="container clearfix">					

					<div class="col_half">
						<div class="copyrights-menu copyright-links clearfix">
							<a href="main.jsp">Home</a>/<a href="events.jsp">Events</a>/<a href="aboutus.jsp">About Us</a>/<a href="contact.jsp">Contact Us</a>/<a href="faq.jsp">FAQs</a>
						</div>
						Copyrights &copy; 2018 All Rights Reserved by TalentHolic.
					</div>               

					<div class="col_half col_last tright">
						<div class="fright clearfix">
							<a href="https://www.facebook.com/talentholic.th.9" class="social-icon si-small si-borderless si-facebook">
								<i class="icon-facebook"></i>
								<i class="icon-facebook"></i>
							</a>

							<a href="https://twitter.com/ThHolic" class="social-icon si-small si-borderless si-twitter">
								<i class="icon-twitter"></i>
								<i class="icon-twitter"></i>
							</a>

							<a href="https://plus.google.com/discover" class="social-icon si-small si-borderless si-gplus">
								<i class="icon-gplus"></i>
								<i class="icon-gplus"></i>
							</a>
							
							<a href="https://in.pinterest.com/" class="social-icon si-small si-borderless si-pinterest">
								<i class="icon-pinterest"></i>
								<i class="icon-pinterest"></i>
							</a>


						</div>

						<div class="clear"></div>
                         <i class="icon-envelope2"></i>talentholicth@gmail.com
						</div>
				</div>
			</div><!-- #copyrights end -->

		</footer><!-- #footer end -->			
	</div><!-- #wrapper end -->

	<!-- Go To Top
	============================================= -->
	<div id="gotoTop" class="icon-angle-up"></div>

	<!-- External JavaScripts
	============================================= -->
	<script src="js/jquery.js"></script>
	<script src="js/plugins.js"></script>

	<!-- Footer Scripts
	============================================= -->
	<script src="js/functions.js"></script>
	<!-- Bootstrap File Upload Plugin -->
	<script src="js/components/bs-filestyle.js"></script>

	

	

</body>
</html>