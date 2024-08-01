<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<h3>Cập nhật đơn hàng</h3>
<form:form action="${contextPage}/admin/order/edit" method="post"
	modelAttribute="order">
	<table class="table">
		<tr>
			<td>Mã đơn hàng</td>
			<td><form:hidden path="id" /><span>${order.id}</span></td>
			<td><form:errors cssClass="error" path="id"></form:errors></td>
		</tr>
		<tr>
			<td>Tên tài khoản</td>
			<td><form:hidden path="accountId" /><span>${order.accountId}</span></td>
		</tr>
		<tr>
			<td>Tổng giá tiền</td>
			<td><form:hidden path="totalPrice" /><span>${order.totalPrice}</span></td>
		</tr>
		<tr>
			<td>Ngày giờ</td>
			<td><form:hidden path="createdAt" /><span>${order.createdAt}</span></td>
		</tr>
		<tr>
			<td>Số điện thoại</td>
			<td><form:hidden path="phone" /><span>${order.phone}</span></td>
		</tr>
		<tr>
			<td>Địa chỉ</td>
			<td><form:hidden path="address" /><span>${order.address}</span></td>
		</tr>
		<tr>
			<td>Ghi chú</td>
			<td><form:hidden path="note" /><span>${order.note}</span></td>
		</tr>
		<tr>
			<td>Trạng thái</td>
			<td>
				<select name="status">
					<option value="0" ${order.status==0?'active':'' } ${order.status!=0?'disabled':''}>Chưa xử lý</option>
					<option value="1" ${order.status==1?'active':'' } ${order.status>1?'disabled':''}>Đang xử lý</option>
					<option value="2" ${order.status==2?'active':'' }>Đã xử lý</option>
				</select>
			</td>
		</tr>
		<tr>
			<td colspan="2"><button type="submit">Cập nhật</button></td>
		</tr>
	</table>
</form:form>
<script>
	CKEDITOR.replace('description')
</script>