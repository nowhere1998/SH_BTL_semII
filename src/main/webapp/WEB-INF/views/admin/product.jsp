<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<h1 class="text-center">Danh mục</h1>
<p style="color: green;text-align: center;">${success}</p>
<p style="color: red;text-align: center;">${error}</p>
<span style="color: blue">${msg}</span>
<p>
	<a href="${contextPage }/admin/product/add" class="btn btn-primary">Thêm
		mới</a>
</p>
<table class="table table-bordered">
	<tr>
		<th>Mã sản phẩm</th>
		<th>Mã danh mục</th>
		<th>Tên sản phẩm</th>
		<th>Giá</th>
		<th>Giá KM</th>
		<th>Trạng thái</th>
		<th>Ảnh sản phẩm</th>
		<th>Mô tả</th>
		<th></th>
	</tr>
	<c:forEach items="${product}" var="p">
		<tr>
			<td>${p.id}</td>
			<td>${p.categoryId}</td>
			<td>${p.name}</td>
			<td>${p.price}</td>
			<td>${p.salePrice}</td>
			<td><c:choose>
					<c:when test="${p.status==true}">
					Còn hàng
				</c:when>
					<c:otherwise>
					Hết hàng
				</c:otherwise>
				</c:choose></td>
			<td><img alt="" src="${contextPage }/${p.img}" style="width:200px"></td>
			<td>${p.description}</td>
			<th style="text-align: center;"><a href="${contextPage }/admin/product/edit/${p.id}"
				class="btn btn-info">Sửa</a> <a
				href="${contextPage }/admin/product/delete/${p.id}"
				class="btn btn-danger"
				onclick="return confirm('Bạn có muốn xóa không?')">Xóa</a></th>
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
			<a href="${contextPage}/admin/product?categoryId=${categoryId}&currentPage=${i}"> ${i} </a>
		</c:otherwise>
	</c:choose>
</c:forEach>