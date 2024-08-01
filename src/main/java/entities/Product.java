package entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Range;

@Entity
@Table(name = "product")
public class Product {
	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@Column(name = "categoryId")
	private int categoryId;
	@Column(name = "name")
	@NotEmpty(message = "Name can not empty!")
	private String name;
	@Column(name = "price")
	@Range(min = 0,message = "Price must bigger than 0!")
	private float price;
	@Column(name = "salePrice")
	@Range(min = 0,message = "Sale price must bigger than 0!")
	private float salePrice;
	@Column(name = "img")
	private String img;
	@Column(name = "description")
	private String description;
	@Column(name = "status")
	private boolean status;
	
	public Product() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Product(int categoryId, @NotEmpty(message = "Name can not empty!") String name,
			@Range(min = 0, message = "Price must bigger than 0!") float price,
			@Range(min = 0, message = "Sale price must bigger than 0!") float salePrice, String img, String description,
			boolean status) {
		super();
		this.categoryId = categoryId;
		this.name = name;
		this.price = price;
		this.salePrice = salePrice;
		this.img = img;
		this.description = description;
		this.status = status;
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	public float getSalePrice() {
		return salePrice;
	}
	public void setSalePrice(float salePrice) {
		this.salePrice = salePrice;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public boolean isStatus() {
		return status;
	}
	public void setStatus(boolean status) {
		this.status = status;
	}
	
}
