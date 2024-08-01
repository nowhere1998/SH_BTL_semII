<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPage"
	value="${pageContext.servletContext.contextPath}" scope="session"></c:set>

<!DOCTYPE html>
<html lang="en">

<!-- Mirrored from jthemes.net/themes/html/bellashop/index-3.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 14 Jun 2024 13:22:49 GMT -->
<head>
<meta charset="utf-8">
<!--[if IE]><meta http-equiv="X-UA-Compatible" content="IE=edge"><![endif]-->
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Bella Shop</title>

<!-- Favicon -->
<link rel="apple-touch-icon-precomposed" sizes="144x144"
	href="${contextPage}/resources/user/assets/ico/apple-touch-icon-144-precomposed.png">
<link rel="shortcut icon"
	href="${contextPage}/resources/user/assets/ico/favicon.ico">

<!-- CSS Global -->
<link
	href="${contextPage}/resources/user/assets/plugins/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="${contextPage}/resources/user/assets/plugins/bootstrap-select/css/bootstrap-select.min.css"
	rel="stylesheet">
<link
	href="${contextPage}/resources/user/assets/plugins/fontawesome/css/font-awesome.min.css"
	rel="stylesheet">
<link
	href="${contextPage}/resources/user/assets/plugins/prettyphoto/css/prettyPhoto.css"
	rel="stylesheet">
<link
	href="${contextPage}/resources/user/assets/plugins/owl-carousel2/assets/owl.carousel.min.css"
	rel="stylesheet">
<link
	href="${contextPage}/resources/user/assets/plugins/owl-carousel2/assets/owl.theme.default.min.css"
	rel="stylesheet">
<link
	href="${contextPage}/resources/user/assets/plugins/animate/animate.min.css"
	rel="stylesheet">

<!-- Theme CSS -->
<link href="${contextPage}/resources/user/assets/css/theme.css"
	rel="stylesheet">
<link href="${contextPage}/resources/user/assets/css/theme-green-1.css"
	rel="stylesheet" id="theme-config-link">

<!-- Head Libs -->
<script
	src="${contextPage}/resources/user/assets/plugins/modernizr.custom.js"></script>

