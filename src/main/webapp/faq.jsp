<%@page import="com.google.appengine.api.images.ServingUrlOptions"%>
<%@page import="com.google.appengine.api.images.ImagesServiceFactory"%>
<%@page import="com.google.appengine.api.images.ImagesService"%>
<%@page import="com.google.appengine.api.blobstore.BlobKey"%>
<%@page import="osa.entity.LikeEntity"%>
<%@page import="osa.entity.CommentEntity"%>
<%@page import="osa.entity.SocietyDetailsEntity"%>
<%@page import="osa.entity.UserDetailsEntity"%>
<%@page import="java.util.List,osa.entity.PostEntity,java.util.Iterator" %>
<!DOCTYPE html>
<html dir="ltr" lang="en-US">
<%UserDetailsEntity user=(UserDetailsEntity)session.getAttribute("userdetails");
SocietyDetailsEntity soc=(SocietyDetailsEntity)session.getAttribute("societydetails");%>
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
	<title>Contact</title>


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
	
					</nav><!-- #primary-menu end -->

				</div>

			</div>

		</header><!-- #header end -->

		<!-- Page Title
		============================================= -->
		<section id="page-title">

			<div class="container clearfix center">
				<h1>FREQUENTLY ASKED QUESTIONS</h1>
				
			</div>

		</section><!-- #page-title end -->
		
		<!-- CONTENT STARTS -->
		<!-- Content
		============================================= -->
		<section id="content">
            
			<div class="content-wrap">

				<div class="container clearfix">

					<!-- Post Content
					============================================= -->
				<div class="accordion accordion-lg divcenter nobottommargin clearfix" style="max-width: 650px;">
					
					<div class="postcontent nobottommargin clearfix">


						<div class="clear"></div>

						<div id="faqs" class="faqs">

							<div class="toggle faq faq-marketplace faq-authors">
								<div class="togglet"><i class="toggle-closed icon-question-sign"></i><i class="toggle-open icon-question-sign"></i>What is TalentHolic?</div>
								<div class="togglec">TalentHolic is a free to use website for anyone who has got some sort of talent and want to showcase it in front of community which we are trying to build up. Here, at TalentHolic, you can post your videos(embedded),images or literary work according to your talent.   

								Also, we have created a special section for the inter-college societies of <strong>Maharaja Surajmal Institute Of Technology(MSIT)</strong> and <strong> Maharaja Surajmal Institute(MSI)</strong>. This section is for all freshers so that they get to know what happens in each society and according choose them and for all those students who are part of it or trying to be.
								</div>
							</div>

							<div class="toggle faq faq-authors faq-legal faq-itemdiscussion">
								<div class="togglet"><i class="toggle-closed icon-question-sign"></i><i class="toggle-open icon-question-sign"></i>How can I share my videos on TalentHolic?</div>
								<div class="togglec">Since most of the users are already having accounts on video sharing sites like <strong> YouTube, Vimeo etc.</strong> 
								So such users can directly upload their videos to their YouTube channel and share with us an embedded code of their video while uploading their post on our site. By this way, the likes,comments and views of your video also increases.</div>
							</div>

							<div class="toggle faq faq-miscellaneous">
								<div class="togglet"><i class="toggle-closed icon-question-sign"></i><i class="toggle-open icon-question-sign"></i>If I don't want to share my videos with my personal channel or If I don't have a Youtube channel?</div>
								<div class="togglec">No Worries in this case too as we will provide you with our drive account so you need to upload your video there and then after reviewing your video we will host that video on our channel and share the embedded code with you which you will used to create that video post.</div>
							</div>

							

							<div class="toggle faq faq-marketplace faq-authors">
								<div class="togglet"><i class="toggle-closed icon-question-sign"></i><i class="toggle-open icon-question-sign"></i>Video sharing process is a bit typical can you please elaborate ?</div>
								<div class="togglec">You can go through this detailed guide on how to create a video post on a website.<!-- Youtube embedded link here after complete finishing of the site --></div>
							</div>

							<div class="toggle faq faq-affiliates faq-miscellaneous">
								<div class="togglet"><i class="toggle-closed icon-question-sign"></i><i class="toggle-open icon-question-sign"></i>Are my actions on the site being monitered?</div>
								<div class="togglec">Yes, We are strictly monitoring each and every post of our users and any kind of abusive behaviour,language and bullying would not be tolerated and may result in permanent or temporary disabling of account.
								You are free to use this site and its resources to promote your content but anything which wil target a particular section of community or people in a wrong manner would not be tolerated and a strict legal action is taken.</div>
							</div>

							<div class="toggle faq faq-legal faq-itemdiscussion">
								<div class="togglet"><i class="toggle-closed icon-question-sign"></i><i class="toggle-open icon-question-sign"></i>My question is not listed here, What do I do?</div>
								<div class="togglec">You can simply connect to us either through Contact Us section or through Facebook,Twitter,Gmail. <!-- Link to contact us page -->.</div>
							</div>
						</div>
                    </div><!-- .postcontent end -->	
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

	<script>
		jQuery(document).ready(function($){
			var $faqItems = $('#faqs .faq');
			if( window.location.hash != '' ) {
				var getFaqFilterHash = window.location.hash;
				var hashFaqFilter = getFaqFilterHash.split('#');
				if( $faqItems.hasClass( hashFaqFilter[1] ) ) {
					$('#portfolio-filter li').removeClass('activeFilter');
					$( '[data-filter=".'+ hashFaqFilter[1] +'"]' ).parent('li').addClass('activeFilter');
					var hashFaqSelector = '.' + hashFaqFilter[1];
					$faqItems.css('display', 'none');
					if( hashFaqSelector != 'all' ) {
						$( hashFaqSelector ).fadeIn(500);
					} else {
						$faqItems.fadeIn(500);
					}
				}
			}

			$('#portfolio-filter a').click(function(){
				$('#portfolio-filter li').removeClass('activeFilter');
				$(this).parent('li').addClass('activeFilter');
				var faqSelector = $(this).attr('data-filter');
				$faqItems.css('display', 'none');
				if( faqSelector != 'all' ) {
					$( faqSelector ).fadeIn(500);
				} else {
					$faqItems.fadeIn(500);
				}
				return false;
		   });
		});
	</script>


</body>
</html>