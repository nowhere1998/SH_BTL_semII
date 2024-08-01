<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="total" value="0"/>
<!-- CONTENT AREA -->
<div class="content-area">
	<h1 class="text-center" style="color: green; text-transform: uppercase;">${msg}</h1>
	<!-- BREADCRUMBS -->
	<section class="page-section breadcrumbs">
		<div class="container">
			<div class="page-header">
				<h1>Shopping Cart</h1>
			</div>
		</div>
	</section>
	<!-- /BREADCRUMBS -->

	<!-- PAGE -->
	<section class="page-section color">
		<div class="container">
			<c:if test="${empty sessionScope.userId}">
				<div class="row">
					<div class="col-md-12">
						<p class="btn-row text-center">
							<a class="btn btn-theme btn-theme-dark"
								href="${contextPage}/login">Login</a> <span class="text">
								or </span> <a class="btn btn-theme btn-theme-dark"
								href="${contextPage}/register">Create account</a>
						</p>
					</div>
				</div>
			</c:if>

			<c:if test="${!empty sessionScope.userId}">
				<h3 class="block-title alt">
					<i class="fa fa-angle-down"></i>1. Orders
				</h3>
				<div class="row orders">
					<div class="col-md-8">
						<table class="table">
							<thead>
								<tr>
									<th>Image</th>
									<th>Quantity</th>
									<th>Product Name</th>
									<th>Total</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="c" items="${cart}">
									<c:forEach var="p" items="${product}">
										<c:if test="${c.productId==p.id }">
											<tr>
												<td class="image"><a class="media-link" href="#"><i
														class="fa fa-plus"></i><img src="${contextPage}/${p.img}"
														alt="" width="100px" /></a></td>
												<td class="quantity"><input type="number"
													style="width: 60px" value="${c.amount }"
													onchange="updateCart('${c.productId}', this.value)"></td>
												<td class="description"><a href="#">${p.name }</a></td>
												<td class="total">${c.price*c.amount }<a href="#"
													onclick="removeCartItem('${c.productId}')"><i
														class="fa fa-close"></i> </a></td>
											</tr>
											<c:set var="total" value="${total+c.price*c.amount}"></c:set>
										</c:if>
									</c:forEach>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<div class="col-md-4">
						<h3 class="block-title">
							<span>Shopping cart</span>
						</h3>
						<div class="shopping-cart">
							<table>
								<tr>
									<td>Sub-total:</td>
									<td>${total}</td>
								</tr>
								<tr>
									<td>Shipping:</td>
									<td>$0</td>
								</tr>
								<tfoot>
									<tr>
										<td>Total:</td>
										<td>${total}</td>
									</tr>
								</tfoot>
							</table>
							<div class="form-group">
								<textarea class="form-control" placeholder="Send a Message"></textarea>
							</div>
							<div class="form-group">
								<input class="form-control" type="text"
									placeholder="Enter your coupon code" />
							</div>
							<button class="btn btn-theme btn-theme-dark btn-block">Apply
								Coupon</button>
						</div>
					</div>
				</div>

				<h3 class="block-title alt">
					<i class="fa fa-angle-down"></i>2. Delivery address
				</h3>
				<form action="${contextPage}/checkout" class="form-delivery">
					<div class="row">
						<div class="col-md-12">
							<div class="form-group">
								<input class="form-control" type="text" placeholder="Address"
									name="address">
							</div>
						</div>
						<div class="col-md-12">
							<div class="form-group">
								<input class="form-control" type="text"
									placeholder="Phone Number" name="phone">
							</div>
						</div>
						<div class="col-md-12">
							<div class="form-group">
								<textarea class="form-control"
									placeholder="Addıtıonal Informatıon" name="note" id="id"
									cols="30" rows="10"></textarea>
							</div>
						</div>
					</div>

					<div class="overflowed" style="padding-top: 20px">
						<a class="btn btn-theme btn-theme-dark" href="home">Home Page</a>
						<button type="submit" class="btn btn-theme pull-right	">
							Place Order</button>
					</div>
				</form>
			</c:if>
		</div>
	</section>
	<!-- /PAGE -->

	<!-- PAGE -->
	<section class="page-section">
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

</div>