</head>
<body id="home" class="wide">
	<!-- PRELOADER -->
	<div id="preloader">
		<div id="preloader-status">
			<div class="spinner">
				<div class="rect1"></div>
				<div class="rect2"></div>
				<div class="rect3"></div>
				<div class="rect4"></div>
				<div class="rect5"></div>
			</div>
			<div id="preloader-title">Loading</div>
		</div>
	</div>
	<!-- /PRELOADER -->

	<!-- WRAPPER -->
	<div class="wrapper">

		<!-- Popup: Shopping cart items -->
		<div class="modal fade popup-cart" id="popup-cart" tabindex="-1"
			role="dialog" aria-hidden="true"></div>
		<!-- /Popup: Shopping cart items -->

		<!-- Header top bar -->
		<div class="top-bar">
			<div class="container">
				<div class="top-bar-left">
					<ul class="list-inline">
						<li class="icon-user"><c:if
								test="${empty sessionScope.userId }">
								<a href="login"><img
									src="${contextPage}/resources/user/assets/img/icon-1.png"
									alt="" /> <span>Login</span></a>
							</c:if> <c:if test="${!empty sessionScope.userId}">
								<a href="login"><img
									src="${contextPage}/resources/user/assets/img/icon-1.png"
									alt="" /> <span style="text-transform: uppercase;">${sessionScope.userName}</span></a>
							</c:if></li>
						<c:if test="${empty sessionScope.userId}">
							<li class="icon-form"><a href="register"><img
									src="${contextPage}/resources/user/assets/img/icon-2.png"
									alt="" /> <span>Not a Member? <span class="colored">Sign
											Up</span>
								</span></a></li>
						</c:if>
						<c:if test="${!empty sessionScope.userId}">
							<li class="icon-form"><a href="exit"><img
									src="${contextPage}/resources/user/assets/img/icon-2.png"
									alt="" /> <span>Log out</span></a></li>
						</c:if>
						<li><a href="#"><i class="fa fa-envelope"></i> <span>support@yourdomain.com</span></a></li>
					</ul>
				</div>
				<div class="top-bar-right">
					<ul class="list-inline">
						<li class="hidden-xs"><a href="about">About</a></li>
						<li class="hidden-xs"><a href="blog">Blog</a></li>
						<li class="hidden-xs"><a href="contact">Contact</a></li>
						<li class="faq"><a href="faq">FAQ</a></li>
						<li class="hidden-xs"><a href="wishlist">My Wishlist</a></li>
						<li class="dropdown flags"><a
							href="${contextPage}/resources/user/#" class="dropdown-toggle"
							data-toggle="dropdown"><img
								src="${contextPage}/resources/user/assets/img/flag.gif" alt="" />
								Eng</a></li>
					</ul>
				</div>
			</div>
		</div>
		<!-- /Header top bar -->

		<!-- HEADER -->
		<header class="header fixed">
			<div class="header-wrapper">
				<div class="container">

					<!-- Logo -->
					<div class="logo">
						<a href="${contextPage}/resources/user/index.html"><img
							src="${contextPage}/resources/user/assets/img/logo-bella-shop.png"
							alt="Bella Shop" /></a>
					</div>
					<!-- /Logo -->

					<!-- Header search -->
					<div class="header-search">
						<input class="form-control" type="text"
							placeholder="What are you looking?" />
						<button>
							<i class="fa fa-search"></i>
						</button>
					</div>
					<!-- /Header search -->

					<!-- Header shopping cart -->
					<div class="header-cart">
						<div class="cart-wrapper">
							<a href="${contextPage}/cart" class="btn btn-theme-transparent"><i
								class="fa fa-shopping-cart"></i> <span class="hidden-xs">
									Cart</span></a>
							<!-- Mobile menu toggle button -->
							<a href="${contextPage}/resources/user/#"
								class="menu-toggle btn btn-theme-transparent"><i
								class="fa fa-bars"></i></a>
							<!-- /Mobile menu toggle button -->
						</div>
					</div>
					<!-- Header shopping cart -->
				</div>
			</div>
			<div class="navigation-wrapper">
				<div class="container">
					<!-- Navigation -->
					<nav class="navigation closed clearfix">
						<a href="${contextPage}/resources/user/#"
							class="menu-toggle-close btn"><i class="fa fa-times"></i></a>
						<ul class="nav sf-menu">
							<li ${page.equals("home")?"class='active'":"" }><a href="${contextPage}/home">Homepage</a></li>
							<li ${page.equals("shop") && parentName==null?"class='active'":"" }><a href="${contextPage}/shop">Shop</a></li>
							<li ${page.equals("blog")?"class='active'":"" }><a href="${contextPage}/blog">Blog</a></li>
							<li ${parentName.equals("men")?"class='active'":"" }><a href="${contextPage}/shop?parentName=men">Men</a></li>
							<li ${parentName.equals("women")?"class='active'":"" }><a href="${contextPage}/shop?parentName=women">Women</a></li>
							<li ${parentName.equals("kid")?"class='active'":"" }><a href="${contextPage}/shop?parentName=kid">Kids</a></li>
							<li ${page.equals("contact")?"class='active'":"" }><a href="${contextPage}/contact">Contact</a></li>
						</ul>
					</nav>
					<!-- /Navigation -->
				</div>
			</div>
		</header>
		<!-- /HEADER -->

		<!-- CONTENT AREA -->
		<div class="content-area">

			<c:if test="${!empty page}">
				<jsp:include page="user/${page}.jsp"></jsp:include>
			</c:if>

		</div>
		<!-- /CONTENT AREA -->

		<!-- FOOTER -->
		<footer class="footer">
			<div class="footer-widgets">
				<div class="container">
					<div class="row">

						<div class="col-md-3">
							<div class="widget">
								<h4 class="widget-title">About Us</h4>
								<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
									Curabitur sollicitudin ultrices suscipit. Sed commodo vel
									mauris vel dapibus. Lorem ipsum dolor sit amet, consectetur
									adipiscing elit.</p>
								<ul class="social-icons">
									<li><a href="" class="facebook"><i
											class="fa fa-facebook"></i></a></li>
									<li><a href="" class="twitter"><i
											class="fa fa-twitter"></i></a></li>
									<li><a href="" class="instagram"><i
											class="fa fa-instagram"></i></a></li>
									<li><a href="" class="pinterest"><i
											class="fa fa-pinterest"></i></a></li>
								</ul>
							</div>
						</div>
						<div class="col-md-3">
							<div class="widget">
								<h4 class="widget-title">News Letter</h4>
								<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
								<form action="#">
									<div class="form-group">
										<input class="form-control" type="text"
											placeholder="Enter Your Mail and Get $10 Cash" />
									</div>
									<div class="form-group">
										<button class="btn btn-theme btn-theme-transparent">Subscribe</button>
									</div>
								</form>
							</div>
						</div>
						<div class="col-md-3">
							<div class="widget widget-categories">
								<h4 class="widget-title">Information</h4>
								<ul>
									<li><a href="">About Us</a></li>
									<li><a href="">Delivery Information</a></li>
									<li><a href="">Contact Us</a></li>
									<li><a href="">Terms and Conditions</a></li>
									<li><a href="">Private Policy</a></li>
								</ul>
							</div>
						</div>
						<div class="col-md-3">
							<div class="widget widget-tag-cloud">
								<h4 class="widget-title">Item Tags</h4>
								<ul>
									<li><a href="">Fashion</a></li>
									<li><a href="">Jeans</a></li>
									<li><a href="">Top Sellers</a></li>
									<li><a href="">E commerce</a></li>
									<li><a href="">Hot Deals</a></li>
									<li><a href="">Supplier</a></li>
									<li><a href="">Shop</a></li>
									<li><a href="">Theme</a></li>
									<li><a href="">Website</a></li>
									<li><a href="">Isamercan</a></li>
									<li><a href="">Themeforest</a></li>
								</ul>
							</div>
						</div>

					</div>
				</div>
			</div>
			<div class="footer-meta">
				<div class="container">
					<div class="row">

						<div class="col-sm-6">
							<div class="copyright">Copyright 2014 BELLA SHOP | All
								Rights Reserved | Designed By Jthemes</div>
						</div>
						<div class="col-sm-6">
							<div class="payments">
								<ul>
									<li><img
										src="${contextPage}/resources/user/assets/img/preview/payments/visa.jpg"
										alt="" /></li>
									<li><img
										src="${contextPage}/resources/user/assets/img/preview/payments/mastercard.jpg"
										alt="" /></li>
									<li><img
										src="${contextPage}/resources/user/assets/img/preview/payments/paypal.jpg"
										alt="" /></li>
									<li><img
										src="${contextPage}/resources/user/assets/img/preview/payments/american-express.jpg"
										alt="" /></li>
									<li><img
										src="${contextPage}/resources/user/assets/img/preview/payments/visa-electron.jpg"
										alt="" /></li>
									<li><img
										src="${contextPage}/resources/user/assets/img/preview/payments/maestro.jpg"
										alt="" /></li>
								</ul>
							</div>
						</div>

					</div>
				</div>
			</div>
		</footer>
		<!-- /FOOTER -->

		<div id="to-top" class="to-top">
			<i class="fa fa-angle-up"></i>
		</div>

	</div>
	<!-- /WRAPPER -->

	<!-- JS Global -->
	<script
		src="${contextPage}/resources/user/assets/plugins/jquery/jquery-1.11.1.min.js"></script>
	<script
		src="${contextPage}/resources/user/assets/plugins/bootstrap/js/bootstrap.min.js"></script>
	<script
		src="${contextPage}/resources/user/assets/plugins/bootstrap-select/js/bootstrap-select.min.js"></script>
	<script
		src="${contextPage}/resources/user/assets/plugins/superfish/js/superfish.min.js"></script>
	<script
		src="${contextPage}/resources/user/assets/plugins/prettyphoto/js/jquery.prettyPhoto.js"></script>
	<script
		src="${contextPage}/resources/user/assets/plugins/owl-carousel2/owl.carousel.min.js"></script>
	<script
		src="${contextPage}/resources/user/assets/plugins/jquery.sticky.min.js"></script>
	<script
		src="${contextPage}/resources/user/assets/plugins/jquery.easing.min.js"></script>
	<script
		src="${contextPage}/resources/user/assets/plugins/jquery.smoothscroll.min.js"></script>
	<script
		src="${contextPage}/resources/user/assets/plugins/smooth-scrollbar.min.js"></script>

	<!-- JS Page Level -->
	<script src="${contextPage}/resources/user/assets/js/theme.js"></script>

	<!--[if (gte IE 9)|!(IE)]><!-->
	<script
		src="${contextPage}/resources/user/assets/plugins/jquery.cookie.js"></script>
	<!--<![endif]-->

	<script>
		var path = '${pageContext.servletContext.contextPath}';
	</script>
	<script type="text/javascript"
		src="${contextPage}/resources/user/assets/js/home.js"></script>
</body>

<!-- Mirrored from jthemes.net/themes/html/bellashop/index-3.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 14 Jun 2024 13:22:50 GMT -->
</html>