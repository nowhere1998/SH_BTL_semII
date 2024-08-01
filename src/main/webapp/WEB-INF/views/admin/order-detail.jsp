<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<h3>Chi tiết đơn hàng</h3>
<table class="table">
	<tr>
		<td>Tên sản phẩm</td>
		<td>Số lượng</td>
		<td>Giá tiền</td>
		<td>Tổng tiền</td>
	</tr>
	<c:forEach var="l" items="${list}">
		<tr>
			<c:forEach var="p" items="${product}">
				<c:if test="${p.id==l.productId }">
					<td>${p.name}</td>
				</c:if>
			</c:forEach>
			<td>${l.amount}</td>
			<td>${l.price}</td>
			<td>${l.price*l.amount}</td>
		</tr>
	</c:forEach>
</table>
<a href="${contextPage}/admin/order">Back</a>
<script>
	CKEDITOR.replace('description')
</script>