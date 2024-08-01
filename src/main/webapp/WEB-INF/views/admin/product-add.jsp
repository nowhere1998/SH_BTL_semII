<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<h3>Thêm mới sản phẩm</h3>
<form:form action="${contextPage}/admin/product/add" method="post" enctype="multipart/form-data" modelAttribute="product">
	<table class="table">
		<tr>
			<td>Tên sản phẩm</td>
			<td><form:input path="name" /></td>
			<td><p style="color: red">${errorNameUnique}</p></td>
			<td><form:errors cssClass="error" path="name"></form:errors></td>
		</tr>
		<tr>
			<td>Tên danh mục</td>
			<td><form:select path="categoryId" items="${category }"
					itemLabel="name" itemValue="id"></form:select></td>
		</tr>
		<tr>
			<td>Giá sản phẩm</td>
			<td><form:input type="number" path="price" /></td>
			<td><p style="color: red">${errorPrice}</p></td>
			<td><form:errors cssClass="error" path="price"></form:errors></td>
		</tr>
		<tr>
			<td>Giá KM</td>
			<td><form:input type="number" path="salePrice" /></td>
			<td><p style="color: red">${errorSalePrice}</p></td>
			<td><form:errors cssClass="error" path="salePrice"></form:errors></td>
		</tr>
		<tr>
			<td>Ảnh</td>
			<td><input type="file" name="file" /></td>
		</tr>
		<tr>
			<td>Mô tả</td>
			<td>
				<form:textarea path="description"/>
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
<script>
	CKEDITOR.replace('description')
</script>