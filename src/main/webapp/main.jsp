<%@page import="osa.entity.SocietyDetailsEntity"%>
<%@page import="osa.services.SocietyDetailsService"%>
<%@page import="osa.entity.LikeEntity"%>
<%@page import="osa.services.LikeService"%>
<%@page import="osa.entity.CommentEntity"%>
<%@page import="osa.services.CommentServices"%>
<%@page import="osa.entity.PostEntity"%>
<%@page import="osa.services.PostService"%>
<%@page import="osa.entity.EventEntity"%>
<%@page import="java.util.List"%>
<%@page import="osa.services.EventService"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%EventService es=new EventService();
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
    %>
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

    <link rel="stylesheet" type="text/css" href="demos/photographer/css/menu.css" />
	<link rel="stylesheet" href="css/responsive.css" type="text/css" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<!--[if lt IE 9]>
		<script src="http://css3-mediaqueries-js.googlecode.com/svn/trunk/css3-mediaqueries.js"></script>
	<![endif]-->

	<!-- SLIDER REVOLUTION 5.x CSS SETTINGS -->
	<link rel="stylesheet" type="text/css" href="include/rs-plugin/css/settings.css" media="screen" />
	<link rel="stylesheet" type="text/css" href="include/rs-plugin/css/layers.css">
	<link rel="stylesheet" type="text/css" href="include/rs-plugin/css/navigation.css">

	<!-- Document Title
	============================================= -->
	<title>TalentHolic</title>

	<style>

		.revo-slider-emphasis-text {
			font-size: 64px;
			font-weight: 700;
			letter-spacing: -1px;
			font-family: 'Raleway', sans-serif;
			padding: 15px 20px;
			border-top: 2px solid #FFF;
			border-bottom: 2px solid #FFF;
		}

		.revo-slider-desc-text {
			font-size: 20px;
			font-family: 'Lato', sans-serif;
			width: 650px;
			text-align: center;
			line-height: 1.5;
		}

		.revo-slider-caps-text {
			font-size: 16px;
			font-weight: 400;
			letter-spacing: 3px;
			font-family: 'Raleway', sans-serif;
		}

		.tp-video-play-button { display: none !important; }

		.tp-caption { white-space: nowrap; }

	</style>

</head>

