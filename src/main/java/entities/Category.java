package entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.UniqueElements;

@Entity
@Table(name = "category")
public class Category {
	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@Column(name = "name")
	@NotNull(message = "Name can not empty!")
	@NotEmpty(message = "Name can not empty!")
	private String name;
	@Column(name = "parentName")
	private String parentName;
	@Column(name = "status")
	private boolean status;
	public Category() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Category(@NotNull(message = "Name can not empty!") @NotEmpty(message = "Name can not empty!") String name,
			String parentName, boolean status) {
		super();
		this.name = name;
		this.parentName = parentName;
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
	public String getParentName() {
		return parentName;
	}
	public void setParentName(String parentName) {
		this.parentName = parentName;
	}
	public boolean isStatus() {
		return status;
	}
	public void setStatus(boolean status) {
		this.status = status;
	}
	
}
