<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPage"
	value="${pageContext.servletContext.contextPath}" scope="session"></c:set>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>AdminLTE 3 | Dashboard 2</title>

<!-- Google Font: Source Sans Pro -->
<link rel="stylesheet"
	href="${contextPage}/resources/admin/https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<!-- Font Awesome Icons -->
<link rel="stylesheet"
	href="${contextPage}/resources/admin/plugins/fontawesome-free/css/all.min.css">
<!-- overlayScrollbars -->
<link rel="stylesheet"
	href="${contextPage}/resources/admin/plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
<!-- Theme style -->
<link rel="stylesheet"
	href="${contextPage}/resources/admin/dist/css/adminlte.min.css">
<script src="${pageContext.servletContext.contextPath}/resources/ckeditor/ckeditor.js"></script>
<style>
.error {
	color: red;
}
</style>
</head>
<body
	class="hold-transition dark-mode sidebar-mini layout-fixed layout-navbar-fixed layout-footer-fixed">
	<div class="wrapper">

		<!-- Preloader -->
		<div
			class="preloader flex-column justify-content-center align-items-center">
			<img class="animation__wobble"
				src="${contextPage}/resources/admin/dist/img/AdminLTELogo.png"
				alt="AdminLTELogo" height="60" width="60">
		</div>

		<!-- Navbar -->
		<nav class="main-header navbar navbar-expand navbar-dark">
			<!-- Left navbar links -->
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link" data-widget="pushmenu"
					href="${contextPage}/resources/admin/#" role="button"><i
						class="fas fa-bars"></i></a></li>
				<li class="nav-item d-none d-sm-inline-block"><a
					href="${contextPage}/admin" class="nav-link">Home</a></li>
			</ul>

			<!-- Right navbar links -->
			<ul class="navbar-nav ml-auto">
				<!-- Navbar Search -->
				<li class="nav-item"><a class="nav-link"
					data-widget="navbar-search" href="${contextPage}/resources/admin/#"
					role="button"> <i class="fas fa-search"></i>
				</a>
					<div class="navbar-search-block">
						<form class="form-inline" action="${contextPage}/admin/search" method="get">
							<div class="input-group input-group-sm">
								<input class="form-control form-control-navbar" type="search"
									placeholder="Search name" aria-label="Search" name="search">
								<input type="hidden" name="page" value="${page}">
								<div class="input-group-append">
									<button class="btn btn-navbar" type="submit">
										<i class="fas fa-search"></i>
									</button>
									<button class="btn btn-navbar" type="button"
										data-widget="navbar-search">
										<i class="fas fa-times"></i>
									</button>
								</div>
							</div>
						</form>
					</div></li>
				<li class="nav-item"><a class="nav-link"
					href="${contextPage }/admin/exit"> <i
						class="fas fa-arrow-circle-right"></i>
				</a></li>
			</ul>
		</nav>
		<!-- /.navbar -->

		<!-- Main Sidebar Container -->
		<aside class="main-sidebar sidebar-dark-primary elevation-4">
			<!-- Brand Logo -->
			<a href="${contextPage}/resources/admin/index3.html"
				class="brand-link"> <img
				src="${contextPage}/resources/admin/dist/img/AdminLTELogo.png"
				alt="AdminLTE Logo" class="brand-image img-circle elevation-3"
				style="opacity: .8"> <span
				class="brand-text font-weight-light">AdminLTE 3</span>
			</a>

			<!-- Sidebar -->
			<div class="sidebar">
				<!-- Sidebar user panel (optional) -->
				<div class="user-panel mt-3 pb-3 mb-3 d-flex">
					<div class="image">
						<img
							src="${contextPage}/${sessionScope.picture}"
							class="img-circle elevation-2" alt="User Image">
					</div>
					<div class="info">
						<a href="" class="d-block" style="text-transform: uppercase;">${sessionScope.name}</a>
					</div>
				</div>


				<!-- Sidebar Menu -->
				<nav class="mt-2">
					<ul class="nav nav-pills nav-sidebar flex-column"
						data-widget="treeview" role="menu" data-accordion="false">
						<li class="nav-item"><a href="${contextPage}/admin/account"
							class="nav-link"> <i class="nav-icon fas fa-circle"></i>
								<p>Account</p>
						</a></li>
						<li class="nav-item"><a href="${contextPage}/admin/category?currentPage=1"
							class="nav-link"> <i class="nav-icon fas fa-circle"></i>
								<p>Category</p>
						</a></li>
						<li class="nav-item"><a href="${contextPage}/admin/product"
							class="nav-link"> <i class="nav-icon fas fa-circle"></i>
								<p>Product</p>
						</a></li>
						<li class="nav-item"><a href="${contextPage}/admin/order"
							class="nav-link"> <i class="nav-icon fas fa-circle"></i>
								<p>Order</p>
						</a></li>
						
					</ul>
				</nav>
				<!-- /.sidebar-menu -->
			</div>
			<!-- /.sidebar -->
		</aside>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<c:if test="${!empty page}">
				<jsp:include page="${page}.jsp"></jsp:include>
			</c:if>
		</div>
		<!-- /.content-wrapper -->

		<!-- Control Sidebar -->
		<aside class="control-sidebar control-sidebar-dark">
			<!-- Control sidebar content goes here -->
		</aside>
		<!-- /.control-sidebar -->

		<!-- Main Footer -->
		<footer class="main-footer">
			<strong>Copyright &copy; 2014-2021 <a
				href="${contextPage}/resources/admin/https://adminlte.io">AdminLTE.io</a>.
			</strong> All rights reserved.
			<div class="float-right d-none d-sm-inline-block">
				<b>Version</b> 3.1.0
			</div>
		</footer>
	</div>
	<!-- ./wrapper -->

	<!-- REQUIRED SCRIPTS -->
	<!-- jQuery -->
	<script
		src="${contextPage}/resources/admin/plugins/jquery/jquery.min.js"></script>
	<!-- Bootstrap -->
	<script
		src="${contextPage}/resources/admin/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- overlayScrollbars -->
	<script
		src="${contextPage}/resources/admin/plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
	<!-- AdminLTE App -->
	<script src="${contextPage}/resources/admin/dist/js/adminlte.js"></script>

	<!-- PAGE PLUGINS -->
	<!-- jQuery Mapael -->
	<script
		src="${contextPage}/resources/admin/plugins/jquery-mousewheel/jquery.mousewheel.js"></script>
	<script
		src="${contextPage}/resources/admin/plugins/raphael/raphael.min.js"></script>
	<script
		src="${contextPage}/resources/admin/plugins/jquery-mapael/jquery.mapael.min.js"></script>
	<script
		src="${contextPage}/resources/admin/plugins/jquery-mapael/maps/usa_states.min.js"></script>
	<!-- ChartJS -->
	<script
		src="${contextPage}/resources/admin/plugins/chart.js/Chart.min.js"></script>

	<!-- AdminLTE for demo purposes -->
	<script src="${contextPage}/resources/admin/dist/js/demo.js"></script>
	<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
	<script
		src="${contextPage}/resources/admin/dist/js/pages/dashboard2.js"></script>
</body>
</html>
