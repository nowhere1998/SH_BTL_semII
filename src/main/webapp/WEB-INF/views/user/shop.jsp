<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- BREADCRUMBS -->
<section class="page-section breadcrumbs">
	<div class="container">
		<div class="page-header">
			<h1>Category Page</h1>
		</div>
	</div>
</section>
<!-- /BREADCRUMBS -->

<!-- PAGE WITH SIDEBAR -->
<section class="page-section with-sidebar">
	<div class="container">
		<div class="row">
			<!-- SIDEBAR -->
			<aside class="col-md-3 sidebar" id="sidebar">
				<!-- widget search -->
				<form action="">
					<div class="widget">
						<div class="widget-search">
							<input class="form-control" type="text" placeholder="Search"
								name="search">
							<button>
								<i class="fa fa-search"></i>
							</button>
						</div>
					</div>
				</form>
				<!-- /widget search -->
				<!-- widget shop categories -->
				<div class="widget shop-categories">
					<h4 class="widget-title">Categories</h4>
					<div class="widget-content">
						<ul>
							<li><span class="arrow"><i class="fa fa-angle-down"></i></span>
								<a href="${contextPage}/shop?parentName=women">Women</a>
								<ul class="children">
									<c:forEach var="w" items="${women}">
										<li><a href="${contextPage}/shop?categoryId=${w.id}">${w.name}</a></li>
									</c:forEach>
								</ul></li>
							<li><span class="arrow"><i class="fa fa-angle-down"></i></span>
								<a href="${contextPage}/shop?parentName=men">Men</a>
								<ul class="children">
									<c:forEach var="m" items="${men}">
										<li><a href="${contextPage}/shop?categoryId=${m.id}">${m.name}</a></li>
									</c:forEach>
								</ul></li>
							<li><span class="arrow"><i class="fa fa-angle-down"></i></span>
								<a href="${contextPage}/shop?parentName=kid">Kid</a>
								<ul class="children">
									<c:forEach var="k" items="${kid}">
										<li><a href="${contextPage}/shop?categoryId=${k.id}">${k.name}</a></li>
									</c:forEach>
								</ul></li>

						</ul>
					</div>
				</div>
				<!-- /widget shop categories -->
				<!-- widget product color -->

				<!-- /widget product color -->
				<!-- widget price filter -->

				<!-- /widget price filter -->
				<!-- widget tabs -->

				<!-- /widget tabs -->
				<!-- widget tag cloud -->

				<!-- /widget tag cloud -->
				<!-- widget products carousel -->

				<!-- /widget products carousel -->
				<!-- widget shop hot deals -->

				<!-- /widget shop hot deals -->
			</aside>
			<!-- /SIDEBAR -->
			<!-- CONTENT -->
			<div class="col-md-9 content" id="content">

				<div class="main-slider sub">
					<div class="owl-carousel" id="main-slider">

						<!-- Slide 1 -->
						<div class="item slide1 sub">
							<img class="slide-img"
								src="${contextPage}/resources/user/assets/img/preview/slider/slide-1-sub.jpg"
								alt="" />
							<div class="caption">
								<div class="container">
									<div class="div-table">
										<div class="div-cell">
											<div class="caption-content">
												<h2 class="caption-title">
													<span>Winter Fashion</span>
												</h2>
												<h3 class="caption-subtitle">
													<span>Collection Ready</span>
												</h3>
												<p class="caption-text">
													<a class="btn btn-theme" href="#">Shop Now</a>
												</p>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- /Slide 1 -->

						<!-- Slide 2 -->
						<div class="item slide2 sub">
							<img class="slide-img"
								src="${contextPage}/resources/user/assets/img/preview/slider/slide-1-sub.jpg"
								alt="" />
							<div class="caption">
								<div class="container">
									<div class="div-table">
										<div class="div-cell">
											<div class="caption-content">
												<h2 class="caption-title">
													<span>Winter Fashion</span>
												</h2>
												<h3 class="caption-subtitle">
													<span>Collection Ready</span>
												</h3>
												<p class="caption-text">
													<a class="btn btn-theme" href="#">Shop Now</a>
												</p>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- /Slide 2 -->

					</div>
				</div>

				<!-- shop-sorting -->
				<div class="shop-sorting">
					<div class="row"></div>
				</div>
				<!-- /shop-sorting -->

				<!-- Products grid -->
				<div class="row products grid">
					<c:if test="${parentName==null}">
						<c:forEach var="p" items="${product}">
							<div class="col-md-4 col-sm-6">
								<div class="thumbnail no-border no-padding">
									<div class="media">
										<a class="media-link" href="${contextPage}/resources/user/#">
											<img src="${contextPage}/${p.img}" alt=""
											style="min-height: 300px; max-height: 300px" /> <span
											class="icon-view"> <strong><i
													class="fa fa-eye"></i></strong>
										</span>
										</a>
									</div>
									<div class="caption text-center">
										<h4 class="caption-title">
											<a href="${contextPage}/product-detail/${p.id}">${p.name}</a>
										</h4>
										<div class="rating">
											<span class="star"></span>
											<!--
                                                    -->
											<span class="star active"></span>
											<!--
                                                    -->
											<span class="star active"></span>
											<!--
                                                    -->
											<span class="star active"></span>
											<!--
                                                    -->
											<span class="star active"></span>
										</div>
										<div class="price">
											<ins>$400.00</ins>
											<del>$425.00</del>
										</div>
										<div class="buttons">
											<a class="btn btn-theme btn-theme-transparent btn-wish-list"
												href="#"><i class="fa fa-heart"></i></a>
											<!--
                                                    -->
											<button
												class="btn btn-theme btn-theme-transparent btn-icon-left"
												onclick="addProduct(${p.id})">
												<i class="fa fa-shopping-cart"></i>Add to Cart
											</button>
											<!--
                                                    -->
											<a class="btn btn-theme btn-theme-transparent btn-compare"
												href="#"><i class="fa fa-exchange"></i></a>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</c:if>
					<c:if test="${!empty parentName}">
						<c:forEach var="p" items="${product}">
							<c:forEach var="c" items="${category}">
								<c:if test="${p.categoryId==c.id }">
									<div class="col-md-4 col-sm-6">
										<div class="thumbnail no-border no-padding">
											<div class="media">
												<a class="media-link" href="${contextPage}/resources/user/#">
													<img src="${contextPage}/${p.img}" alt=""
													style="min-height: 300px; max-height: 300px" /> <span
													class="icon-view"> <strong><i
															class="fa fa-eye"></i></strong>
												</span>
												</a>
											</div>
											<div class="caption text-center">
												<h4 class="caption-title">
													<a href="${contextPage}/product-detail/${p.id}">${p.name}</a>
												</h4>
												<div class="rating">
													<span class="star"></span>
													<!--
                                                    -->
													<span class="star active"></span>
													<!--
                                                    -->
													<span class="star active"></span>
													<!--
                                                    -->
													<span class="star active"></span>
													<!--
                                                    -->
													<span class="star active"></span>
												</div>
												<div class="price">
													<ins>$400.00</ins>
													<del>$425.00</del>
												</div>
												<div class="buttons">
													<a
														class="btn btn-theme btn-theme-transparent btn-wish-list"
														href="#"><i class="fa fa-heart"></i></a>
													<!--
                                                    -->
													<button
														class="btn btn-theme btn-theme-transparent btn-icon-left"
														onclick="addProduct(${p.id})">
														<i class="fa fa-shopping-cart"></i>Add to Cart
													</button>
													<!--
                                                    -->
													<a class="btn btn-theme btn-theme-transparent btn-compare"
														href="#"><i class="fa fa-exchange"></i></a>
												</div>
											</div>
										</div>
									</div>
								</c:if>
							</c:forEach>
						</c:forEach>
					</c:if>
				</div>
				<!-- /Products grid -->

				<!-- Pagination -->
				<div class="pagination-wrapper">
					<ul class="pagination">
						<c:if test="${currentPage!=1}">
							<li><a
								href="${contextPage}/shop?categoryId=${categoryId}&currentPage=${currentPage-1}"><i
									class="fa fa-angle-double-left"></i> Previous</a></li>
						</c:if>
						<c:forEach var="i" begin="1" end="${totalPage}">
							<li><a ${i==currentPage?"style='background: gray;'":"" }
								href="${contextPage}/shop?categoryId=${categoryId}&currentPage=${i}">${i}
							</a></li>
						</c:forEach>
						<c:if test="${currentPage!=totalPage}">
							<li><a
								href="${contextPage}/shop?categoryId=${categoryId}&currentPage=${currentPage+1}">Next
									<i class="fa fa-angle-double-right"></i>
							</a></li>
						</c:if>
					</ul>
				</div>
				<!-- /Pagination -->

			</div>
			<!-- /CONTENT -->

		</div>
	</div>
</section>
<!-- /PAGE WITH SIDEBAR -->

<!-- PAGE -->
<section class="page-section no-padding-top">
	<div class="container">
		<div class="row blocks shop-info-banners">
			<div class="col-md-4">
				<div class="block">
					<div class="media">
						<div class="pull-right">
							<i class="fa fa-gift"></i>
						</div>
						<div class="media-body">
							<h4 class="media-heading">Buy 1 Get 1</h4>
							Proin dictum elementum velit. Fusce euismod consequat ante.
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="block">
					<div class="media">
						<div class="pull-right">
							<i class="fa fa-comments"></i>
						</div>
						<div class="media-body">
							<h4 class="media-heading">Call to Free</h4>
							Proin dictum elementum velit. Fusce euismod consequat ante.
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="block">
					<div class="media">
						<div class="pull-right">
							<i class="fa fa-trophy"></i>
						</div>
						<div class="media-body">
							<h4 class="media-heading">Money Back!</h4>
							Proin dictum elementum velit. Fusce euismod consequat ante.
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- /PAGE -->