<body class="stretched">

	<!-- Document Wrapper
	============================================= -->
	<div id="wrapper" class="clearfix">

		
		
		<!-- HEADER START -->
		<header id="header" class="transparent-header no-sticky dark">

			<div id="header-wrap">
				<div class="container">
					
					<!-- Logo
					============================================= -->
					<!-- <div id="logo">
						<a href="main.jsp" class="standard-logo" data-dark-logo="images/talentholic.png"><img src="images/talentholic.png" alt="Canvas Logo"></a>
						<a href="main.jsp" class="retina-logo" data-dark-logo="images/talentholic2x.png"><img src="images/talentholic2x.png" alt="Canvas Logo"></a>
					</div> --><!-- #logo end -->
				
				
					<a href="main.jsp"><img src="images/talentholic2x.png" alt="Canvas Logo" height="100"></a>
				
				</div>
				<div>
					<div class="primary-menu-trigger hamburger">
						<i class="icon-line-menu"></i>
						<i class="icon-line-cross"></i>
					</div>
					<div class="global-menu">
						<div class="global-menu__wrap">
							<a class="global-menu__item" href="main.jsp">Home</a>
							<%if(session.getAttribute("userdetails")!=null){%>
							<a class="global-menu__item" href="profile.jsp">Profile</a><%}
							else if(session.getAttribute("societydetails")!=null)
							{%><a class="global-menu__item" href="society.jsp">Society Page</a><%}
							else
							{%><a class="global-menu__item" href="login.jsp">Log In</a><%} %>
							<a data-hash href="#content" class="global-menu__item" href="main.jsp#`content">Categories</a>
							<a class="global-menu__item" href="events.jsp">Events</a>
							<a class="global-menu__item" href="aboutus.jsp">About Us</a>
						</div>
					</div>
					<svg class="shape-overlays" viewBox="0 0 100 100" preserveAspectRatio="none">
						<path class="shape-overlays__path"></path>
						<path class="shape-overlays__path"></path>
						<path class="shape-overlays__path"></path>
						<path class="shape-overlays__path"></path>
					</svg>
				</div>
			</div>

		</header>
         <!-- HEADER END -->

		<section id="slider" class="slider-element slider-parallax revslider-wrap clearfix">
			<div class="slider-parallax-inner">
				<!--
				#################################
					- THEMEPUNCH BANNER -
				#################################
				-->
				<div id="rev_slider_779_1_wrapper" class="rev_slider_wrapper fullwidth-container" data-alias="default-slider" style="padding:0px;">
					<!-- START REVOLUTION SLIDER 5.1.4 fullwidth mode -->
					<div id="rev_slider_779_1" class="rev_slider fullwidthbanner" style="display:none;" data-version="5.1.4">
						<ul>    <!-- SLIDE  -->
							<li class="dark" data-transition="slidehorizontal" data-slotamount="1" data-masterspeed="1000"   data-fstransition="fade" data-fsmasterspeed="1000" data-fsslotamount="7" data-saveperformance="off"  data-title="Welcome to Canvas">
								
								<!-- LAYERS -->

								 <!--  LAYER NR. 1 -->
								<div class="tp-fade fadeout fullscreenvideo rs-background-video-layer"
									data-forcerewind="on"
									data-volume="mute"
									data-videowidth="100%"
									data-videoheight="100%"
									data-videomp4="images/DAY2A.mp4"
									data-videopreload="preload"
									data-videoloop="none"
									data-forceCover="1"
									data-aspectratio="16:9"
									data-autoplay="true"
									data-autoplayonlyfirsttime="false"
									data-nextslideatend="true"
						 			style="z-index: 2;">
								</div>

								<!-- LAYER NR. 2 -->
								<div class="tp-caption customin ltl tp-resizeme"
								data-x="center" data-hoffset="0"
								data-y="top" data-voffset="503"
								data-transform_in="x:0;y:150;z:0;rotationZ:0;scaleX:1;scaleY:1;skewX:0;skewY:0;s:800;e:Power4.easeOutQuad;"
								data-speed="800"
								data-start="1550"
								data-easing="easeOutQuad"
								data-splitin="none"
								data-splitout="none"
								data-elementdelay="0.01"
								data-endelementdelay="0.1"
								data-endspeed="1000"
								data-endeasing="Power4.easeIn" style="z-index: 3;">
								</div>

							</li>
							<!-- SLIDE  -->
							<li class="dark" data-transition="slidehorizontal" data-slotamount="1" data-masterspeed="1000" data-thumb="include/rs-plugin/demos/assets/images/space_cover-250x100.jpg"  data-saveperformance="off"  data-title="Mobile Ready Design">
								<!-- LAYERS -->

								<!-- LAYER NR. 1 -->
								<div class="tp-fade fadeout fullscreenvideo rs-background-video-layer"
									data-forcerewind="on"
									data-volume="mute"
									data-videowidth="100%"
									data-videoheight="100%"
									data-videomp4="images/DAY1.mp4"
									data-videopreload="preload"
									data-videoloop="none"
									data-forceCover="1"
									data-aspectratio="16:9"
									data-autoplay="true"
									data-autoplayonlyfirsttime="false"
									data-nextslideatend="true">
								</div>

								<!-- LAYER NR. 2 -->
								<div class="tp-caption customin ltl tp-resizeme"
								data-x="center" data-hoffset="0"
								data-y="top" data-voffset="503"
								data-transform_in="x:0;y:150;z:0;rotationZ:0;scaleX:1;scaleY:1;skewX:0;skewY:0;s:800;e:Power4.easeOutQuad;"
								data-speed="800"
								data-start="1350"
								data-easing="easeOutQuad"
								data-splitin="none"
								data-splitout="none"
								data-elementdelay="0.01"
								data-endelementdelay="0.1"
								data-endspeed="1000"
								data-endeasing="Power4.easeIn" style="z-index: 3;">
								</div>

							</li>
							<!-- SLIDE  -->
							<li class="dark" data-transition="slidehorizontal" data-slotamount="1" data-masterspeed="1000"  data-thumb="images/slider/rev/main/s1-thumb.jpg"  data-saveperformance="off"  data-title="Infinite Possibilities">
								<!-- LAYERS -->

								<!-- LAYER NR. 1 -->
								<div class="tp-fade  fullscreenvideo rs-background-video-layer"
									data-forcerewind="on"
									data-volume="mute"
									data-videowidth="100%"
									data-videoheight="100%"
									data-videomp4="images/DAY2A.mp4"
									data-videopreload="preload"
									data-videoloop="none"
									data-forceCover="1"
									data-aspectratio="16:9"
									data-autoplay="true"
									data-autoplayonlyfirsttime="false"
									data-nextslideatend="true"
									>
								</div>

								<!-- LAYER NR. 2 -->
								<div class="tp-caption customin ltl tp-resizeme"
								data-x="center" data-hoffset="0"
								data-y="top" data-voffset="503"
								data-transform_in="x:0;y:150;z:0;rotationZ:0;scaleX:1;scaleY:1;skewX:0;skewY:0;s:800;e:Power4.easeOutQuad;"
								data-speed="800"
								data-start="1550"
								data-easing="easeOutQuad"
								data-splitin="none"
								data-splitout="none"
								data-elementdelay="0.01"
								data-endelementdelay="0.1"
								data-endspeed="1000"
								data-endeasing="Power4.easeIn" style="z-index: 3;">
								</div>

							</li>
						</ul>
					</div>
				</div><!-- END REVOLUTION SLIDER -->
			</div>
		</section>

		<!-- Content
		============================================= -->
		<section id="content">

			
			
			<div class="section nobg footer-stick clearfix dark">
					<div class="container clearfix dark">
						<div class="heading-block dark center noborder">
							<h2 class="ls1">Categories</h2>
						</div>
						<div class="row dark clearfix">
							<div class="col-md-3 center">
								<a href="dance.jsp">
									<div style="margin: 0 auto;max-width: 235px; padding: 25px; background: url('demos/photography/images/album-bg.svg') no-repeat center center; background-size: 105%;">
										<img src="images/220px-Two_dancers.jpg" alt="img01" height="260px" width="227px" />
									</div>
									<h4 class="ls1 t400">Dance</h4>
								</a>
							</div>
							<div class="col-md-3 center">
								<a href="drama.jsp">
									<div style="margin: 0 auto;max-width: 250px; padding: 25px; background: url('demos/photography/images/album-bg.svg') no-repeat center center; background-size: 105%;">
										<img src="images/drama.jpg" alt="img02" height="260px" width="227px"" />
									</div>
									<h4 class="ls1 t400">Drama</h4>
								</a>
							</div>
							<div class="col-md-3 center">
								<a href="music.jsp">
									<div style="margin: 0 auto;max-width: 250px; padding: 25px; background: url('demos/photography/images/album-bg.svg') no-repeat center center; background-size: 105%;">
										<img src="images/music4.jpg" alt="img03"height="260px" width="227px"/>
									</div>
									<h4 class="ls1 t400">Music</h4>
								</a>
							</div>
							<div class="col-md-3 center">
								<a href="photography.jsp">
									<div style="margin: 0 auto;max-width: 250px; padding: 25px; background: url('demos/photography/images/album-bg.svg') no-repeat center center; background-size: 105%;">
										<img src="images/photog.jpg" alt="img04" height="260px" width="227px" />
									</div>
									<h4 class="ls1 t400">Photography</h4>
								</a>
							</div>
							<div class="col-md-3 center topmargin-sm">
								<a href="literary.jsp">
									<div style="margin: 0 auto;max-width: 250px; padding: 25px; background: url('demos/photography/images/album-bg.svg') no-repeat center center; background-size: 105%;">
										<img src="images/literary.jpg" alt="img05" height="260px" width="227px" />
									</div>
									<h4 class="ls1 t400">Literature</h4>
								</a>
							</div>
							<div class="col-md-3 center topmargin-sm">
								<a href="comingsoon.jsp">
									<div style="margin: 0 auto;max-width: 250px; padding: 25px; background: url('demos/photography/images/album-bg.svg') no-repeat center center; background-size: 105%;">
										<img src="images/humanitarian.jpg" alt="img06" height="260px" width="227px" />
									</div>
									<h4 class="ls1 t400">Humanitarian</h4>
								</a>
							</div>
							<div class="col-md-3 center topmargin-sm">
								<a href="comingsoon.jsp">
									<div style="margin: 0 auto;max-width: 250px; padding: 25px; background: url('demos/photography/images/album-bg.svg') no-repeat center center; background-size: 105%;">
										<img src="images/creativity.jpg" alt="img08" height="260px" width="227px" />
									</div>
									<h4 class="ls1 t400">Creativity</h4>
								</a>
							</div>
							<div class="col-md-3 center topmargin-sm">
								<a href="comingsoon.jsp">
									<div style="margin: 0 auto;max-width: 250px; padding: 25px; background: url('demos/photography/images/album-bg.svg') no-repeat center center; background-size: 105%;">
										<img src="images/tech.jpg" alt="img07" height="260px" width="227px" />
									</div>
									<h4 class="ls1 t400">Technical</h4>
								</a>
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
                         <i class="icon-envelope2"></i>talentholicth@gmail.com <span class="middot">&middot;</span> <i class="icon-headphones"></i> +91-8130508403 
						<span class="middot">&middot;</span> <i class="icon-headphones"></i> +91-7982106539<div><i class="icon-headphones"></i> +91-9971227534 </div>
						</div>
				</div>
			</div><!-- #copyrights end -->

		</footer><!-- #footer end -->		
	

	<!-- Go To Top
	============================================= -->
	<div id="gotoTop" class="icon-angle-up"></div>

	<!-- External JavaScripts
	============================================= -->
	<script src="js/jquery.js"></script>
	<script src="js/plugins.js"></script>

	<!-- Menu Open Plugin
	============================================= -->
	<script src="demos/photographer/js/menu-easing.js"></script>

	<!-- Footer Scripts
	============================================= -->
	<script src="js/functions.js"></script>

	<!-- SLIDER REVOLUTION 5.x SCRIPTS  -->
	<script src="include/rs-plugin/js/jquery.themepunch.tools.min.js"></script>
	<script src="include/rs-plugin/js/jquery.themepunch.revolution.min.js"></script>

	<script src="include/rs-plugin/js/extensions/revolution.extension.video.min.js"></script>
	<script src="include/rs-plugin/js/extensions/revolution.extension.slideanims.min.js"></script>
	<script src="include/rs-plugin/js/extensions/revolution.extension.actions.min.js"></script>
	<script src="include/rs-plugin/js/extensions/revolution.extension.layeranimation.min.js"></script>
	<script src="include/rs-plugin/js/extensions/revolution.extension.kenburn.min.js"></script>
	<script src="include/rs-plugin/js/extensions/revolution.extension.navigation.min.js"></script>
	<script src="include/rs-plugin/js/extensions/revolution.extension.migration.min.js"></script>
	<script src="include/rs-plugin/js/extensions/revolution.extension.parallax.min.js"></script>

	<script>

		var tpj=jQuery;
		tpj.noConflict();

		tpj(document).ready(function() {

			var apiRevoSlider = tpj('#rev_slider_779_1').show().revolution(
			{
				sliderType:"standard",
				jsFileLocation:"include/rs-plugin/js/",
				dottedOverlay:"none",
				sliderLayout: "fullwidth",
				delay:9000,
				responsiveLevels: [1240, 1024, 778, 480],
				visibilityLevels: [1240, 1024, 778, 480],
				gridwidth: [1200, 1024, 778, 480],
				gridheight: [700, 768, 960, 720],
				hideThumbs:200,

				thumbWidth:100,
				thumbHeight:50,
				thumbAmount:3,

				touchenabled:"on",
				onHoverStop:"on",

				swipe_velocity: 0.7,
				swipe_min_touches: 1,
				swipe_max_touches: 1,
				drag_block_vertical: false,


				navigation: {
                        keyboardNavigation: "off",
                        keyboard_direction: "horizontal",
                        mouseScrollNavigation: "off",
                        onHoverStop: "off",
                        touch: {
                            touchenabled: "on",
                            swipe_threshold: 75,
                            swipe_min_touches: 1,
                            swipe_direction: "horizontal",
                            drag_block_vertical: false
                        },
                        arrows: {
                            style: "hades",
                            enable: true,
                            hide_onmobile: false,
                            hide_onleave: false,
                            
                            left: {
                                h_align: "left",
                                v_align: "center",
                                h_offset: 10,
                                v_offset: 0
                            },
                            right: {
                                h_align: "right",
                                v_align: "center",
                                h_offset: 10,
                                v_offset: 0
                            }
                        },
                        
                    },

				soloArrowLeftHalign:"left",
				soloArrowLeftValign:"center",
				soloArrowLeftHOffset:20,
				soloArrowLeftVOffset:0,

				soloArrowRightHalign:"right",
				soloArrowRightValign:"center",
				soloArrowRightHOffset:20,
				soloArrowRightVOffset:0,

				shadow:0,
				fullWidth:"off",
				fullScreen:"on",

				spinner:"spinner0",

				stopLoop:"off",
				stopAfterLoops:-1,
				stopAtSlide:-1,

				shuffle:"off",


				forceFullWidth:"off",
				fullScreenAlignForce:"off",

				hideThumbsOnMobile:"off",
				hideNavDelayOnMobile:1500,
				hideBulletsOnMobile:"off",
				hideArrowsOnMobile:"off",
				hideThumbsUnderResolution:0,

				hideSliderAtLimit:0,
				hideCaptionAtLimit:0,
				hideAllCaptionAtLilmit:0,
				startWithSlide:0,
			});

			apiRevoSlider.bind("revolution.slide.onloaded",function (e) {
				setTimeout( function(){ SEMICOLON.slider.sliderParallaxDimensions(); }, 200 );
			});

			apiRevoSlider.bind("revolution.slide.onchange",function (e,data) {
				SEMICOLON.slider.revolutionSliderMenu();
			});

		}); //ready

	</script>

</body>
</html>