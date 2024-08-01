package entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

@Entity
@Table(name = "users")
public class Users {
	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@Column(name = "name")
	@NotNull(message = "Name can not null!")
	private String name;
	@Column(name = "email")
	@NotNull(message = "Email can not null!")
	private String email;
	@Column(name = "password")
	@NotNull(message = "Password can not null!")
	private String password;
	@Column(name = "role")
	private int role;
	@Column(name = "img")
	private String img;

	public Users() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Users(String name, String email, String password, int role, String img) {
		super();
		this.name = name;
		this.email = email;
		this.password = password;
		this.role = role;
		this.img = img;
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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getRole() {
		return role;
	}

	public void setRole(int role) {
		this.role = role;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

}
