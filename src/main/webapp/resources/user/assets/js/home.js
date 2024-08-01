function addProduct(id) {
	$.get(path + "/addProduct/" + id);
	window.alert("Add to cart success!");
}
function updateCart(id, value) {
	$.get(path + "/updateCart/" + id + "/" + value, function() {
		window.location.reload();
	});
}

function removeCartItem(id) {
	if (confirm('Bạn có muốn xóa không?')) {
		$.get(path + "/removeCartItem/" + id, function() {
			window.location.reload();
		});
	}
}