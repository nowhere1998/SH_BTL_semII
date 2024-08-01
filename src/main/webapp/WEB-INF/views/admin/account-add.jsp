<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<h3>Thêm mới tài khoản</h3>
<form:form action="${contextPage}/admin/account/add" method="post" enctype="multipart/form-data" modelAttribute="account">
	<table class="table">
		<tr>
			<td>Tên tài khoản</td>
			<td><form:input path="name" /></td>
			<td><p style="color: red">${errorUniqueName}</p></td>
			<td><form:errors cssClass="error" path="name"></form:errors></td>
		</tr>
		<tr>
			<td>Email</td>
			<td><form:input path="email" /></td>
			<td><p style="color: red">${errorUniqueEmail}</p></td>
			<td><form:errors cssClass="error" path="email"></form:errors></td>
		</tr>
		<tr>
			<td>Mật khẩu</td>
			<td><form:input path="password" type="password"/></td>
			<td><form:errors cssClass="error" path="password"></form:errors></td>
		</tr>
		<tr>
			<td>Nhập lại mật khẩu</td>
			<td><input type="password" name="confirmPassword" value="${confirmPassword}"/></td>
			<td><p style="color: red">${errorConfirmPassword}</p></td>
		</tr>
		
		<tr>
			<td>Ảnh</td>
			<td><input type="file" name="file" /></td>
		</tr>
		<tr>
			<td>Role</td>
			<td>
				<form:select path="role">
					<form:option value="0">Người dùng</form:option>
					<form:option value="1">Admin</form:option>
				</form:select>
			</td>
		</tr>
		<tr>
			<td colspan="2"><button type="submit">Thêm mới</button></td>
		</tr>
	</table>
</form:form>
<script>
	CKEDITOR.replace('description')
</script>