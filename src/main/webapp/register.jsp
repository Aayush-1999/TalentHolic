<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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

	<!-- Document Title
	============================================= -->
	<title>Register</title>

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
									<li><a href="literary.jsp"><div>Dance</div></a></li>
									<li><a href="literary.jsp"><div>Drama</div></a></li>
									<li><a href="literary.jsp"><div>Music</div></a></li>
									<li><a href="literary.jsp"><div>Literary</div></a></li>
									<li><a href="comingsoon.jsp"><div>Humanitarian</div></a></li>
									<li><a href="literary.jsp"><div>Photography</div></a></li>
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
				<h1>Register</h1>
			</div>

		</section><!-- #page-title end -->


		<!-- Content
		============================================= -->
		<section id="content">

			<div class="content-wrap">

				

				<div class="container clearfix">

					<div class="accordion accordion-lg divcenter nobottommargin clearfix" style="background-color: #FFF; max-width: 600px; padding: 20px">

						
						<div class="acctitle"><i class="acc-closed icon-user4"></i><i class="acc-open icon-ok-sign"></i>New Signup? Register for an Account</div>
						<div class="acc_content clearfix">
							<form id="register-form" name="register-form" class="nobottommargin" action="reg" method="post">
								<div class="col_full">
									<label for="register-form-name">Name:</label>
									<input type="text" id="register-form-name" name="register-form-name" value="" class="form-control" required/>
								</div>

								<div class="col_full">
									<label for="register-form-email">Email Address:</label>
									<input type="email" id="register-form-email" name="register-form-email" value="" class="form-control" required />
									<%if(session.getAttribute("registercheck")!=null){
									if(((String)session.getAttribute("registercheck")).equals("false")){ %><div>Email Already Exists</div><%}} %>
								</div>

								
								<div class="col_full">
									<label for="register-form-password">Choose Password:</label>
									<input type="password" id="register-form-password" name="register-form-password" value="" class="form-control" required minlength="5" maxlength="10"/>
								</div>

							

								<div class="col_half">
									<label for="register-form-phone">Phone:</label>
									<input type="tel" id="register-form-phone" name="register-form-phone" value="" class="form-control" required minlength="10" maxlength="10"/>
								</div>



								<div class="col_half col_last">
									<label for="register-form-gender">Gender</label>
									<select id="register-form-gender" name="register-form-gender" class="sm-form-control" required>
										<option value="Male">Male</option>
										<option value="Female">Female</option>
									</select>
								</div>

								<div class="col_half">
									<label for="register-form-date">Date of Birth:</label>
									<input type="date" id="register-form-date" name="register-form-date" value="" class="form-control" placeholder="yyyy-mm-dd" required/>
								</div>

								<div class="col_half col_last">
									<label for="register-form-college">College:</label>
									<select id="register-form-college" name="register-form-college" class="sm-form-control" required>
										<option value="MSIT">MSIT</option>
										<option value="MSI">MSI</option>
									</select>
								</div>

								<div class="col_half">
									<label for="register-form-course">Course:</label>
									<input type="text" id="register-form-course" name="register-form-course" value="" class="form-control" required/>
								</div>

								<div class="col_half col_last">
									<label for="register-form-branch">Branch:</label>
									<input type="text" id="register-form-branch" name="register-form-branch" value="" class="form-control" required/>
								</div>

								<div class="col_half">
									<label for="register-form-year">Year:</label>
									<select id="register-form-year" name="register-form-year" class="sm-form-control" required>
										<option value="1st">1st</option>
										<option value="2nd">2nd</option>
										<option value="3rd">3rd</option>
										<option value="4th">4th</option>
									</select>	
								</div>

								<div class="col_full">
									<label for="tnc"><a href="#">Accept Terms and Conditions</a></label>
									<input type="checkbox" value="yes" required>
								</div>
								
								<input type="hidden" name="usertype" id="usertype" value="user">


								<div class="col_full nobottommargin">
									<button class="button button-3d button-black nomargin" id="register-form-submit" name="register-form-submit" value="register">Register Now</button>
								</div>
							</form>
							</div>

					<div class="acctitle"><i class="acc-closed icon-user4"></i><i class="acc-open icon-ok-sign"></i>Register Society</div>
						<div class="acc_content clearfix">
							<form id="soc-register-form" name="login-form" class="nobottommargin" action="reg" method="post">
								<div class="col_full">
									<label for="register-form-name">Society Name:</label>
									<input type="text" id="register-form-name" name="register-form-name" value="" class="form-control" required/>
								</div>

								<div class="col_full">
									<label for="register-form-head">Society Head:</label>
									<input type="text" id="register-form-head" name="register-form-head" value="" class="form-control" required/>
								</div>

								<div class="col_full">
									<label for="register-form-email">Email:</label>
									<input type="email" id="register-form-email" name="register-form-email" value="" class="form-control" required/>
									<%if(session.getAttribute("registercheck")!=null){
									if(((String)session.getAttribute("registercheck")).equals("false")){ %><div>Email Already Exists</div><%}} %>
								</div>

								<div class="col_full">
									<label for="register-form-password">Choose Password:</label>
									<input type="password" id="register-form-password" name="register-form-password" value="" class="form-control" required minlength="5" maxlength="10"/>
								</div>

							

								<div class="col_half">
									<label for="register-form-phone">Phone:</label>
									<input type="tel" id="register-form-phone" name="register-form-phone" value="" class="form-control" required minlength="10" maxlength="10"/>
								</div>
								<div class="col_half col_last">
									<label for="register-form-college">College:</label>
									<select id="register-form-college" name="register-form-college" class="sm-form-control" required>
										<option value="MSIT">MSIT</option>
										<option value="MSI">MSI</option>
									</select>
								</div>
								
								<div>
									<label for="register-form-category">Category:</label>
									<select id="register-form-category" name="register-form-category" class="sm-form-control" required>
										<option value="dance">Dance</option>
										<option value="drama">Drama</option>
										<option value="literary">Literary</option>
										<option value="music">Music</option>
										<option value="photography">Photography</option>
										<option value="humanitarian">Humanitarian</option>
										<option value="creativity">Creativity</option>
										<option value="technical">Technical</option>
									</select>
								</div>

								<div class="col_full">
									<label for="tnc"><a href="#">Accept Terms and Conditions</a></label>
									<input type="checkbox" value="yes" required>
								</div>


								<input type="hidden" name="usertype" id="usertype" value="society">
								

								<div class="col_full nobottommargin">
									<button class="button button-3d button-black nomargin" id="register-form-submit" name="register-form-submit" value="register">Register Now</button>
								</div>
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
                         <i class="icon-envelope2"></i>talentholicth@gmail.com <span class="middot">&middot;</span> <i class="icon-headphones"></i> +91-8130508403 
						<span class="middot">&middot;</span> <i class="icon-headphones"></i> +91-7982106539<div><i class="icon-headphones"></i> +91-9971227534 </div>
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