<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<h1 class="text-center">Đơn hàng</h1>
<p style="color: green;text-align: center;">${success}</p>
<p style="color: red;text-align: center;">${error}</p>
<span style="color: blue">${msg}</span>

<table class="table table-bordered">
	<tr>
		<th>Mã đơn hàng</th>
		<th>Mã tài khoản</th>
		<th>Tổng giá tiền</th>
		<th>Ngày</th>
		<th>Số điện thoại</th>
		<th>Trạng thái</th>
		<th>Địa chỉ</th>
		<th>Ghi chú</th>
		<th></th>
	</tr>
	<c:forEach items="${order}" var="o">
		<tr>
			<td>${o.id}</td>
			<td>${o.accountId}</td>
			<td>${o.totalPrice}</td>
			<td>${o.createdAt}</td>
			<td>${o.phone}</td>
			<td><c:choose>
					<c:when test="${o.status==0}">
					Chưa xử lý
				</c:when>
				<c:when test="${o.status==1}">
					Đang xử lý
				</c:when>
					<c:otherwise>
					Đã xử lý
				</c:otherwise>
				</c:choose></td>
			<td>${o.address }</td>
			<td>${p.note}</td>
			<th style="text-align: center;"><a href="${contextPage }/admin/order/edit/${o.id}"
				class="btn btn-info">Cập nhật</a> <a
				href="${contextPage }/admin/order/detail/${o.id}"
				class="btn btn-danger">Chi tiết</a></th>
		</tr>
	</c:forEach>
</table>
Trang:
<c:forEach var="i" begin="1" end="${totalPage}">
	<c:choose>
		<c:when test="${i==currentPage}">
			<span> ${i} </span>
		</c:when>
		<c:otherwise>
			<a href="${contextPage}/admin/order?currentPage=${i}"> ${i} </a>
		</c:otherwise>
	</c:choose>
</c:forEach>