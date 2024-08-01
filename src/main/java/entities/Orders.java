package entities;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "orders")
public class Orders {
	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@Column(name = "accountId")
	private int accountId;
	@Column(name = "totalPrice")
	private float totalPrice;
	@Column(name = "createdAt")
	private String createdAt;
	@Column(name = "status")
	private int status;
	@Column(name = "phone")
	private int phone;
	@Column(name = "address")
	private String address;
	@Column(name = "note")
	private String note;
	public Orders() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Orders(int accountId, float totalPrice, String createdAt, int status, int phone, String address, String note) {
		super();
		this.accountId = accountId;
		this.totalPrice = totalPrice;
		this.createdAt = createdAt;
		this.status = status;
		this.phone = phone;
		this.address = address;
		this.note = note;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getAccountId() {
		return accountId;
	}
	public void setAccountId(int accountId) {
		this.accountId = accountId;
	}
	public float getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(float totalPrice) {
		this.totalPrice = totalPrice;
	}
	public String getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(String createdAt) {
		this.createdAt = createdAt;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public int getPhone() {
		return phone;
	}
	public void setPhone(int phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	
}
