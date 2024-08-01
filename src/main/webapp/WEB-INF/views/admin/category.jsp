<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<h1 class="text-center">Danh mục</h1>
<p style="color: green;text-align: center;">${success}</p>
<p style="color: red;text-align: center;">${error}</p>
<span style="color: blue">${msg}</span>
<p>
	<a href="${contextPage }/admin/category/add" class="btn btn-primary">Thêm mới</a>
</p>
<table class="table table-bordered">
	<tr>
		<th>Mã số</th>
		<th>Tên danh muc</th>
		<th>Tên danh mục cha</th>
		<th>Trạng thái</th>
		<th></th>
	</tr>
	<c:forEach items="${category}" var="c">
		<tr>
			<td>${c.id}</td>
			<td>${c.name}</td>
			<td>${c.parentName}</td>
			<td><c:choose>
					<c:when test="${c.status==true}">
					Còn hàng
				</c:when>
					<c:otherwise>
					Hết hàng
				</c:otherwise>
				</c:choose></td>
			<th style="text-align: center;	"><a href="${contextPage }/admin/category/edit/${c.id}" class="btn btn-info">Sửa</a> <a
				href="${contextPage }/admin/category/delete/${c.id}" class="btn btn-danger"
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
			<a href="${contextPage}/admin/category?parentName=${parentName}&currentPage=${i}"> ${i} </a>
		</c:otherwise>
	</c:choose>
</c:forEach>