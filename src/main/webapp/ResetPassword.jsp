<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Reset Password</title>
</head>
<body>

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

	<!-- Document Title
	============================================= -->
	<title>Forgotten Password</title>

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
						<a href="main.jsp" class="retina-logo" data-dark-logo="images/talentholic2x.png"><img src="images/talentholic2x.png" alt="Canvas Logo"></a>
					</div><!-- #logo end -->

					<%if((session.getAttribute("userdetails")!=null)||(session.getAttribute("societydetails")!=null)) {%>

					<div id="top-account" class="dropdown">
						<a href="#" class="btn btn-secondary btn-sm dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true"><img src="img\image.jpeg" height="30" width="30"></a>
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
				<h1>Reset Password</h1>
			</div>

		</section><!-- #page-title end -->


		<!-- Content
		============================================= -->
		<section id="content">

			<div class="content-wrap">

				<div class="container clearfix">
				
				  <div class="accordion accordion-lg divcenter nobottommargin clearfix" style="max-width: 550px;">

						<div class="acc_content clearfix">
							<form id="resetpass-form" name="resetpass-form" class="nobottommargin" action="resetpassword" method="post">
							
								
								<div class="col_full">
									<label for="resetpass">Enter you new password:</label>
									<input type="password" id="resetpass" name="resetnewpassword" value="" class="form-control" />
								</div>
								
								<div class="col_full">
									<label for="confirmpass">Confirm you new password:</label>
									<input type="password" id="confirmpass" name="confirmnewpassword" value="" class="form-control" />
								</div>
								

								<div class="col_full nobottommargin">
									<button class="button button-3d button-black nomargin" id="resetpasswordform-submit" name="resetpasswordform-submit" value="resetpass">Submit</button>
							    </div>
						    <%
						    if(((String)session.getAttribute("match"))!=null){
						    if(((String)session.getAttribute("match")).equals("done")) {%>
								<div class="center">
								Your new password has been set successfully. Go to login page to log into your account.
								</div>
							<%} 
							
						    else if (((String)session.getAttribute("match")).equals("notdone")) {%>
								<div class="center">
								Passwords didn't match, Try again.
								</div>
							<%}} %>
							</form>
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
							<a href="#">Home</a>/<a href="#">Societies</a>/<a href="#">Events</a>/<a href="contact.html">Contact Us</a>/<a href="#">FAQs</a>
						</div>
						Copyrights &copy; 2014 All Rights Reserved by Canvas Inc.
					</div>               

					<div class="col_half col_last tright">
						<div class="fright clearfix">
							<a href="#" class="social-icon si-small si-borderless si-facebook">
								<i class="icon-facebook"></i>
								<i class="icon-facebook"></i>
							</a>

							<a href="#" class="social-icon si-small si-borderless si-twitter">
								<i class="icon-twitter"></i>
								<i class="icon-twitter"></i>
							</a>

							<a href="#" class="social-icon si-small si-borderless si-gplus">
								<i class="icon-gplus"></i>
								<i class="icon-gplus"></i>
							</a>

							<a href="#" class="social-icon si-small si-borderless si-pinterest">
								<i class="icon-pinterest"></i>
								<i class="icon-pinterest"></i>
							</a>

							<a href="#" class="social-icon si-small si-borderless si-vimeo">
								<i class="icon-vimeo"></i>
								<i class="icon-vimeo"></i>
							</a>

							<a href="#" class="social-icon si-small si-borderless si-github">
								<i class="icon-github"></i>
								<i class="icon-github"></i>
							</a>

							<a href="#" class="social-icon si-small si-borderless si-yahoo">
								<i class="icon-yahoo"></i>
								<i class="icon-yahoo"></i>
							</a>

							<a href="#" class="social-icon si-small si-borderless si-linkedin">
								<i class="icon-linkedin"></i>
								<i class="icon-linkedin"></i>
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


</body>
</html>