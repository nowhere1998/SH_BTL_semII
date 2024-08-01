<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<h1 class="text-center">Tài khoản</h1>
<p style="color: green;text-align: center;">${success}</p>
<p style="color: red;text-align: center;">${error}</p>
<span style="color: blue">${msg}</span>
<p>
	<a href="${contextPage }/admin/account/add" class="btn btn-primary">Thêm mới</a>
</p>
<table class="table table-bordered">
	<tr>
		<th>Mã tài khoản</th>
		<th>Tên tài khoản</th>
		<th>Email</th>
		<th>Role</th>
		<th>Ảnh</th>
		<th></th>
	</tr>
	<c:forEach items="${account}" var="a">
		<tr>
			<td>${a.id}</td>
			<td>${a.name}</td>
			<td>${a.email}</td>
			<td><c:choose>
					<c:when test="${a.role==0}">
					Người dùng
				</c:when>
					<c:otherwise>
					Admin
				</c:otherwise>
				</c:choose></td>
			<td><img alt="" src="${contextPage }/${a.img}" style="width:200px"></td>
			<th style="text-align: center;	"><a href="${contextPage }/admin/account/edit/${a.id}" class="btn btn-info">Sửa</a> <a
				href="${contextPage}/admin/account/delete/${a.id}" class="btn btn-danger"
				onclick="return confirm('Bạn có muốn xóa không?')">Xóa</a> 
			</th>
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
			<a href="${contextPage}/admin/account?currentPage=${i}"> ${i} </a>
		</c:otherwise>
	</c:choose>
</c:forEach>