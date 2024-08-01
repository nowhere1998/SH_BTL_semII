<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- PAGE -->
<section class="page-section no-padding slider">
	<div class="container full-width">

		<div class="main-slider">
			<div class="owl-carousel" id="main-slider">

				<!-- Slide 1 -->
				<div class="item slide1">
					<img class="slide-img"
						src="${contextPage}/resources/user/assets/img/preview/slider/slide-1.jpg"
						alt="" />
					<div class="caption">
						<div class="container">
							<div class="div-table">
								<div class="div-cell">
									<div class="caption-content">
										<h2 class="caption-title">The Biggest</h2>
										<h3 class="caption-subtitle">Sale</h3>
										<p class="caption-text">
											<a class="btn btn-theme"
												href="${contextPage}/resources/user/#">Shop Now</a>
										</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- /Slide 1 -->

				<!-- Slide 2 -->
				<div class="item slide2 alt">
					<img class="slide-img"
						src="${contextPage}/resources/user/assets/img/preview/slider/slide-2.jpg"
						alt="" />
					<div class="caption">
						<div class="container">
							<div class="div-table">
								<div class="div-cell">
									<div class="caption-content">
										<h2 class="caption-title">New Arrivals On Sale</h2>
										<h3 class="caption-subtitle">
											<span>Summer Collection</span>
										</h3>
										<div class="price">
											<span>$</span>
											<ins>49</ins>
											<span>$</span>
											<del>86</del>
										</div>
										<p class="caption-text">
											<a class="btn btn-theme"
												href="${contextPage}/resources/user/#">Shop this item
												Now</a>
										</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- /Slide 2 -->

				<!-- Slide 3 -->
				<div class="item slide3 dark">
					<img class="slide-img"
						src="${contextPage}/resources/user/assets/img/preview/slider/slide-3.jpg"
						alt="" />
					<div class="caption">
						<div class="container">
							<div class="div-table">
								<div class="div-cell">
									<div class="caption-content">
										<h2 class="caption-title">New Arrivals On Sale</h2>
										<h3 class="caption-subtitle">
											<span>Summer Collection</span>
										</h3>
										<p class="caption-text">
											<a class="btn btn-theme"
												href="${contextPage}/resources/user/#">Shop this item
												Now</a>
										</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- /Slide 3 -->

			</div>
		</div>

	</div>
</section>
<!-- /PAGE -->

<!-- PAGE -->
<section class="page-section">
	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<div
					class="thumbnail no-border no-padding thumbnail-banner size-1x3">
					<div class="media">
						<a class="media-link" href="${contextPage}/resources/user/#">
							<div class="img-bg"
								style="background-image: url('${contextPage}/resources/user/assets/img/preview/shop/banner-1.jpg')"></div>
							<div class="caption">
								<div class="caption-wrapper div-table">
									<div class="caption-inner div-cell">
										<h2 class="caption-title">
											<span>Lorem Ipsum</span>
										</h2>
										<h3 class="caption-sub-title">
											<span>Dolor Sir Amet Percpectum</span>
										</h3>
										<span class="btn btn-theme btn-theme-sm">Shop Now</span>
									</div>
								</div>
							</div>
						</a>
					</div>
				</div>
			</div>
			<div class="col-md-3">
				<div
					class="thumbnail no-border no-padding thumbnail-banner size-1x1">
					<div class="media">
						<a class="media-link" href="${contextPage}/resources/user/#">
							<div class="img-bg"
								style="background-image: url('${contextPage}/resources/user/assets/img/preview/shop/banner-6.jpg')"></div>
							<div class="caption text-center">
								<div class="caption-wrapper div-table">
									<div class="caption-inner div-cell">
										<h2 class="caption-title">
											<span>Lorem Ipsum</span>
										</h2>
										<h3 class="caption-sub-title">
											<span>Dolor Sir Amet Percpectum</span>
										</h3>
										<span class="btn btn-theme btn-theme-sm">Shop Now</span>
									</div>
								</div>
							</div>
						</a>
					</div>
				</div>
			</div>
			<div class="col-md-3">
				<div
					class="thumbnail no-border no-padding thumbnail-banner size-1x1">
					<div class="media">
						<a class="media-link" href="${contextPage}/resources/user/#">
							<div class="img-bg"
								style="background-image: url('${contextPage}/resources/user/assets/img/preview/shop/banner-7.jpg')"></div>
							<div class="caption text-center">
								<div class="caption-wrapper div-table">
									<div class="caption-inner div-cell">
										<h2 class="caption-title">
											<span>Lorem Ipsum</span>
										</h2>
										<h3 class="caption-sub-title">
											<span>Dolor Sir Amet Percpectum</span>
										</h3>
										<span class="btn btn-theme btn-theme-sm">Shop Now</span>
									</div>
								</div>
							</div>
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- /PAGE -->

<!-- PAGE -->
<section class="page-section">
	<div class="container">

		<div class="tabs">
			<ul id="tabs" class="nav nav-justified-off">
				<!--
                                -->
				<li class=""><a href="${contextPage}/resources/user/#tab-1"
					data-toggle="tab">Featured</a></li>
				<!--
                                -->
				<li class="active"><a
					href="${contextPage}/resources/user/#tab-2" data-toggle="tab">Newest</a></li>
				<!--
                                -->
				<li class=""><a href="${contextPage}/resources/user/#tab-3"
					data-toggle="tab">Top Sellers</a></li>
			</ul>
		</div>

		<div class="tab-content">

			<!-- tab 1 -->

			<!-- tab 2 -->
			<div class="tab-pane fade active in" id="tab-2">
				<div class="row">
					<c:forEach items="${product }" var="p">
						<div class="col-md-3 col-sm-6">
							<div class="thumbnail no-border no-padding">
								<div class="media">
									<a class="media-link" data-gal="prettyPhoto"
										href="${contextPage}/resources/user/assets/img/preview/shop/product-1-big.jpg">
										<img src="${contextPage}/${p.img}" alt="" /> <span
										class="icon-view"><strong><i class="fa fa-eye"></i></strong></span>
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
											href="#"><i
											class="fa fa-heart"></i></a>
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
											href="#"><i
											class="fa fa-exchange"></i></a>
									</div>
								</div>
							</div>
						</div>

					</c:forEach>
				</div>
			</div>

			<!-- tab 3 -->

		</div>

	</div>
</section>
<!-- /PAGE -->