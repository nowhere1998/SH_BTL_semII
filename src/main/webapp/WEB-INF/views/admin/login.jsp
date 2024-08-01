<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPage" value="${pageContext.servletContext.contextPath}" scope="session"></c:set>

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
	<div class="content-area">

                <!-- PAGE -->
                <section class="page-section color">
                    <div class="container">
                        <div class="row">
                            <div class="col-sm-12">
                                <h3 class="block-title text-center">Login</h3>
                                <p style="color:red;">${msg}</p>
                                <form action="admin-login" method="post" class="form-login">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group"><input class="form-control" type="text" name="name" placeholder="User name or email" value="${name }"></div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="form-group"><input class="form-control" type="password" name="password" placeholder="Your password" value="${password }"></div>
                                        </div>
                                        <div class="col-md-12 col-lg-6">
                                            <div class="checkbox">
                                                <label><input type="checkbox"> Remember me</label>
                                            </div>
                                        </div>
                                        <div class="col-md-12 col-lg-6 text-right-lg">
                                            <a class="forgot-password" href="#">forgot password?</a>
                                        </div>
                                        <div class="col-md-12">
                                        	<button type="submit">
                                        		Sign in
                                        	</button>
                                            
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </section>
                <!-- /PAGE -->

            </div>
            <!-- /CONTENT AREA -->

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

</body>

<!-- Mirrored from jthemes.net/themes/html/bellashop/index-3.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 14 Jun 2024 13:22:50 GMT -->
</html>