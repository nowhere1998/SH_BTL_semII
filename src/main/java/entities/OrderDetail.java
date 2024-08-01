package entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "orderDetail")
public class OrderDetail {
	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@Column(name = "productId")
	private int productId;
	@Column(name = "orderId")
	private int orderId;
	@Column(name = "amount")
	private int amount;
	@Column(name = "price")
	private float price;
	public OrderDetail() {
		super();
		// TODO Auto-generated constructor stub
	}
	public OrderDetail(int productId, int orderId, int amount, float price) {
		super();
		this.productId = productId;
		this.orderId = orderId;
		this.amount = amount;
		this.price = price;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
}
