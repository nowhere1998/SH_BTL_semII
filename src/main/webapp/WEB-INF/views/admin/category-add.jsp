<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<h3>Thêm mới danh mục</h3>
<form:form action="${contextPage}/admin/category/add" method="post" modelAttribute="category">
	<table class="table">
		<tr>
			<td>Tên danh mục</td>
			<td><form:input path="name" /></td>
			<td><p style="color:red">${errorNameUnique}</p></td>
			<td><form:errors cssClass="error" path="name"></form:errors></td>
		</tr>
		<tr>
			<td>Tên danh mục cha</td>
			<td>
				<form:select path="parentName">
					<form:option value="men">Men</form:option>
					<form:option value="women">Woman</form:option>
					<form:option value="kid">Kid</form:option>
				</form:select>
			</td>
		</tr>
		<tr>
			<td>Trạng thái</td>
			<td><form:checkbox path="status" checked="checked" />Còn hàng</td>
		</tr>
		<tr>
			<td colspan="2"><button type="submit">Thêm mới</button></td>
		</tr>
	</table>
</form:form>